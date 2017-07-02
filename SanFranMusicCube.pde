import ddf.minim.*;

AudioPlayer player;
Minim minim;

PVector center;
float angle = 0.0;
int redvalue = 127;
int greenvalue = 127;
int bluevalue = 127;

void setup() {
  size(600, 600, P3D);
  background(0);
  minim = new Minim(this);
  center = new PVector(width/2, height/2, 0);
  
  player = minim.loadFile("/Users/frenchal/Desktop/FinalProjectSong.mp3", 2048);
  player.play();
}

void draw() {
  angle += 0.07;
  int rgbselect = floor(random(0, 3));
  int change = floor(random(-1, 2)) * floor(random(1, 10));
  switch(rgbselect) {
    case 0:
      redvalue = max(min(redvalue + change, 255), 0);
      break;
    case 1:
      greenvalue = max(min(greenvalue + change, 255), 0);
      break;
    case 2:
      bluevalue = max(min(bluevalue + change, 255), 0);
      break;
  }
  directionalLight(redvalue,greenvalue,bluevalue, -1, -1, 0);
  directionalLight(redvalue,greenvalue,bluevalue, 1, -1, 0);
  translate(center.x, center.y, 0);
  rotateX(frameCount/900.0);
  rotateY(frameCount/1000.0);
  box(100 + player.left.get(0)*150);
  for (int i = 0; i < 7; i++) {
    rotateX(frameCount/900.0);
    rotateZ(frameCount/850.0);
    box(100 + player.left.get(i)*150);
  }
}
