// Audio Loop Switcher
// Uses two MT8816 8x16 switches to form a larger 16x16 matrix,
// controlled by an MCP23017 GPIO expander
//
// An ESP8266 receives commands from an external controller via RS485 and configures the matrix signal chain
//
// Adafruit_MCP23X17 library pin numbers to use for MCP23017 pins
// mcp23017 pin    pin name       library pin #
//     21            GPA0             0
//     22            GPA1             1
//     23            GPA2             2
//     24            GPA3             3
//     25            GPA4             4
//     26            GPA5             5
//     27            GPA6             6
//     28            GPA7             7
//      1            GPB0             8
//      2            GPB1             9
//      3            GPB2             10
//      4            GPB3             11
//      5            GPB4             12
//      6            GPB5             13
//      7            GPB6             14
//      8            GPB7             15
//
// Tested with      Arduino IDE         1.8.13
//                  ESP8266 Board file  2.4.2
// Libraries:
//                  Adafruit MCP23017 https://github.com/adafruit/Adafruit-MCP23017-Arduino-Library
//
//
// Gadget Reboot
// https://www.youtube.com/@gadgetreboot

#include <Adafruit_MCP23X17.h>
#include <ESP8266WiFi.h>

#define addr 0x20     // mcp23017 address when all address pins are grounded
#define closed 1      // crosspoint junction is connected when mt8816 data = 1
#define opened 0      // crosspoint junction is disconnected when mt8816 data = 0

Adafruit_MCP23X17 mcp;  // mcp23017 object 

// assign mcp23017 gpio pins to mt8816 pin functions based on schematic wiring
#define pinCS0 15      // chip select
#define pinCS1 0
#define pinReset 12
#define pinStrobe 14
#define pinData 13
#define pinAY0 5       // y address
#define pinAY1 6
#define pinAY2 7
#define pinAX0 1       // x address
#define pinAX1 2
#define pinAX2 3
#define pinAX3 4

bool switchMatrix[16][16];  // 16x16 matrix to store switch states in memory as a reference/record
const byte xChSize = 16;    // number of channels along x-axis
int xCh[xChSize];           // store which y-channel will connect to each x-channel (-1 = no connect)
int chOrder[xChSize];       // store the sequence of x-y connections in the signal chain
const int re_dePin = D6;    // RS485 receiver/driver enable
char serialChar = ' ';      // characters read from RS485 serial port

void setup() {
  WiFi.mode(WIFI_OFF);
  Serial.begin(115200);
  Serial.swap();                // use alternate UART pins for RS485

  pinMode(re_dePin, OUTPUT);    // configure RS485 direction pin
  digitalWrite(re_dePin, HIGH); // RS485 set to tx mode
  delay(1);
  Serial.println("\r\n\r\nLoop Switcher Demo");

  // init gpio expander
  if (!mcp.begin_I2C(addr)) {
    Serial.println("Can't initialize mcp23017");
    while (1);
  }

  delay(20);
  digitalWrite(re_dePin, LOW);  // RS485 set to receive mode

  // configure gpio expander output pins for mt8816 control
  mcp.pinMode(pinReset, OUTPUT);
  mcp.pinMode(pinStrobe, OUTPUT);
  mcp.pinMode(pinData, OUTPUT);
  mcp.pinMode(pinAY0, OUTPUT);
  mcp.pinMode(pinAY1, OUTPUT);
  mcp.pinMode(pinAY2, OUTPUT);
  mcp.pinMode(pinAX0, OUTPUT);
  mcp.pinMode(pinAX1, OUTPUT);
  mcp.pinMode(pinAX2, OUTPUT);
  mcp.pinMode(pinAX3, OUTPUT);
  mcp.pinMode(pinCS0, OUTPUT);
  mcp.pinMode(pinCS1, OUTPUT);

  // disable mt8816 chips (set chip selects low)
  mcp.digitalWrite(pinCS0, LOW);
  mcp.digitalWrite(pinCS1, LOW);

  // init x-y node connection array to indicate no nodes are connected from x to y  (set y = -1 for each x channel)
  clear_xy_data();
  resetMatrix();                               // reset entire matrix (disconnect all node junctions)
  printMatrix();                               // debug print the matrix configuration
}

