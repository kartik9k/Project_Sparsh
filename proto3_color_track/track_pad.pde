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
  pic = loadImage("track.gif");
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
    String val_p = myPort.readStringUntil('\t');
    String c_val_p = myPort.readStringUntil('\n');
    
    if (val_p != null && c_val_p != null){
      float val_p_f = float(val_p);
      float c_val_p_f = float(c_val_p);
      if (val_p_f == 1){
        endX = 222;
        endY = 111;
      }
      else if (val_p_f == 2){
        endX = 229;
        endY = 155;
      }     
      else if (val_p_f == 3){
        endX = 247;
        endY = 191;
      }     
      else if (val_p_f == 4){
        endX = 280;
        endY = 229;
      }     
      else if (val_p_f == 5){
        endX = 313;
        endY = 251;
      }
      else if (val_p_f == 6){
        endX = 353;
        endY = 263;
      }
      else if (val_p_f == 7){
        endX = 398;
        endY = 265;
      }
      else{
        image(pic, 0, 0); 
        flag = 1;
        //continue;
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
          ellipse(x, y, 20, 20);
          fill(255);
        }
        flag = 0;
      }
      
      if (c_val_p_f == 1){
        endX = 427;
        endY = 313;
      }
      else if (c_val_p_f == 2){
        endX = 440;
        endY = 340;
      }     
      else if (c_val_p_f == 3){
        endX = 425;
        endY = 365;
      }     
      else if (c_val_p_f == 4){
        endX = 400;
        endY = 377;
      }     
      else if (c_val_p_f == 5){
        endX = 373;
        endY = 364;
      }
      else if (c_val_p_f == 6){
        endX = 360;
        endY = 342;
      }
      else if (c_val_p_f == 7){
        endX = 375;
        endY = 311;
      }
      else if (c_val_p_f == 8){
        endX = 400;
        endY = 300;
      }
      else{
        image(pic, 0, 0);
        flag1 = 1;
      }
      
      if (flag1 != 1){
        distX = endX - beginX;
        distY = endY - beginY;
        print (endX, endY);
        pct = 0.0;
        beginX = x;
        beginY = y;
        
        while (pct < 1.0) {
          pct += step;
          x = beginX + (pct * distX);
          if (endX < x)        
            y = beginY + (pow(pct, exponent) * distY);
          else 
            y = beginY + (pow(pct, 1/exponent) * distY);
          image(pic, 0, 0); 
          fill(#FFB6C1);
          ellipse(x, y, 20, 20);
          fill(255);
        }
      }
    }
  }
}