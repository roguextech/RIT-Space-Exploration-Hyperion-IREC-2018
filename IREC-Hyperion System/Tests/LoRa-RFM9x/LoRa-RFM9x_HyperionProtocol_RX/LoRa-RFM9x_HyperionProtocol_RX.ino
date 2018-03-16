#include <RH_RF95.h>
#include <Wire.h>
#include <SPI.h>
#include <IREC_Hyperion_Protocol.h>

// SPI pins
#define RFM95_RST     9   // "A"
#define RFM95_CS      10   // "B"
#define RFM95_INT     4    // "C"

// Change to 434.0 or other frequency, must match RX's freq!
#define RF95_FREQ 915.0

#define LED 13

RH_RF95 rf95(RFM95_CS, RFM95_INT); // Singleton instance of the radio driver

void setup() {
  // put your setup code here, to run once:
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);
  pinMode(RFM95_INT,INPUT);
  
  // manual reset
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);

  if (!rf95.init()) {
      Serial.println("[LoRa] - Init failed");
  }

  // Defaults after init are 434.0MHz, modulation GFSK_Rb250Fd250, +13dbM
  if (!rf95.setFrequency(RF95_FREQ)) {
      Serial.println("[LoRa] - setFrequency failed");
  }
  Serial.print("[LoRa] - Set Freq to: "); Serial.println(RF95_FREQ);

  // maximum power
  rf95.setTxPower(23, false);

  Serial.println("[LoRa] - Init success");
}

void loop() {
  if (rf95.available())
  {
    // Should be a message for us now   
    uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
    uint8_t len = sizeof(buf);
    
    if (rf95.recv(buf, &len))
    {
      digitalWrite(LED, HIGH);

      float temp;
      
      switch(IRECHYPERP::typeofData(buf)){
        case 0: 
          break;
        case 1:
          {      
            LSM9DS1_Packet packed = IRECHYPERP::unpack_LSM9DS1(buf);
            Serial.println("LSM9DS1 DATA:");
            temp = *((float*)&packed.data.ax);
            Serial.print("ax: "); Serial.println(temp);
            temp = *((float*)&packed.data.ay);
            Serial.print("ay: "); Serial.println(temp);
            temp = *((float*)&packed.data.az);
            Serial.print("az: "); Serial.println(temp);
          }
          break;
        case 2:    
          {      
            BME280_Packet packed = IRECHYPERP::unpack_BME280(buf);
            Serial.println("BME280 DATA:");
            temp = *((float*)&packed.data.temperature);
            Serial.print("Temperature: "); Serial.println(temp);
            temp = *((float*)&packed.data.pressure);
            Serial.print("Pressure: "); Serial.println(temp);
            temp = *((float*)&packed.data.humidity);
            Serial.print("Humidity: "); Serial.println(temp);
            temp = *((float*)&packed.data.altitude);
            Serial.print("Altitude: "); Serial.println(temp);
            break;
          }
      }
    }
    else
    {
      Serial.println("Receive failed");
    }
  }
}
