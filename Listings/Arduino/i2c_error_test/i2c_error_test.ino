#include "Wire.h"
#include "Arduino_LED_Matrix.h"

ArduinoLEDMatrix matrix;
#define DELAY_FRAME 91
uint32_t frame[3]; 
char frame_cntr = 0;

const int deviceAddress = 0x08; 


void setup() {
  Serial.begin(9600);
  while (!Serial); 
  Wire1.begin();
  matrix.begin();
  Serial.println("I2C Wire1 Initialized...");
}

void loop() {
  frame_cntr = 0;
  while (true)
  {
    uint8_t bytesReceived = Wire1.requestFrom(deviceAddress, (uint8_t)4);

    if (bytesReceived == 4) 
    {
      uint32_t registerValue = 0;
      for (int i = 0; i < bytesReceived; i++)
      {
        registerValue <<= 8; 
        registerValue |= Wire1.read();
      }

      frame[frame_cntr] = registerValue;
      frame_cntr++;
      if (frame_cntr == 3) 
      {
        matrix.loadFrame(frame);
        frame_cntr = 0;
        delay(DELAY_FRAME);
      }
    } 
    else
    {
      Serial.println("Error in frame transmission starting again in 10sec");
      break;
    }
  }
  delay(10000);
}