/**
 
Feeltagged - Arduino research project
 
Distributed under the MIT License :
 
Copyright (c) 2009 <http://blankdots.com>
 
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
 
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
 
**/
 
#include <LiquidCrystal.h>
 
/**
Set the pins and variable for the shield we are building
**/
int potPin = 2;
int ledPin1 = 9;
int ledPin2 = 10;
int ledPin3 = 11;
LiquidCrystal lcd(2, 3, 4, 5, 6, 7, 8);
 
int val = 0;
int incomingByte = -1; // incoming value on the serial port
 
 
void setup() {
  
  lcd.print("hello, world!"); //system is online
  Serial.begin(9600); //start serial communication
  
  //set the leds as output
  
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
}
 
void loop() {
  
  val = analogRead(potPin); // reading the value from the potentiometer 0 - 1023
  
/**
Quick test to see if LEDs are ok
**/
  
  if (val >= 500)
  {
    analogWrite(ledPin1, 50);
    analogWrite(ledPin2, 50);
    analogWrite(ledPin3, 50);
    
    lcd.clear();
    lcd.home();
    lcd.print("leds are working");
    lcd.setCursor(0,1);
    lcd.print("sweet! :)");
  }
 
/**
Serial communication
**/
 
 if (Serial.available() > 0) {
    incomingByte = Serial.read();
    if (incomingByte == 'M') {
       analogWrite(ledPin1, 0); analogWrite(ledPin2, 0); analogWrite(ledPin3, 0); //reset pin value
       
       analogWrite(ledPin3, 100);
       Serial.println("i feel sad :(");
       
       lcd.clear(); lcd.home();
       lcd.print("i feel sad :(");
    }
    else
    {
       if (incomingByte == 'N') {
           analogWrite(ledPin1, 0); analogWrite(ledPin2, 0); analogWrite(ledPin3, 0); //reset pin value
           
           analogWrite(ledPin2, 100);
           Serial.println("i feel happy :)");
       
           lcd.clear(); lcd.home();
           lcd.print("i feel happy :)");
       }
   }
   if (incomingByte == 'O') {
       analogWrite(ledPin1, 0); analogWrite(ledPin2, 0); analogWrite(ledPin3, 0); //reset pin value
       
       analogWrite(ledPin1, 80);
       analogWrite(ledPin2, 80);
       Serial.println("i feel ok :|");
       
       lcd.clear(); lcd.home();
       lcd.print("i feel ok :|");
    }
    else
    {
       if (incomingByte == 'P') {
           analogWrite(ledPin1, 0); analogWrite(ledPin2, 0); analogWrite(ledPin3, 0); //reset pin value
           
           analogWrite(ledPin2, 80);
           analogWrite(ledPin3, 80);
           Serial.println("i feel kinda good :-S");
           
           lcd.clear(); lcd.home();
           lcd.print("i feel kinda ");
           lcd.setCursor(0,1);
           lcd.print("good :-S");
       }
   }
   if (incomingByte == 'Q') {
       analogWrite(ledPin1, 0); analogWrite(ledPin2, 0); analogWrite(ledPin3, 0); //reset pin value
       
       analogWrite(ledPin1, 80);
       analogWrite(ledPin3, 80);
       Serial.println("i feel angry X(");
       
       lcd.clear(); lcd.home();
       lcd.print("i feel angry X(");
    }
    else
    {
       if (incomingByte == 'R') {
           analogWrite(ledPin1, 0); analogWrite(ledPin2, 0); analogWrite(ledPin3, 0); //reset pin value
           
           analogWrite(ledPin1, 50);
           analogWrite(ledPin2, 50);
           analogWrite(ledPin3, 50);
           Serial.println("i don't know ?");
           
           lcd.clear(); lcd.home();
           lcd.print("i don't know ?");
           
       }
   }
   if (incomingByte == 'B') {
       analogWrite(ledPin1, 0); analogWrite(ledPin2, 0); analogWrite(ledPin3, 0); //reset pin value
       
       Serial.println("Bye Bye");
       
       lcd.clear(); lcd.home();
       lcd.print("Bye Bye ");
       lcd.setCursor(0,1);
       lcd.print("I'll tweet this :D ");
    }
  else{
     if (incomingByte == 'A') {
       analogWrite(ledPin1, 0); analogWrite(ledPin2, 0); analogWrite(ledPin3, 0); //reset pin value
       
       analogWrite(ledPin1, 50);
       Serial.println("Bye Bye");
       lcd.clear(); lcd.home();
       lcd.print("Bye Bye ");
       lcd.setCursor(0,1);
       lcd.print("I'll tweet this :D ");
    }
  }
 }
 
/*end of this*/
}