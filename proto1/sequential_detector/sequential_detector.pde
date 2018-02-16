import processing.serial.*;
Serial myPort;
import controlP5.*;
ControlP5 cp5;

void setup(){
  size(800, 800);
  myPort = new Serial(this, "COM4", 9600);
  cp5 = new ControlP5(this);
  cp5.addSlider("slider").setPosition(400, 50).setRange(-300, 300);
  background(#C0E1EA);
  ellipse(400, 200, 100, 100);
  ellipse(400, 400, 100, 100);
  ellipse(400, 600, 100, 100);
}

void draw(){
  while(myPort.available() > 0){
  fill(0);
  ellipse(400, 200, 100, 100);
  ellipse(400, 400, 100, 100);
  ellipse(400, 600, 100, 100);
  String val1 = myPort.readStringUntil('\t');
  String val2 = myPort.readStringUntil('\t');
  String val3 = myPort.readStringUntil('\t');
  String val4 = myPort.readStringUntil('\n');
  if (val1 != null && val2 != null && val3 != null){
    float v1 = float(val1);
    if (v1 == 1.0){
      fill(#04B1CE);
      ellipse(400, 200, 100, 100);
    }
    float v2 = float(val2);
    if (v2 == 1.0){
      fill(#04C1CE);
      ellipse(400, 400, 100, 100);
    }
    float v3 = float(val3);
    if (v3 == 1.0){
      fill(#04D1CE);
      ellipse(400, 600, 100, 100);
    }
    float v4 = float(val4);
    cp5.addSlider("slider").setPosition(400, 50).setRange(-300, 300).setValue(v4);
    }
  }
}