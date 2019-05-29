import processing.serial.*;
import processing.video.*; 

Serial myPort;
String val;
final String close = "1";
final String far = "0";


Movie video1, video2;

void setup() {
  //fullScreen(SPAN);
  size(640, 480);

  video1 = new Movie(this, "mask_loop.mp4");
  video2 = new Movie(this, "triggered_blobs.mp4");

  String portName = Serial.list()[3];
  myPort = new  Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  background(0);
  image(video1, 0, 0, 640, 480);
  video1.play();

  //troubleshooting video playback
  image(video2, 300, 200, 640, 480);
  video2.play();

 /* if (val.equals(close)) { // i dont think this is being considered - potential logic error
    video1.stop();
    background(0);
    image(video2, 300, 200, 640, 480);
    video2.play();
  }*/

  println(val); // troubleshooting in console
} 

void movieEvent(Movie vid) {
  if (vid == video1) {
    video1.read();
  } else if (vid == video2) {
    video2.read();
  }
}

void serialEvent (Serial myPort) {
  if (myPort.available() > 0) {
    val=myPort.readStringUntil('\n');
  }
}
