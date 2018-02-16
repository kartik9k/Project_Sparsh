int sensorPin1 = A1;
int sensorPin2 = A2;
int sensorPin3 = A3;

int sensorPin4 = A4;
int sensorPin5 = A5;

int initVal1;
int initVal2;
int initVal3;

void setup(){
   Serial.begin(38400);
   initVal1 = touchRead(sensorPin1);
   initVal2 = touchRead(sensorPin2);
   initVal3 = touchRead(sensorPin3);
 }

 int recognizeTap(int n, int x){
   int i;
   long int s = 0;
   int ret = 0;
   for (i = 0; i < n; i++){
      if (x == 1)
        s += touchRead(sensorPin1);
      else if (x == 2)
        s += touchRead(sensorPin2);
      else if (x == 3)
        s += touchRead(sensorPin3);
      else if (x == 4)
        s += touchRead(sensorPin4);
      else
        s += touchRead(sensorPin5);
   }

   s = s/n;
   if (x == 1){
       if (s - initVal1 >= 500)
        ret = 1;
    }

   if (x == 2){
        if (s - initVal2 >= 500)
        ret = 1;
    }

   if (x == 3){
        if (s - initVal3 >= 500)
        ret = 1;
    }

   if (x == 1 || x == 2 || x == 3)
    return ret;
   else
    return s;
 }
 
 void loop(){
  int a = recognizeTap(5, 1);
  int b = recognizeTap(5, 2);
  int c = recognizeTap(5, 3);

  int d = recognizeTap(1, 4);
  int e = recognizeTap(1, 5);
  float val = ((d-e) * 1000)/(d+e);
  Serial.print(a);
  Serial.print("\t");
  Serial.print(b);
  Serial.print("\t");
  Serial.print(c);
  Serial.print("\t");
  Serial.println(val);
  delay(200);
 }
