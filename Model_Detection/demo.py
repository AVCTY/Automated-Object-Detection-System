# Referenced from https://github.com/Sharpiless/yolox-deepsort

from AIDetector_pytorch import Detector
import imutils, argparse
import cv2
import mysql.connector
from mysql.connector import Error
import datetime

def main(vid_path):
    class_id = {"basedcoat" : 1, "skimcoat": 2, "thinbed": 4, "tilefix": 5, "plastering": 6, "screeding": 7, "tileadhesive": 8, "brickjoint": 9}
    count = [0, 0, 0, 0, 0, 0, 0, 0]
    name = 'demo'

    det = Detector()
    cap = cv2.VideoCapture(vid_path)
    fps = int(cap.get(5))
    print('fps:', fps)
    t = int(1000/fps)

    videoWriter = None

    while True:

        # try:
        _, im = cap.read()
        if im is None:
            break
        
        result, ids, clss, tempCount = det.feedCap(im)
        result = result['frame']
        result = imutils.resize(result, height=500)

        color=(0,0,255)
        thickness = 1
        font = cv2.FONT_HERSHEY_SIMPLEX
        fontScale = 0.5
        cv2.putText(result, "Count: ", (640, 20), font, fontScale, color, thickness, cv2.LINE_AA)
        cv2.putText(result, "basedcoat " + str(tempCount[0]), (700, 20), font, fontScale, color, thickness, cv2.LINE_AA)
        cv2.putText(result, "skimcoat " + str(tempCount[1]), (700, 40), font, fontScale, color, thickness, cv2.LINE_AA)
        cv2.putText(result, "thinbed " + str(tempCount[2]), (700, 60), font, fontScale, color, thickness, cv2.LINE_AA)
        cv2.putText(result, "tilefix " + str(tempCount[3]), (700, 80), font, fontScale, color, thickness, cv2.LINE_AA)
        cv2.putText(result, "plastering " + str(tempCount[4]), (700, 100), font, fontScale, color, thickness, cv2.LINE_AA)
        cv2.putText(result, "screeding " + str(tempCount[5]), (700, 120), font, fontScale, color, thickness, cv2.LINE_AA)
        cv2.putText(result, "tileadhesive " + str(tempCount[6]), (700, 140), font, fontScale, color, thickness, cv2.LINE_AA)
        cv2.putText(result, "brickjoint " + str(tempCount[7]), (700, 160), font, fontScale, color, thickness, cv2.LINE_AA)

        if videoWriter is None:
            fourcc = cv2.VideoWriter_fourcc(
                'm', 'p', '4', 'v')  # opencv3.0
            videoWriter = cv2.VideoWriter(
                vid_path + "_result.mp4", fourcc, fps, (result.shape[1], result.shape[0]))

        videoWriter.write(result)
        cv2.imshow(name, result)
        cv2.waitKey(t)

        if cv2.getWindowProperty(name, cv2.WND_PROP_AUTOSIZE) < 1: 
            break
        # except Exception as e:
        #     print(e)
        #     break   
    
    cap.release()
    videoWriter.release()
    cv2.destroyAllWindows()

    """
    try:
        connection = mysql.connector.connect(host='amoidb.c6zgrapmgchi.us-east-1.rds.amazonaws.com',
                                         database='sys',
                                         user='admin',
                                         password='Cract123+')

        if connection.is_connected():
            
            now = datetime.datetime.now()
            mysqlCurTime = now.strftime('%Y-%m-%d')
            
            checkingQuery = "SELECT * FROM InventoryCount WHERE datetoday = %s"
            cursor = connection.cursor()
            cursor.execute(checkingQuery, (mysqlCurTime,))
            result = cursor.fetchall()
            row_count = cursor.rowcount

            if row_count == 0:
                query = "INSERT INTO InventoryCount (productID, noOfBags, datetoday) VALUES (%s, %s, %s)"
                records_to_update = [
                    (class_id["basedcoat"], 0, mysqlCurTime),
                    (class_id["skimcoat"], 0, mysqlCurTime),
                    (class_id["thinbed"], 0, mysqlCurTime),
                    (class_id["tilefix"], 0, mysqlCurTime),
                    (class_id["plastering"], 0, mysqlCurTime),
                    (class_id["screeding"], 0, mysqlCurTime),
                    (class_id["tileadhesive"], 0, mysqlCurTime),
                    (class_id["brickjoint"], 0, mysqlCurTime)
                ]

                insertCursor = connection.cursor()
                insertCursor.executemany(query, records_to_update)
                connection.commit()
                insertCursor.close()

            initCursor = connection.cursor()
            initQuery = "SELECT noOfBags FROM InventoryCount WHERE datetoday = %s"
            initCursor.execute(initQuery, (mysqlCurTime,))
            initResult = initCursor.fetchall()

            #Initialise count list to the number of bags in db
            for i in range(len(initResult)):
                count[i] = initResult[i][0]

            print(count)

            #Add detected bags and intial bags together
            for i in range(8):
                count[i] += tempCount[i]

            print(count)

            initCursor.close()
    """
            #query = """UPDATE InventoryCount SET noOfBags = %s WHERE datetoday = %s AND productID = %s"""
    """        
            records_to_update = [
                (count[0], mysqlCurTime, class_id["basedcoat"]),
                (count[1], mysqlCurTime, class_id["skimcoat"]),
                (count[2], mysqlCurTime, class_id["thinbed"]),
                (count[3], mysqlCurTime, class_id["tilefix"]),
                (count[4], mysqlCurTime, class_id["plastering"]),
                (count[5], mysqlCurTime, class_id["screeding"]),
                (count[6], mysqlCurTime, class_id["tileadhesive"]),
                (count[7], mysqlCurTime, class_id["brickjoint"])
            ]

            cursor2 = connection.cursor()
            cursor2.executemany(query, records_to_update)

    except Error as e:
        print("Error while connecting to MySQL", e)
    finally:
        if connection.is_connected():
            connection.commit()
            cursor.close()
            cursor2.close()
            connection.close()
            print("MySQL connection is closed")
    """
if __name__ == '__main__':
    parser = argparse.ArgumentParser("YOLOX-Tracker")
    parser.add_argument('--source', type=str, default='test_Trim.mp4', help='source')  # file/folder, 0 for webcam
    args = parser.parse_args()
    main(args.source)