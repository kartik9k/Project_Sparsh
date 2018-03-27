import processing.serial.*;
Serial myPort;
float x1, y1, x2, y2;
PImage pic;

void setup() {
  myPort = new Serial(this, "COM4", 9600);
  size(800, 600);
  noStroke();
  pic = loadImage("magnetic_proc.gif");
  image(pic, 0, 0);
  strokeWeight(5.0);
  stroke(#FFB6C1);
}

void draw() {
  while(myPort.available() > 0){
    image(pic, 0, 0); 
    String val_p = myPort.readStringUntil('\n');

    if (val_p != null){
      int flag = 0;
      float val_p_f = float(val_p);
      if (val_p_f == 1){
        x1 = 494;
        y1 = 295;
        
        x2 = 399;
        y2 = 116;
      }
      else if (val_p_f == 2){
        x1 = 494;
        y1 = 295;
        
        x2 = 430;
        y2 = 51;
      }     
      else if (val_p_f == 3){
        x1 = 400;
        y1 = 22;
        
        x2 = 399;
        y2 = 116;
      }     
      else{
        image(pic, 0, 0); 
        flag = 1;
        //continue;
      }   
      
      if (flag != 1){
        line(x1, y1, x2, y2);
        fill(#FFB6C1);
        ellipse(x1, y1, 20, 20);
        ellipse(x2, y2, 20, 20);
      }
  }

  }
}