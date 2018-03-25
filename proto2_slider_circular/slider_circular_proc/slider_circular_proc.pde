import processing.serial.*;
Serial myPort;
import controlP5.*;
ControlP5 cp5;

void setup(){
  size(800, 800);
  myPort = new Serial(this, "COM4", 9600);
  cp5 = new ControlP5(this);
  cp5.addSlider("Linear Slider").setPosition(200, 50).setRange(-500, 500).setSize(400, 50);
  background(#FFFFFF);
  fill(#FFFFFF);
  ellipse(400, 200, 100, 100);
  ellipse(400, 160, 20, 20);
  ellipse(440, 200, 20, 20);
  ellipse(400, 240, 20, 20);
  ellipse(360, 200, 20, 20);   
  ellipse(427, 172, 20, 20);
  ellipse(427, 228, 20, 20);
  ellipse(372, 228, 20, 20);
  ellipse(372, 172, 20, 20);
}

void draw(){

  
  while(myPort.available() > 0){
  fill(#FFFFFF);
  ellipse(400, 200, 100, 100);
  ellipse(400, 160, 20, 20);
  ellipse(440, 200, 20, 20);
  ellipse(400, 240, 20, 20);
  ellipse(360, 200, 20, 20);   
  ellipse(427, 172, 20, 20);
  ellipse(427, 228, 20, 20);
  ellipse(372, 228, 20, 20);
  ellipse(372, 172, 20, 20);
  cp5.addSlider("Linear Slider").setPosition(200, 50).setRange(-500, 500).setSize(400, 50).setValue(-500);
  String upper_str_act = myPort.readStringUntil('\t');
  String lower_str_act = myPort.readStringUntil('\t');
  String upper_str_val = myPort.readStringUntil('\t');
  String lower_str_val = myPort.readStringUntil('\t');
  String c1_str_val = myPort.readStringUntil('\t');
  String c2_str_val = myPort.readStringUntil('\t');
  String c3_str_val = myPort.readStringUntil('\t');
  String c4_str_val = myPort.readStringUntil('\n');
  
  if (upper_str_act != null && lower_str_act != null && upper_str_val != null && lower_str_val != null && c1_str_val != null && c2_str_val != null && c3_str_val != null && c4_str_val != null){
    float upper_act, lower_act, upper_val, lower_val, cv1_val, cv2_val, cv3_val, cv4_val;
    
    float in_max_u = 600;
    float in_min_u = -600;
    float out_max_u = -100;
    float out_min_u = -500;
    
    float in_max_l = 600;
    float in_min_l = -600;
    float out_max_l = 500;
    float out_min_l = 100;
    
    float in_max_ul = 200;
    float in_min_ul = -200;
    float out_max_ul = 100;
    float out_min_ul = -100;
    
    upper_act = float(upper_str_act);
    lower_act = float(lower_str_act);
    upper_val = float(upper_str_val);
    lower_val = float(lower_str_val);
    
    cv1_val = float(c1_str_val);
    cv2_val = float(c2_str_val);
    cv3_val = float(c3_str_val);
    cv4_val = float(c4_str_val);
    
    if (upper_act == 0 && lower_act == 0){
      //cp5.addSlider("Linear Slider").setPosition(200, 50).setRange(-500, 500).setSize(400, 50).setValue(0);
    }
    else if (upper_act == 1 && lower_act == 1){
      upper_val = - upper_val;
      float map_val = upper_val - lower_val;
      float map = ((map_val - in_min_ul) * (out_max_ul - out_min_ul))/(in_max_ul - in_min_ul) + out_min_ul;
      cp5.addSlider("Linear Slider").setPosition(200, 50).setRange(-500, 500).setSize(400, 50).setValue(map);
    }
    else if (upper_act == 1){
      upper_val = - upper_val;
      float map = ((upper_val - in_min_u) * (out_max_u - out_min_u))/(in_max_u - in_min_u) + out_min_u;
      cp5.addSlider("Linear Slider").setPosition(200, 50).setRange(-500, 500).setSize(400, 50).setValue(map);
    }
    else if (lower_act == 1){
      lower_val = - lower_val;
      float map = ((lower_val - in_min_l) * (out_max_l - out_min_l))/(in_max_l - in_min_l) + out_min_l;
      cp5.addSlider("Linear Slider").setPosition(200, 50).setRange(-500, 500).setSize(400, 50).setValue(map);
    }
    
    if (cv1_val == 1 && cv2_val == 1){
      fill(#04B1CE);
      ellipse(400, 160, 20, 20);
    }
    
    else if (cv2_val == 1 && cv3_val == 1){
      fill(#04B1CE);
      ellipse(440, 200, 20, 20);
    }
    
    else if (cv3_val == 1 && cv4_val == 1){
      fill(#04B1CE);
      ellipse(400, 240, 20, 20);      
    }
    
    else if (cv4_val == 1 && cv1_val == 1){
      fill(#04B1CE);
      ellipse(360, 200, 20, 20);      
    }
    
    else if (cv1_val == 1){
      fill(#04B1CE);
      ellipse(427, 172, 20, 20);
    }
    
    else if (cv2_val == 1){
      fill(#04B1CE);
      ellipse(427, 228, 20, 20);
    }
    
    else if (cv3_val == 1){
      fill(#04B1CE);
      ellipse(372, 228, 20, 20);
    }
    
    else if (cv4_val == 1){
      fill(#04B1CE);
      ellipse(372, 172, 20, 20);
    }
  }
  }  
}