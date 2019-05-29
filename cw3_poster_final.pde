
/*
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

// import oscP5.*;
// import netP5.*;
// import processing.io.*;
import processing.video.*; 

// OscP5 oscP5;
Movie video1, video2;
boolean click = false;
float distance;

void setup() {
  size(1366, 768);

  // start oscP5, listening for incoming messages at port 9000
  //  oscP5 = new OscP5(this, 9000);

  video1 = new Movie(this, "mask_loop.mp4");
  video2 = new Movie(this, "triggered_blobs.mp4");
}

void draw() {

  /* for pi code to work, change keypress if condition (and the keys)
   to distance for idle video and distance for triggered respectively.
   - remove stuff from comments 
   
   
   */


  if (keyPressed) {
    if (key == '1') { //idle video
      background(45, 34, 34);
      image(video1, 0, 0, 1366, 768);
      video1.loop();
    } else if (key == '2') { //triggered video
      video1.stop();
      background(0);
      image(video2, 0, 0, 1366, 768);

      video2.loop();
    } else if (key == '3') {//end of triggered video
      video1.jump(0);
      video2.jump(0);
    }
  }
}

void movieEvent(Movie vid) {
  if (vid == video1) {
    video1.read();
  } else if (vid == video2) {
    video2.read();
  }
}

void keyReleased() {//video kept playing after release
  video1.pause();
  video2.pause();
}


/* incoming osc message are forwarded to the oscEvent method. 

 void oscEvent(OscMessage theOscMessage) {
 print the address pattern and the typetag of the received OscMessage 
 print("### received an osc message.");
 print(" addrpattern: "+theOscMessage.addrPattern());
 println(" typetag: "+theOscMessage.typetag());
 println(" value: "+theOscMessage.get(0).floatValue());
 distance = theOscMessage.get(0).floatValue();
 
 */
