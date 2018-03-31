import processing.serial.*;
Serial myPort;
PImage pic;
float x, y;

void setup() {
  myPort = new Serial(this, "COM4", 9600);
  size(800, 600);
  pic = loadImage("2d_tracl.gif");
  image(pic, 0, 0); 
  fill(#FFB6C1);
}

void draw() {

  while(myPort.available() > 0){  
      image(pic, 0, 0);
    String val_y = myPort.readStringUntil('\t');
    String val_x = myPort.readStringUntil('\n');
    
    if (val_x != null && val_y != null){
      float val_x_f = float(val_x);
      float val_y_f = float(val_y);
      

      if (val_y_f == 1){
        y = 395;
        if (val_x_f == 1){
          x = 345;
        }
        else if (val_x_f == 2){
          x = 401;
        }
        else if (val_x_f == 3){
          x = 455;
        }
        ellipse(x, y, 20, 20);
      }
      
      else if (val_y_f == 2){
        y = 435;
        if (val_x_f == 1){
          x = 345;
        }
        else if (val_x_f == 2){
          x = 401;
        }
        else if (val_x_f == 3){
          x = 455;
        }
        ellipse(x, y, 20, 20);
      }
      
    }
  }
}