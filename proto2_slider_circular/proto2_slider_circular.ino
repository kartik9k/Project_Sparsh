// Connections : 
// A1 -> Left most slider point
// A2 -> (Upper) right slider
// A3 -> (Lower) left slider
// A4 -> Right most slider point

int iv1, iv2, iv3, iv4;
int icv1, icv2, icv3, icv4; 
int v1, v2, v3, v4;
int cv1, cv2, cv3, cv4;

void setup(){
   Serial.begin(9600);
  iv1 = touchRead(A1);
  iv2 = touchRead(A2);
  iv3 = touchRead(A3);
  iv4 = touchRead(A4);

  icv1 = touchRead(A8);
  icv2 = touchRead(A9);
  icv3 = touchRead(0);
  icv4 = touchRead(1);
}

void loop(){
  v1 = touchRead(A1);
  v2 = touchRead(A2);
  v3 = touchRead(A3);
  v4 = touchRead(A4);

  cv1 = touchRead(A8);
  cv2 = touchRead(A9);
  cv3 = touchRead(0);
  cv4 = touchRead(1);

  if (v1 - iv1 > 500 || v2 - iv2 > 500)
    Serial.print("1");
  else
    Serial.print("0");

  Serial.print("\t");

  if (v3 - iv3 > 500 || v4 - iv4 > 500)
    Serial.print("1");
  else
    Serial.print("0");

  Serial.print("\t");
  
  Serial.print((v1 - v2) * 1000 / (v1 + v2));
  Serial.print("\t");
  Serial.print((v3 - v4) * 1000 / (v3 + v4));
  Serial.print("\t");

  if (cv1 - icv1 > 500)
    Serial.print("1");
  else
    Serial.print("0");
  Serial.print("\t");

  if (cv2 - icv2 > 500)
    Serial.print("1");
  else
    Serial.print("0");
  Serial.print("\t");

  if (cv3 - icv3 > 500)
    Serial.print("1");
  else
    Serial.print("0");
  Serial.print("\t");

  if (cv4 - icv4 > 500)
    Serial.print("1");
  else
    Serial.print("0");
  Serial.println();  
  delay(200);
 }
