import processing.serial.*;
import processing.video.*;
Serial myPort;

Movie[]video = new Movie [2];
int i =0;
int val=0;
String check = "";
 
void setup() {
  fullScreen(P2D);
  String portName = Serial.list()[3];
  myPort= new Serial (this, portName,9600);
  video [0] = new Movie(this, "mask_loop.mp4");
  video [1] = new Movie(this, "triggered_blobs.mp4");
  video [0].loop(); 
  video [1].loop(); 
}
 
void draw() {
  background(0);
 image(video[i],0,0,width,height);
    check = myPort.readStringUntil('\n');// read it and store it in val
    println(check);
 
 if (video[i].available()) {
    video[i].read(); 
  }
} 
  void serialEvent(Serial p) {
    if (myPort.available()>0) {
      val=myPort.read();
      ; 
}
if (val==0) {
  i=1;
}
else {
  i=0;
}
  }
