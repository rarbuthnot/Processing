 
import processing.serial.*;
 
Serial myPort;        // The serial port
PFont f;
 
void setup () {
  // set the window size:
  size(800, 200);        
 
  // List all the available serial ports
  //println(Serial.list());
  // I know that the first port in the serial list on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[0], 115200);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  // set inital background:
  background(0);
 
  f = loadFont("Courier-48.vlw");
 
}

void draw () {
 // everything happens in the serialEvent()
}
 
void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
 
  if (inString != null) {
  // trim off any whitespace:
  inString = trim(inString);
  background(0);
  textFont(f,48);
  fill(255);
  text(inString, 10,100);
  }
}
