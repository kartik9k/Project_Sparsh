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
  //myPort = new Serial(this, "COM4", 9600);
  size(800, 600);
  pic = loadImage("track.gif");
  distX = endX - beginX;
  distY = endY - beginY;
  image(pic, 0, 0); 
}

void draw(){
  int i;
  pct = 0.0;
  beginX = x;
  beginY = y;
  for (i = 0; i < 100; i++){
        
  }  
}