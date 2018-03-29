float init1, init2, init3, init4, init5;
float v1, v2, v3, v4, v5;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  init1 = touchRead(A1);
  init2 = touchRead(A2);
  init3 = touchRead(A3);
  init4 = touchRead(A4);
  init5 = touchRead(A5);
}

void loop() {
  // put your main code here, to run repeatedly:
  v1 = touchRead(A1);
  v2 = touchRead(A2);
  v3 = touchRead(A3);
  v4 = touchRead(A4);
  v5 = touchRead(A5);
  Serial.print(v1);
  Serial.print("\t");
  Serial.print(v2);
  Serial.print("\t");
  Serial.print(v3);
  Serial.print("\t");
  Serial.print(v4);
  Serial.print("\t");
  Serial.print(v5);
  Serial.print("\n");
//  if (v1 - init1 > 300)
//    Serial.print("1");
//  else if (v2 - init2 > 300)
//    Serial.print("2");
//  else if (v3 - init3 > 300)
//    Serial.print("3");
//  else 
//    Serial.print("0");
//  Serial.print("\t");
//
//  if (v4 - init4 > 800)
//    Serial.println("1");
//  else if (v5 - init5 > 800)
//    Serial.println("2");
//  else 
//    Serial.println("0");
//
  delay(200);
}
