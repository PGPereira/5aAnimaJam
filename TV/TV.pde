PImage tv, bg;

void setup(){
  size(1920,1080);
  tv = loadImage("TV.png");
  tv.resize(0, height);
}

void draw() {
  PImage soldier = loadImage(String.format("../soldier/frame/soldier-%03d.tif", ceil(frameCount/4.0)));
  soldier.resize(0, 650);
  soldier = addScanline(soldier, frameCount % 13, 13);
  
  image(soldier, 655, 156);
  image(tv, 0, 0);
  saveFrame("frames/tv-###.png");
}

PImage addScanline(PImage k, int cycleBegin, int scanCycle) {
  k.loadPixels();
  for(int j = cycleBegin; j < k.height; j += scanCycle) {
     int offset = int(random(1,30));
     
     if((j + cycleBegin) % 2 == 0) {
       for(int l = j; l <= j+2 && l < k.height; l++) {
         for(int i = k.width - 1; i > offset; i--) { 
           k.pixels[i + l * k.width] = k.pixels[(i - offset) + l * k.width];
         } 
       }
     } else {
       for(int l = j; l <= j+2 && l < k.height; l++) {
         for(int i = 0; i < k.width - offset; i++) { 
           k.pixels[i + l * k.width] = k.pixels[(i + offset) + l * k.width];
         }
       }
     }
  } 
  k.updatePixels();
  
  return k;
}

void mouseClicked() {
  println(mouseX, mouseY);
}
