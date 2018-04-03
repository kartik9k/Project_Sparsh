#include <SPI.h>

#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_LSM303_U.h>

/* Assign a unique ID to this sensor at the same time */
Adafruit_LSM303_Accel_Unified accel = Adafruit_LSM303_Accel_Unified(54321);

void setup(void)
{

  Serial.begin(9600);
  if(!accel.begin())
  {
    /* There was a problem detecting the ADXL345 ... check your connections */
    Serial.println("No sensor detected");
    while(1);
  }
}

void loop(void)
{
  /* Get a new sensor event */
  sensors_event_t event;
  accel.getEvent(&event);
//  Serial.println(event.acceleration.y);

//  Serial.print("Y Raw: "); Serial.print(accel.raw.y); Serial.print("  ");
  if (event.acceleration.y > 8)
    Serial.println("2");
  else if (event.acceleration.y > 5)
    Serial.println("5");
  else if (event.acceleration.y > 2)
    Serial.println("8");
  delay(50);
}
