final int IDLE=0;
final int STATE_CLOSE=1;
final int N=2;  //Three states
import processing.serial.*;  

import processing.video.*;
Movie [] mov = new Movie [N];
Serial myPort;

int state;
int val;

void setup() {
  size(1920, 1080);
  background(0);
  noStroke();

  state=IDLE;
  surface.setTitle("Current state: "+state);
  updateVal();


  mov[0] = new Movie(this, "mask_loop.mp4");
  mov[1] = new Movie(this, "triggered_blobs.mp4");
}

void draw() {
  background(0);
  if (val >0 && val<=165) {
    image(mov[1], 0, 0);
  } else if (val > 165) {
    image(mov[0], 0, 0);
  }
}

void keyPressed() {

  if (keyCode>='0' && keyCode<='2') {
    state=keyCode-'0';
    updateVal();
    surface.setTitle("Current state: "+state);
  }
}



void movieEvent(Movie m) {
  m.read();
}

void updateVal() {

  stopVideos();

  switch(state) {
  case IDLE:
    val= 
    mov[0] = new Movie(this, "mask_loop.mp4");
    mov[0].loop();
    break;
  case STATE_CLOSE:
    val= 165;
    mov[1] = new Movie(this, "triggered_blobs.mp4");
    mov[1].loop();
    break;
  default:
    break;
  }
}

void stopVideos() {

  if (mov[0]!= null) mov[0].stop();
  if (mov[1]!= null) mov[1].stop();
}
