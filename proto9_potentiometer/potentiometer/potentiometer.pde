import processing.serial.*;
Serial myPort;
PImage pic;


void setup() {
  myPort = new Serial(this, "COM4", 9600);
  size(800, 600);
  pic = loadImage("track.gif");
  image(pic, 0, 0); 
}