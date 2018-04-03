import processing.serial.*;
Serial myPort;

float[] x = new float[20];
float[] y = new float[20];
float segLength = 18;

void setup() {
  myPort = new Serial(this, "COM4", 9600);
  size(800, 600);
  strokeWeight(30);
  stroke(255, 100);
}

void draw() {

  while(myPort.available() > 0){  
    background(255);
    String clr = myPort.readStringUntil('\n');
    if (clr != null){
      float clr_f = float(clr);
      if (clr_f != 0){
        dragSegment(0, mouseX, mouseY, clr_f);
        for(int i=0; i<x.length-1; i++){
          dragSegment(i+1, x[i], y[i], clr_f);
        }
      }
    }
  }
}


void dragSegment(int i, float xin, float yin, float clr) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle, clr);
}

void segment(float x, float y, float a, float clr) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  if (clr == 1)
    stroke(#FFFF00);
  else if (clr == 2)
    stroke(#FFA500);
  else if (clr == 3)
    stroke(#00FF00);
  //print (clr);
  line(0, 0, segLength, 0);
  popMatrix();
}