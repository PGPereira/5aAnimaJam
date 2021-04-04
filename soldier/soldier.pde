PImage soldier;
int minWidth = 20;
int maxWidth = 500;
int cycle = 24;

void setup(){
    noStroke();
    size(1920,1080);
    soldier = loadImage("soldier.png");
    imageMode(CENTER);
}
    
void draw() {
    fill(255);
    rect(0, 0, width, height);
    
    soldier.resize(minWidth, 0);
    float hImage = soldier.height/6.0;
    float wImage = soldier.width/2.0;
    float k = (wImage  * ceil(float(width)/wImage) - width)/2.0;
    
    for(float j = (frameCount % cycle) - cycle; ;j += hImage) {
      for (float i = width + k + wImage; i >= -(k + wImage); i -= wImage) {
        image(soldier, i, j);
      }
      
      soldier = loadImage("soldier.png");
      soldier.resize(int(minWidth + (maxWidth - minWidth) * j/height), 0);
      hImage = soldier.height/6.0;
      wImage = soldier.width/2.0;
      
      k = (wImage  * ceil(float(width)/wImage) - width)/2.0;
      
      if(j > hImage + width) 
        break;
    }
    
    if(frameCount == cycle) {
      exit();
    } else {
      saveFrame("frame/soldier-###.tif");
    }
}
