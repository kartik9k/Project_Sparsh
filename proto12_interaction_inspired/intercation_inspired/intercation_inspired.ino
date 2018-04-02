int init1, init2, init3, init4, init5, init6;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  init1 = touchRead(A1);
  init2 = touchRead(A2);
  init3 = touchRead(A3);
  init4 = touchRead(A4);
  init5 = touchRead(A5);
  init6 = touchRead(A8);
}

void loop() {
  // put your main code here, to run repeatedly:
  float v1 = touchRead(A1);
  float v2 = touchRead(A2);
  float v3 = touchRead(A3);
  float v4 = touchRead(A4);
  float v5 = touchRead(A5);
  float v6 = touchRead(A8);

  if (v1 - init1 > 70 || v2 - init2 > 70){
    Serial.print("1");
    Serial.print("\t");
    if (v1 - v2 > 150)
      Serial.println("1");
    else if (v1 - v2 < -150)
      Serial.println("3");
    else
      Serial.println("2");
  }
  else if (v3 - init3 > 70 || v4 - init4 > 70){
    Serial.print("2");
    Serial.print("\t");
    if (v3 - v4 > 150)
      Serial.println("1");
    else if (v3 - v4 < -150)
      Serial.println("3");
    else
      Serial.println("2");   
  }

  else if (v5 - init5 > 70 || v6 - init6 > 70){
    Serial.print("3");
    Serial.print("\t");
    if (v5 - v6 > 150)
      Serial.println("1");
    else if (v5 - v6 < -150)
      Serial.println("3");
    else
      Serial.println("2");   
  }
  else{
    Serial.print("0");
    Serial.print("\t");
    Serial.println("0");
  }
//  Serial.print(v5);
//  Serial.print("\t");
//  Serial.println(v3-v4);
  delay(200);

}
