#include <RedBot.h>

int hallSensor1 = A3;    // with 5 on pendant
int hallSensor2 = A2; //with 3.3 on earring 
int ledPin =  13;    
int state =0;          
int bate=0;

RedBotAccel accelerometer;

void setup() {
  pinMode(ledPin, OUTPUT);      
  pinMode(hallSensor1, INPUT);     
  pinMode(hallSensor2, INPUT);
//  pinMode(12, OUTPUT);
  
  Serial.begin(9600);
}

void loop(){
//  digitalWrite(12,HIGH);
accelerometer.read(); // updates the x, y, and z axis readings on the acceleromter

   //Serial.println(accelerometer.y); // Goes from 14k to to -14k
accVal = accelerometer.y;
  
  state = analogRead(hallSensor1);
//  Serial.println(state);
  bate  = analogRead(hallSensor2);
//  Serial.println(bate);
    if (state >= 600 || state <= 500) {        
    digitalWrite(ledPin, HIGH);  
    Serial.println("1");
  } 
    else if  ( bate >= 400 || bate <= 320){
    digitalWrite(ledPin, HIGH);
    Serial.println("2"); 
  }
//  
else if ((state >= 600 || state <= 500 )&& acclVal<=0){
  Serial.println("3");
  }
else{
    Serial.println("0");
    digitalWrite(ledPin, LOW);
  }
  delay(500);
}
