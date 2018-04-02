import processing.serial.*;
Serial myPort;

void setup() {
  myPort = new Serial(this, "COM4", 9600);
  size(800, 600);
}

void draw() {

  while(myPort.available() > 0){  
    background(255);
    fill(255);
    ellipse(250, 300, 50, 50);
    ellipse(350, 300, 50, 50);  
    ellipse(450, 300, 50, 50);
    ellipse(550, 300, 50, 50);  
    String clr = myPort.readStringUntil('\n');
    if (clr != null){
      float clr_f = float(clr);
      if (clr_f == 1){
        fill(#FFB6C1);
        ellipse(250, 300, 50, 50);
      }  
      
      else if (clr_f == 2){
        fill(#FFB6C1);
        ellipse(350, 300, 50, 50);      
      }
      
      else if (clr_f == 3){
        fill(#FFB6C1);
        ellipse(450, 300, 50, 50);      
      }
      
      else if (clr_f == 4){
        fill(#FFB6C1);
        ellipse(550, 300, 50, 50);
      }
      
      else{
        fill(255);
        ellipse(250, 300, 50, 50);
        ellipse(350, 300, 50, 50);  
        ellipse(450, 300, 50, 50);
        ellipse(550, 300, 50, 50);  
      }
      
    }
  }
}