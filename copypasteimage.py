import cv2

img = cv2.imread('1.jpg')

for i in range(148):
    cv2.imwrite(str(i+3) + '.jpg', img)