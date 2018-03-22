from collections import deque
import numpy as np
import argparse
import imutils
import cv2

colors_to_track = [[(80, 100, 100), (100, 255, 255)], [(50, 100, 100), (70, 255, 255)]]
det_points = []

for i in range(len(colors_to_track)):
	det_points.append(deque(maxlen=2))

camera = cv2.VideoCapture(0)
# 
while True:
	(grabbed, frame) = camera.read()
	frame = cv2.flip(frame, 1)
	frame = imutils.resize(frame, width=1366, height=768)
	# frame = imutils.resize(frame, width=600)
	
	hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
	
	# canvas = np.full((768, 1366, 3), 255)
	canvas = cv2.imread("stickman.jpg")
	
	for k in range(len(colors_to_track)):
		mask = cv2.inRange(hsv, colors_to_track[k][0], colors_to_track[k][1])
		mask = cv2.erode(mask, None, iterations=2)
		mask = cv2.dilate(mask, None, iterations=2)

		cnts = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL,
			cv2.CHAIN_APPROX_SIMPLE)[-2]
		center = None
		if len(cnts) > 0:
			c = max(cnts, key=cv2.contourArea)
			((x, y), radius) = cv2.minEnclosingCircle(c)
			M = cv2.moments(c)
			center = (int(M["m10"] / M["m00"]), int(M["m01"] / M["m00"]))
			if radius > 10:
				cv2.circle(frame, (int(x), int(y)), int(radius),
					(0, 255, 255), 2)
				cv2.circle(frame, center, 5, (0, 0, 255), -1)
		det_points[k].appendleft(center)
		
		# mask = np.full((768, 1366, 3), 255)
		# canvas = frame
		
		for i in xrange(1, len(det_points[k])):
			if det_points[k][i - 1] is None or det_points[k][i] is None:
				continue
			thickness = int(np.sqrt(5 / float(i + 1)) * 2.5)
			cv2.line(canvas, det_points[k][i - 1], det_points[k][i], (0, 0, 255), thickness)
			cv2.line(canvas, (683, 300), det_points[k][i], (0, 0, 255), thickness)
		cv2.imshow("Frame", canvas)

	key = cv2.waitKey(1) & 0xFF
	if key == ord("q"):
		break

camera.release()
cv2.destroyAllWindows()