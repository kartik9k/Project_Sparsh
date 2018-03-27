from collections import deque
import numpy as np
import argparse
import imutils
import cv2
from pymouse import PyMouse
import serial
import time 

ser = serial.Serial('/dev/ttyACM0', 9600)

mouse = PyMouse()

lower = (80, 100, 100)
upper = (100, 255, 255)
pts = deque(maxlen=5)

camera = cv2.VideoCapture(0)
prev = 0

while True:
	(grabbed, frame) = camera.read()
	frame = cv2.flip(frame, 1)

	frame = imutils.resize(frame, width=1366, height=768)
	hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

	mask = cv2.inRange(hsv, lower, upper)
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

		
	
	pts.appendleft(center)
	mask = np.full((768, 1366, 3), 255)
	# mask = frame
	for i in xrange(1, len(pts)):
		if pts[i - 1] is None or pts[i] is None:
			continue

		thickness = int(np.sqrt(5 / float(i + 1)) * 2.5)
		cv2.line(mask, pts[i - 1], pts[i], (0, 0, 255), thickness)
		# x_int = np.interp(pts[i][0], [1, 450], [1, 1366])
		# y_int = np.interp(pts[i][1], [1, 600], [1, 768])

		# mouse.move(x_int, y_int)
		mouse.move(pts[i][0], pts[i][1])

	read = ser.readline()
	if (read != ''):
		read = int(read)
		if read == 1:
			if prev != 1:
				x, y = mouse.position()
				mouse.click(x, y, 1)

		prev = read

	cv2.imshow("Frame", mask)
	key = cv2.waitKey(1) & 0xFF

	if key == ord("q"):
		break

camera.release()
cv2.destroyAllWindows()