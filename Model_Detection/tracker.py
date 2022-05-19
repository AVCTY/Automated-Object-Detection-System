from deep_sort.utils.parser import get_config
from deep_sort.deep_sort import DeepSort
import torch
import cv2

palette = (2 ** 11 - 1, 2 ** 15 - 1, 2 ** 20 - 1)
cfg = get_config()
cfg.merge_from_file("deep_sort/configs/deep_sort.yaml")
deepsort = DeepSort(cfg.DEEPSORT.REID_CKPT,
                    max_dist=cfg.DEEPSORT.MAX_DIST, min_confidence=cfg.DEEPSORT.MIN_CONFIDENCE,
                    nms_max_overlap=cfg.DEEPSORT.NMS_MAX_OVERLAP, max_iou_distance=cfg.DEEPSORT.MAX_IOU_DISTANCE,
                    max_age=cfg.DEEPSORT.MAX_AGE, n_init=cfg.DEEPSORT.N_INIT, nn_budget=cfg.DEEPSORT.NN_BUDGET,
                    use_cuda=True)
classes = ["basedcoat", "skimcoat", "thinbed", "tilefix", "plastering", "screeding", "tileadhesive", "brickjoint"]
# if vid_cap:  # video
#     fps = vid_cap.get(cv2.CAP_PROP_FPS)
#     w = int(vid_cap.get(cv2.CAP_PROP_FRAME_WIDTH))
#     h = int(vid_cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

count_BC, count_SC, count_TB, count_TF, count_P, count_SD, count_TA, count_BJ  = 0, 0, 0, 0, 0, 0, 0, 0
count = [count_BC, count_SC, count_TB, count_TF, count_P, count_SD, count_TA, count_BJ]
data = []


def count_obj(box,id):
    global count_BC, count_SC, count_TB, count_TF, count_P, count_SD, count_TA, count_BJ, data
    if id not in data:
        if id[1] == classes[0]:
            count_BC += 1
        elif id[1] == classes[1]:
            count_SC += 1
        elif id[1] == classes[2]:
            count_TB += 1
        elif id[1] == classes[3]:
            count_TF += 1
        elif id[1] == classes[4]:
            count_P += 1
        elif id[1] == classes[5]:
            count_SD += 1
        elif id[1] == classes[6]:
            count_TA += 1
        elif id[1] == classes[7]:
            count_BJ += 1
        data.append(id)

    return [count_BC, count_SC, count_TB, count_TF, count_P, count_SD, count_TA, count_BJ], data


def plot_bboxes(image, bboxes, line_thickness=None):
    # Plots one bounding box on image img
    tl = line_thickness or round(
        0.002 * (image.shape[0] + image.shape[1]) / 2) + 1  # line/font thickness
    for (x1, y1, x2, y2, cls_id, pos_id) in bboxes:
        color = (0, 255, 0)
        c1, c2 = (x1, y1), (x2, y2)
        cv2.rectangle(image, c1, c2, color, thickness=tl, lineType=cv2.LINE_AA)
        tf = max(tl - 1, 1)  # font thickness
        t_size = cv2.getTextSize(cls_id, 0, fontScale=tl / 3, thickness=tf)[0]
        c2 = c1[0] + t_size[0], c1[1] - t_size[1] - 3
        cv2.rectangle(image, c1, c2, color, -1, cv2.LINE_AA)  # filled
        cv2.putText(image, '{}'.format(cls_id), (c1[0], c1[1] - 2), 0, tl / 3,
                    [225, 255, 255], thickness=tf, lineType=cv2.LINE_AA)

        #count
        if bboxes != []:
            for i in range(len(bboxes)):
                count, _ = count_obj(bboxes[i],[pos_id, cls_id])
                c = int(pos_id)  # integer class
                # label = f'{id} {names[c]} {conf:.2f}'
                # annotator.box_label(bboxes, label, color=colors(c, True))


    return image, count


def update_tracker(target_detector, image):

    global count
    new_faces = []
    outputs = []
    _, bboxes = target_detector.detect(image)

    bbox_xywh = []
    confs = []
    clss = []

    if bboxes != []:
        for x1, y1, x2, y2, cls_id, conf in bboxes:

            obj = [
                int((x1+x2)/2), int((y1+y2)/2),
                x2-x1, y2-y1
            ]
            bbox_xywh.append(obj)
            confs.append(conf)
            clss.append(cls_id)

        xywhs = torch.Tensor(bbox_xywh)
        confss = torch.Tensor(confs)

        outputs = deepsort.update(xywhs, confss, clss, image)

    bboxes2draw = []
    face_bboxes = []
    current_ids = []

    if (outputs != []):
        for value in list(outputs):
            x1, y1, x2, y2, cls_, track_id = value
            bboxes2draw.append(
                (x1, y1, x2, y2, cls_, track_id)
            )
            current_ids.append(track_id)
            if cls_ == 'face':
                if not track_id in target_detector.faceTracker:
                    target_detector.faceTracker[track_id] = 0
                    face = image[y1:y2, x1:x2]
                    new_faces.append((face, track_id))
                face_bboxes.append(
                    (x1, y1, x2, y2)
                )

        ids2delete = []
        for history_id in target_detector.faceTracker:
            if not history_id in current_ids:
                target_detector.faceTracker[history_id] -= 1
            if target_detector.faceTracker[history_id] < -5:
                ids2delete.append(history_id)

        for ids in ids2delete:
            target_detector.faceTracker.pop(ids)
            print('-[INFO] Delete track id:', ids)

        image, count = plot_bboxes(image, bboxes2draw)

    return image, new_faces, face_bboxes, current_ids, clss, count
