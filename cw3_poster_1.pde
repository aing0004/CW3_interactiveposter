import processing.serial.*;  
import processing.video.*;
Serial myPort;
//PFont  myFont; 
Movie myMovie1;
//Movie myMovie2;
String data; 


void setup() {

  size(1920, 1080);
  background(0);

  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  myMovie1 = new Movie(this, "mask_loop.mp4");
  myMovie2 = new Movie(this, "triggered_blobs.mp4");
}


void draw() {

  /*checking distance for sensor to trigger
   background(0);
   textAlign(CENTER);
   fill(255);
   text(data, 820, 400);
   textSize(100);
   fill(#4B5DCE);
   text("              Distance :        cm", 450, 400);
   noFill();
   stroke(#4B5DCE);
   */

  data=myPort.readStringUntil('\n');
  int check = int(data);

  if (check < 1) {
    image(myMovie1, 0, 0);
    myMovie1.loop();
  } else if(check > 1) { 
     image(myMovie2, 0, 0);
     myMovie2.play();
  }
}

void movieEvent(Movie m) {
  m.read();
}

//void serialEvent(Serial myPort) {
//  data=myPort.readStringUntil('\n');
//}



/* to find serial port on mac 
 void setup() {
 size(1000, 1000);
 background(255);
 }
 
 void draw() {
 
 printArray(Serial.list());
 }
 */
