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
  background(255, 255, 255);
  minim = new Minim(this);
  center = new PVector(width/2, height/2, 0);
  
  player = minim.loadFile("/Users/frenchal/Desktop/EM_Songs/ShaveIt.mp3", 2048);
  player.play();
}

void draw() {
  angle += 0.07;
  int rgbselect = floor(random(0, 3));
  int change = floor(random(-1, 2)) * floor(random(1, 30));
  switch(rgbselect) {
    case 0:
      redvalue += change;
      break;
    case 1:
      greenvalue += change;
      break;
    case 2:
      bluevalue += change;
      break;
  }
  fill(redvalue, bluevalue, greenvalue);
  stroke(0, 0, 0);
  translate(center.x, center.y, 0);
  rotateX(frameCount/90.0);
  rotateY(frameCount/100.0);
  for (int i = 0; i < 1000; i++) {
    box(100 + player.left.get(i)*150);
  }
  
}