void loop() {

  if (Serial.available()) {                    // monitor incoming serial port for commands
    serialChar = Serial.read();
  }

  switch (serialChar) {
    case ' ':                                  // do nothing until data arrives  (' ' character means no new data)
      break;

    case '0':
      for (byte i = 0; i < xChSize; i++) {    // clear signal routing path and create a new signal chain
        chOrder[i] = -1;
      }
      // define the new channel ordering sequence
      chOrder[0] = 0;               // input goes straight to output (channel x0 to y0)

      digitalWrite(re_dePin, HIGH); // RS485 set to tx mode
      delay(1);

      configureMatrix();            // implement the new signal chain

      Serial.print("0");            // echo back confirmation
      delay(20);
      digitalWrite(re_dePin, LOW);  // RS485 set to rx mode
      serialChar = ' ';             // clear serial character
      break;

    case '1':
      for (byte i = 0; i < xChSize; i++) {    // clear signal routing path and create a new signal chain
        chOrder[i] = -1;
      }
      // define the new channel ordering sequence
      chOrder[0] = 5;                         // input (x0) goes to ch5, then to output (y0)
      chOrder[5] = 0;

      digitalWrite(re_dePin, HIGH);           // RS485 set to tx mode
      delay(1);

      configureMatrix();                      // implement the new signal chain

      Serial.print("1");                      // echo back confirmation
      delay(20);
      digitalWrite(re_dePin, LOW); // RS485 set to rx mode

      serialChar = ' ';                       // clear serial character
      break;

    case '2':
      for (byte i = 0; i < xChSize; i++) {    // clear signal routing path and create a new signal chain
        chOrder[i] = -1;
      }
      // define the new channel ordering sequence
      chOrder[0] = 12;                        // input (x0) goes to ch12, then to output (y0)
      chOrder[12] = 0;

      digitalWrite(re_dePin, HIGH);           // RS485 set to tx mode
      delay(1);

      configureMatrix();                      // implement the new signal chain

      Serial.print("2");                      // echo back confirmation
      delay(20);
      digitalWrite(re_dePin, LOW);            // RS485 set to rx mode

      serialChar = ' ';                       // clear serial character
      break;

    case '3':
      for (byte i = 0; i < xChSize; i++) {    // clear signal routing path and create a new signal chain
        chOrder[i] = -1;
      }
      // define the new channel ordering sequence
      chOrder[0] = 14;                        // input (x0) goes to ch14, then to output (y0)
      chOrder[14] = 0;

      digitalWrite(re_dePin, HIGH);           // RS485 set to tx mode
      delay(1);

      configureMatrix();                      // implement the new signal chain

      Serial.print("3");                      // echo back confirmation
      delay(20);
      digitalWrite(re_dePin, LOW);            // RS485 set to rx mode

      serialChar = ' ';                       // clear serial character
      break;

    case '4':
      for (byte i = 0; i < xChSize; i++) {    // clear signal routing path and create a new signal chain
        chOrder[i] = -1;
      }
      // define the new channel ordering sequence
      chOrder[0] = 5;                         // input (x0) goes to ch5, then to ch12, then to output (y0)
      chOrder[5] = 12;
      chOrder[12] = 0;

      digitalWrite(re_dePin, HIGH);           // RS485 set to tx mode
      delay(1);

      configureMatrix();                      // implement the new signal chain

      Serial.print("4");                      // echo back confirmation
      delay(20);
      digitalWrite(re_dePin, LOW);            // RS485 set to rx mode

      serialChar = ' ';                       // clear serial character
      break;

    case '5':
      for (byte i = 0; i < xChSize; i++) {    // clear signal routing path and create a new signal chain
        chOrder[i] = -1;
      }
      // define the new channel ordering sequence
      chOrder[0] = 12;                        // input (x0) goes to ch12, then to ch5, then to output (y0)
      chOrder[12] = 5;
      chOrder[5] = 0;

      digitalWrite(re_dePin, HIGH);           // RS485 set to tx mode
      delay(1);

      configureMatrix();                      // implement the new signal chain

      Serial.print("5");                      // echo back confirmation
      delay(20);
      digitalWrite(re_dePin, LOW);            // RS485 set to rx mode

      serialChar = ' ';                       // clear serial character
      break;

    case 'a':
      for (byte i = 0; i < xChSize; i++) {    // clear signal routing path and create a new signal chain
        chOrder[i] = -1;
      }
      // define the new channel ordering sequence
      chOrder[0] = 14;                        // input (x0) goes to ch14, then to ch5, then to output (y0)
      chOrder[14] = 5;
      chOrder[5] = 0;

      digitalWrite(re_dePin, HIGH);           // RS485 set to tx mode
      delay(1);

      configureMatrix();                      // implement the new signal chain

      Serial.print("a");                      // echo back confirmation
      delay(20);
      digitalWrite(re_dePin, LOW);            // RS485 set to rx mode

      serialChar = ' ';                       // clear serial character
      break;

    case 'b':
      for (byte i = 0; i < xChSize; i++) {    // clear signal routing path and create a new signal chain
        chOrder[i] = -1;
      }
      // define the new channel ordering sequence
      chOrder[0] = 14;                        // input (x0) goes to ch14, then to ch12, then to ch5, then to output (y0)
      chOrder[14] = 12;
      chOrder[12] = 5;
      chOrder[5] = 0;

      digitalWrite(re_dePin, HIGH);           // RS485 set to tx mode
      delay(1);

      configureMatrix();                      // implement the new signal chain

      Serial.print("b");                      // echo back confirmation
      delay(20);
      digitalWrite(re_dePin, LOW);            // RS485 set to rx mode

      serialChar = ' ';                       // clear serial character
      break;

    default:                                  // in case of undefined state, do nothing
      break;

  } // end switch (serialChar)
}

