import processing.serial.*;
Serial myPort;
PImage pic;

float x = 100;
float y = 100;
float angle1 = 0.0;
float segLength = 150;

void setup() {
  myPort = new Serial(this, "COM5", 9600);
  size(800, 600);
  //stroke(rgb)
  pic = loadImage("flick_drop.gif");
  image(pic, 0, 0); 
  strokeWeight(20.0);
  stroke(#FFB6C1);
}

void draw() {

  while(myPort.available() > 0){ 
    background(255);
    fill(#FFB6C1);
    image(pic, 0, 0); 
    String val_acc = myPort.readStringUntil('\n');
    if (val_acc != null){
      float val_acc_f = float(val_acc);
      float in_min = 0;
      float out_max = 3.14/4;
      float out_min = 0;
      float in_max = 10;
      float map_acc_f = (val_acc_f - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
      float angle = map_acc_f;
 
      x = 207;
      y = 302;
 
      segment(x, y, angle); 
      ellipse(x + (cos(angle) * segLength), y + (sin(angle) * segLength), 20, 20); 
      image(pic, 0, 0); 
    }
  }
}

void segment(float x, float y, float a) {
  pushMatrix();

  translate(x, y);
  rotate(a);
  //fill(0);
  line(0, 0, segLength, 0);
  popMatrix();
}