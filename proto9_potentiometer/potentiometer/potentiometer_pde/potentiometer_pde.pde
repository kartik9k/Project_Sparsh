import processing.serial.*;
Serial myPort;

PImage pic;


void setup() {
  myPort = new Serial(this, "COM4", 9600);
  size(800, 600);
  noStroke();
  pic = loadImage("chain.gif");
  image(pic, 0, 0); 
}

void draw() {
  while(myPort.available() > 0){  
    String val_p = myPort.readStringUntil('\n');
    float mini = 300;
    float maxi = 600;
    if (val_p != null && c_val_p != null){
      float val_p_f = float(val_p);
      if (val_p_f < mini + maxi 