import cv2
import os
import glob #if this module not found use <pip install glob2> 

#Creating folder to store extracted frames
try:
    # creating a folder named data
    if not os.path.exists('../Dataset/extracted/20201127'):
        os.makedirs('../Dataset/extracted/20201127')

# if not created then raise error
except OSError:
    print ('Error: Creating directory named extracted')

video_folder = "../Dataset/To extract/20201127" #change your folder containing videos here
video_files = glob.glob(f"{video_folder}/*.mp4")

for video in video_files:
    base = os.path.basename(video)
    filename = os.path.splitext(base)[0]
    vidcap = cv2.VideoCapture(f"{video_folder}/{base}")
    success,image = vidcap.read()
    count = 0 #current frame
    while success:
        vidcap.set(cv2.CAP_PROP_POS_MSEC,(count*5000)) # set to 1 frame per 5 seconds
        cv2.imwrite(f"../Dataset/extracted/20201127/{filename}_frame{count}.jpg", image)     # save frame as JPEG file      
        success,image = vidcap.read()
        print('Read a new frame: ', success, f"File: extracted/{filename}_frame{count}.jpg")
        count += 1