void print_xCh() {
  Serial.print("xCh Data: ");
  for (byte i = 0; i < xChSize; i++) {
    Serial.print(" ");
    Serial.print(xCh[i]);
  }
  Serial.println();
}

void clear_xy_data() {
  for (byte i = 0; i < xChSize; i++) {
    xCh[i] = -1;
  }
}

// reset all junction connections
void resetMatrix() {
  mcp.digitalWrite(pinReset, HIGH);
  delay(100);
  mcp.digitalWrite(pinReset, LOW);
}

// based on mt8816 library https://github.com/DatanoiseTV/MT8816/
// modified to support two mt8816's arranged as a larger 16x16 matrix
// close or open the contacts at the x,y node of the 16x16 switch
void setJunction(uint8_t x, uint8_t y, bool state)
{
  switchMatrix[x][y] = state;  // store the junction switch state in the matrix

  // the x addresses are not sequential as shown 
  // in the address decoder table of the data sheet
  // this evaluation will map to the correct address for x.
  // eg. to access x position 12, the address is ax3..ax0  = 0110  = 6 decimal
  if (x == 12) x = 6;
  else if (x == 13) x = 7;
  else if ((x >= 6) && (x <= 11)) x += 2;

  // enable chip select of the mt8816 being accessed
  // based on which y line is being referenced
  if ((y >= 0) && (y <= 7))
    mcp.digitalWrite(pinCS0, HIGH);
  else
    mcp.digitalWrite(pinCS1, HIGH);

  // set the address pins corresponding to the x,y coordinates of the targeted junction
  if (bitRead(x, 0)) mcp.digitalWrite(pinAX0, HIGH); else mcp.digitalWrite(pinAX0, LOW);
  if (bitRead(x, 1)) mcp.digitalWrite(pinAX1, HIGH); else mcp.digitalWrite(pinAX1, LOW);
  if (bitRead(x, 2)) mcp.digitalWrite(pinAX2, HIGH); else mcp.digitalWrite(pinAX2, LOW);
  if (bitRead(x, 3)) mcp.digitalWrite(pinAX3, HIGH); else mcp.digitalWrite(pinAX3, LOW);
  if (bitRead(y, 0)) mcp.digitalWrite(pinAY0, HIGH); else mcp.digitalWrite(pinAY0, LOW);
  if (bitRead(y, 1)) mcp.digitalWrite(pinAY1, HIGH); else mcp.digitalWrite(pinAY1, LOW);
  if (bitRead(y, 2)) mcp.digitalWrite(pinAY2, HIGH); else mcp.digitalWrite(pinAY2, LOW);

  // strobe the junction control data into the mt8816 chip that is enabled by chip select
  mcp.digitalWrite(pinData, state);
  mcp.digitalWrite(pinStrobe, HIGH);
  delay(1);
  mcp.digitalWrite(pinStrobe, LOW);

  // disable chip selects
  mcp.digitalWrite(pinCS0, LOW);
  mcp.digitalWrite(pinCS1, LOW);
}

