import processing.serial.*;
Serial myPort;
PImage pic;

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

void setup() {
  myPort = new Serial(this, "COM4", 9600);
  size(800, 600);
  pic = loadImage("ldr_hand.gif");
  distX = endX - beginX;
  distY = endY - beginY;
  image(pic, 0, 0); 
}

void draw(){
   while(myPort.available() > 0){  
    pct = 0.0;
    beginX = x;
    beginY = y;
    rect(0, 0, width, height);
     String val_ldr = myPort.readStringUntil('\n');
     if (val_ldr != null){
       int flag = 0;
       float val_ldr_f = float(val_ldr);
       if (val_ldr_f == 1){
         endX = 463;
         endY = 359;
       }
       else if (val_ldr_f == 2){
         endX = 444;
         endY = 361;
       }     
       else if (val_ldr_f == 3){
         endX = 417;
         endY = 366;
       }     
       else if (val_ldr_f == 4){
         endX = 388;
         endY = 370;
       }     
       else if (val_ldr_f == 5){
         endX = 364;
         endY = 375;
       }        
       else{
         image(pic, 0, 0); 
         flag = 1;
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
     }
   }
}