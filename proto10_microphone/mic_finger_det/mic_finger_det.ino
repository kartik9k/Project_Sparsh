int init1, init2;

void setup() {
//  pinMode(A4, INPUT);
  pinMode(A5, INPUT);
  Serial.begin(9600);
  long int val = 0;
  for( int i=0; i<10;i++){
    val += pow(analogRead(A5), 2);
  }
  init1 = val/10;

//  val = 0;
//  for( int i=0; i<30;i++){
//    val += analogRead(A4);
//  }
//  init2 = val/30;
  


}

void loop() {
  int v1, v2;
  long long int val = 0;
  for( int i=0; i<10;i++){
    val += pow(analogRead(A5), 2);
  }
  v1 = val/10;

  if (v1 - init1 > 300){
    long int st = millis();
    while(millis() - st > 20){
        
      
    }
  }



//  val = 0;
//  for( int i=0; i<30;i++){
//    val += analogRead(A4);
//  }
//  v2 = val/30;

//  Serial.print(v1);
//  Serial.print("\t");
//  Serial.println(v2);

//  int d1 = v1 - init1;
//  int d2 = v2 - init2;

  Serial.println(v1 - init1);
//  Serial.print("\t");
//  Serial.println(d2);
//  delay(100);
  
}
