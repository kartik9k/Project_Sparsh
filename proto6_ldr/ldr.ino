long int init1 = 0, init2 = 0, init3 = 0, init4 = 0, init5 = 0;
void setup() { 
int i;
for (i = 0; i < 10; i++){
  init1 += analogRead(A1);
  init2 += analogRead(A2);
  init3 += analogRead(A3);
  init4 += analogRead(A4);
  init5 += analogRead(A5);
  }
init1 = init1/10;
init2 = init2/10;
init3 = init3/10;
init4 = init4/10;
init5 = init5/10;
Serial.begin(9600); //sets serial port for communication 
} 
void loop() { 
long int v1 = 0, v2 = 0, v3 = 0, v4 = 0, v5 = 0;
int d1 = 0, d2 = 0, d3 = 0, d4 = 0, d5 = 0;
int i;
for (i = 0; i < 10; i++){
  v1 += analogRead(A1);
  v2 += analogRead(A2);
  v3 += analogRead(A3);
  v4 += analogRead(A4);
  v5 += analogRead(A5);
  }
v1 = v1/10;
v2 = v2/10;
v3 = v3/10;
v4 = v4/10;
v5 = v5/10;

d1 = v1 - init1;
d2 = v2 - init2;
d3 = v3 - init3;
d4 = v4 - init4;
d5 = v5 - init5;

Serial.print(d1); //prints the values coming from the sensor on the screen 
Serial.print("\t");
Serial.print(d2);
Serial.print("\t");
Serial.print(d3);
Serial.print("\t");
Serial.print(d4);
Serial.print("\t");
Serial.println(d5);
delay(100); 
} 
