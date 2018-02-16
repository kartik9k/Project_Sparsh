int sensorPin = A1;
int sensorPin2 = A2;
int sensorPin3 = A3;
int sensorPin4 = A4;
void setup(){
   Serial.begin(38400);
}

// int recognizeTap(int n, int x){
//   int i;
//   long int s = 0;
//   int ret = 0;
//   for (i = 0; i < n; i++){
//      if (x ==1)
//        s += touchRead(sensorPin);
//      else if (x == 2)
//        s += touchRead(sensorPin2);
//      else if (x == 3)
//        s += touchRead(sensorPin3);
//      else
//        s += touchRead(sensorPin4);
//   }
//
//   s = s/n;
//   return s;
// }
 
 void loop(){
  int a = touchRead(sensorPin);
  int b = touchRead(sensorPin2);
  int c = touchRead(sensorPin3);
  int d = touchRead(sensorPin4);
  Serial.print((a-b) * 1000 / (a+b));
  Serial.print("\t");
  Serial.println((c-d) * 1000 / (c+d));
  
 delay(200);
 }
