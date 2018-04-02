import processing.serial.*;
Serial myPort;

float beginX = 0.0;  // Initial x-coordinate
float beginY = 0.0;  // Initial y-coordinate
float endX = 0.0;   // Final x-coordinate
float endY = 0.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 2;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // Size of each step along the path
float pct = 0.0; 

PImage pic;


void setup() {
  myPort = new Serial(this, "COM4", 9600);
  size(800, 600);
  noStroke();
  pic = loadImage("necklace_proc_pic.gif");
  distX = endX - beginX;
  distY = endY - beginY;
  image(pic, 0, 0); 
}

void draw() {
  while(myPort.available() > 0){  
    pct = 0.0;
    beginX = x;
    beginY = y;
    rect(0, 0, width, height);
    int flag = 0, flag1 = 0;
    String which_p = myPort.readStringUntil('\t');
    String which_p_p = myPort.readStringUntil('\n');
    if (which_p != null && which_p_p != null){
      float val_p = float(which_p);
      float loc_p = float(which_p_p);
      
      //int flag = 0;
      if (val_p == 0){
        image(pic, 0, 0); 
        flag = 1;
      }
        
      else if (val_p == 1){
        if (loc_p == 1){
          endX = 345;
          endY = 250;
        }
        else if (loc_p == 2){
          endX = 340;
          endY = 263;
        }
        else if (loc_p == 3){
          endX = 332;
          endY = 273;
        }       
      }
      else if (val_p == 2){
        if (loc_p == 1){
          endX = 408;
          endY = 303;
        }
        else if (loc_p == 2){
          endX = 418;
          endY = 303;
        }
        else if (loc_p == 3){
          endX = 429;
          endY = 303;
        }       
      }
      else if (val_p == 3){
        if (loc_p == 1){
          endX = 501;
          endY = 280;
        }
        else if (loc_p == 2){
          endX = 496;
          endY = 269;
        }
        else if (loc_p == 3){
          endX = 488;
          endY = 256;
        }       
      }
      
      if (flag != 1){
        distX = endX - beginX;
        distY = endY - beginY;
        
        while (pct < 1.0) {
          pct += step;
          x = beginX + (pct * distX);
          if (endX < x)        
            y = beginY + (pow(pct, exponent) * distY);
          else 
            y = beginY + (pow(pct, 1/exponent) * distY);
          image(pic, 0, 0); 
          fill(#FFB6C1);
          ellipse(x, y, 10, 10);
          fill(255);
        }
      }
    }
  }
}