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
  if (v5 - init5 > 1000){
    Serial.print("1");
    Serial.print("\t");
    float d1 = v1 - init1;
    float d2 = v2 - init2;
    float d3 = v3 - init3;
    float maxi = 0;
    if (d1 > d2)
      maxi = d1;    
    else
      maxi = d2;  
    
    if (maxi < d3)
      maxi = d3;

    if (maxi < 170){
      Serial.println("0");  
    }

    else if (maxi == d1)
      Serial.println("1");

    else if (maxi == d2)
      Serial.println("2");

    else if (maxi == d3)
      Serial.println("3");  
  }

  else if (v4 - init4 > 1000){
    Serial.print("2");
    Serial.print("\t");
    float d1 = v1 - init1;
    float d2 = v2 - init2;
    float d3 = v3 - init3;
    float maxi = 0;
    if (d1 > d2)
      maxi = d1;    
    else
      maxi = d2;  
    
    if (maxi < d3)
      maxi = d3;

    if (maxi < 170){
      Serial.println("0");  
    }

    else if (maxi == d1)
      Serial.println("1");

    else if (maxi == d2)
      Serial.println("2");

    else if (maxi == d3)
      Serial.println("3");  
  }
  else{
    Serial.print("0");
    Serial.print("\t");
    Serial.println("0");
  }
  delay(200);
}
