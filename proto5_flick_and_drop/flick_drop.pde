import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;
PImage img1, img2, img3;

void setup()
{
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = "COM9"; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  size(1920, 1080);
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  //image(img, 0, 0, 1920, 1080);
}
void draw()
{
  while ( myPort.available() > 0) {  // If data is available,
  val = myPort.readStringUntil('\n');         // read it and store it in val
  if (val != null){
    float sensorVal = float(val);
    println(sensorVal);
    if (sensorVal >= 6){
      image(img1, 0, 0, 1920, 1080);
      println("1");
      }
    else if (sensorVal >= 3){
      image(img2, 0, 0, 1920, 1080);
      println("2");
      }
    else if (sensorVal >= 0){
      image(img3, 0, 0, 1920, 1080);
      println("3");
      }  
    //image(img, 0, 0, 1920, 1080);
    }
  } 
     
}
