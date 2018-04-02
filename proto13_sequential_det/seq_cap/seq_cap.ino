int init1, init2, init3, init4;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  init1 = touchRead(A1);
  init2 = touchRead(A2);
  init3 = touchRead(A3);
  init4 = touchRead(A4);
}

void loop() {
  // put your main code here, to run repeatedly:
  float v1 = touchRead(A1);
  float v2 = touchRead(A2);
  float v3 = touchRead(A3);
  float v4 = touchRead(A4);
  
  if (v1 - init1 > 500)
    Serial.println("1");
  else if (v2 - init1 > 500)
    Serial.println("2");
  else if (v3 - init3 > 500)
    Serial.println("3");
  else if (v4 - init4 > 500)
    Serial.println("4");

  delay(200);
}
