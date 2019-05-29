
import processing.serial.*;
import processing.video.*;
Movie myMovie1;
Serial myPort;
String val = "0";
String idle = "0";
String trigger = "1";



void setup() {

  size(1280, 720);
  background(#A48E2C);

  myPort = new Serial(this, Serial.list()[3], 9600);
  myPort.bufferUntil('\n');
  myMovie1 = new Movie(this, "triggered_blobs.mp4");
}

void draw() {
  val = myPort.readStringUntil('\n');// read it and store it in val
  println(val); //print it out in the console
//  delay(10);


  if (val.equals(idle) == true) {
    // image(myMovie1, 0, 0);
    //myMovie1.loop();
    fill(34);
    ellipse(20, 20, 600, 400);
  } else if (val.equals(trigger) == false) {
    fill(0);
    rect(20, 20, 400, 400);
  } else {
    
  }
  
  
}

/*
void movieEvent(Movie m) {

  m.read();
}
*/