// return the closed/open state of the contacts at the x,y node
bool getState(uint8_t x, uint8_t y)
{
  return switchMatrix[x][y];
}

void configureMatrix() {
  /*  chOrder and xChNew may be doing the same thing (one of them is redundant) after modifying the sketch from a previous prototype
      but the sketch is kept as is for now to avoid breaking something.
      
       xCh defines which y channel [0..15] is connected to each x channel [0..15]
       eg. xCh[2, 0, 1, ...] means that xCh[0] connects to y channel 2, xCh[1] connects to y channel 0, etc

       an assigned value of -1 means nothing is assigned or connected to that channel
  */

  int xChNew[16] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}; // create new x-y node connections to be implemented


  // debug print the intended signal chain routing
  Serial.print("\r\nNew Signal Chain\r\nchOrder: ");
  for (byte i = 0; i < xChSize; i++) {
    Serial.print(" ");
    Serial.print(chOrder[i]);
  }
  Serial.println();

  /*
     // old code for reference
    // update signal chain on oled
    display.clearDisplay();                             // clear display
    display.setCursor(0, 0);                            // set cursor to top left corner of the display
    display.println("Loop Switcher");
    display.print("In > ");
    for (byte i = 0; i < xChSize; i++) {
      if (chOrder[i] == 0) break;
      display.print(chOrder[i]);
      display.print(" > ");
    }
    display.print("Out");
    display.display();                                    // update display
  */

  // this may be where redundancy can be optimized out if the sketch is refined
  // if xChNew and chOrder are basically doing the same thing
  for (byte i = 0; i < xChSize; i++) {
    xChNew[i] = chOrder[i];
  }

  // disconnect old unneeded junctions, reconnect new nodes
  for (byte i = 0; i < xChSize; i++) {
    if (xCh[i] != xChNew[i]) {           // open or close matrix junctions to reflect new signal chain
      setJunction(i, xCh[i], opened);
      if (xChNew[i] != -1)               // if this node is to be a closed junction, make the connection
        setJunction(i, xChNew[i], closed);
    }
    xCh[i] = xChNew[i];                  // update the current x channel's signal mapping to destination y channel
  }
  print_xCh();                           // debug print the final signal chain routing for confirmation of mapping
  printMatrix();                         // debug print the matrix configuration
}

void printMatrix() {
  Serial.println("\r\nMatrix Map");
  for (byte i = xChSize; i > 0; i--) {
    if (i - 1 < 10) Serial.print(" ");
    Serial.print(i - 1);  Serial.print(":");
    for (byte j = 0; j < xChSize; j++) {
      Serial.print(" ");
      Serial.print(getState(j, i - 1) ? "X " : "- ");
    }
    Serial.println();
  }
  Serial.print("    0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15");
  Serial.println();
}
