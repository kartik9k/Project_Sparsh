int init1, init2;

void setup() {
  pinMode(A4, INPUT);
  pinMode(A5, INPUT);
  Serial.begin(9600);
  long int val = 0;
  for( int i=0; i<30;i++){
    val += analogRead(A5);
  }
  init1 = val/30;

  val = 0;
  for( int i=0; i<30;i++){
    val += analogRead(A4);
  }
  init2 = val/30;
  


}

void loop() {
  int v1, v2;
  long int val = 0;
  for( int i=0; i<30;i++){
    val += analogRead(A5);
  }
  v1 = val/30;

  val = 0;
  for( int i=0; i<30;i++){
    val += analogRead(A4);
  }
  v2 = val/30;

//  Serial.print(v1);
//  Serial.print("\t");
//  Serial.println(v2);

  int d1 = v1 - init1;
  int d2 = v2 - init2;

  int maxi;
  if (abs(d1) > abs(d2))
    maxi = d1;
  else 
    maxi = d2;

  
  Serial.print (maxi);
  Serial.print("\t");
  if (maxi == d1)
    Serial.println("1");
  else
    Serial.println("2");
  delay(100);
  
}
