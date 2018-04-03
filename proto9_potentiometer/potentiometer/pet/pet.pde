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
      if (val_p_f < mini + (maxi - mini)/4){
        fill(#FFB6C1);
        ellipse(248, 334, 10, 10);
      }
      
      else if (val_p_f < mini + (maxi - mini)/2){
        fill(#FFB6C1);
        ellipse(316, 449, 10, 10);
      }
      
      else if (val_p_f < mini + 3 * (maxi - mini)/4){
        fill(#FFB6C1);
        ellipse(436, 463, 10, 10);
      }
      
      else{
        fill(#FFB6C1);
        ellipse(529, 334, 10, 10);
      }
    }
  }
}