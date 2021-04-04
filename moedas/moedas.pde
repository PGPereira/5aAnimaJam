PImage bg;
int k;
float wOffset, yOffset;
ArrayList<PVector> initial, list;
ArrayList<PImage> images;
int wait = 0;

int[][] matrix = {
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1,  0,  0, -1, -1,  0, -1, -1,  0, -1,  0,  0,  0, -1,  0,  0,  0, -1, -1, -1,  0,  0, -1, -1, -1,  0,  0, -1, -1, -1,  0,  0,  0, -1},
    {-1,  0, -1, -1,  0, -1,  0, -1, -1,  0, -1, -1,  0, -1, -1,  0, -1, -1,  0, -1,  0, -1, -1,  0, -1, -1,  0, -1,  0, -1, -1,  0, -1, -1, -1},
    {-1,  0, -1, -1,  0, -1,  0, -1, -1,  0, -1, -1,  0, -1, -1,  0,  0,  0,  0, -1,  0, -1, -1,  0, -1, -1,  0, -1, -1,  0, -1,  0,  0,  0, -1},
    {-1,  0, -1, -1,  0, -1,  0, -1, -1,  0, -1, -1,  0, -1, -1,  0, -1,  0, -1, -1,  0,  0,  0,  0, -1, -1,  0, -1, -1,  0, -1,  0, -1, -1, -1},
    {-1, -1,  0,  0, -1, -1, -1,  0,  0, -1, -1, -1,  0, -1, -1,  0, -1, -1,  0, -1,  0, -1, -1,  0, -1, -1,  0,  0,  0, -1, -1,  0,  0,  0, -1},
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1,  0, -1, -1, -1,  0, -1,  0,  0,  0, -1,  0, -1, -1,  0, -1, -1,  0,  0, -1, -1, -1,  0,  0, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1,  0,  0, -1,  0,  0, -1,  0, -1, -1, -1,  0,  0, -1,  0, -1,  0, -1, -1,  0, -1,  0, -1, -1, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1,  0, -1,  0, -1,  0, -1,  0,  0,  0, -1,  0, -1,  0,  0, -1,  0, -1, -1,  0, -1,  0,  0,  0, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1,  0, -1, -1, -1,  0, -1,  0, -1, -1, -1,  0, -1, -1,  0, -1,  0, -1, -1,  0, -1, -1, -1,  0, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1,  0, -1, -1, -1,  0, -1,  0,  0,  0, -1,  0, -1, -1,  0, -1, -1,  0,  0, -1, -1,  0,  0, -1, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}
};

void setup(){
    size(1980, 1020);
    bg = loadImage("table.jpg");
    bg.resize(width, 0);
    
    k = min(height/matrix.length, width/matrix[0].length);
    wOffset = (width - matrix[0].length * k)/2.0;
    yOffset = (height - matrix.length * k)/2.0;
    int[] coins = {1, 5, 10, 25, 50, 100};
    initial = new ArrayList<PVector>();
    list = new ArrayList<PVector>();
    images = new ArrayList<PImage>(2 * coins.length);
    PImage c;
    
    for (int i : coins) {
       c = loadImage(String.format("%df.png", i));
       c.resize(k,k);
       images.add(c);
       
       c = loadImage(String.format("%dv.png", i));
       c.resize(k,k);
       images.add(c);
    }
    
    for (int i = 0; i < matrix.length; i++) {
        for (int j = 0; j < matrix[i].length; j++) {
          if(matrix[i][j] != -1) {
            initial.add(new PVector(j, i));
          }
        }
    }
}
    
void draw() {
    image(bg, 0, 0);
        
    for (PVector coin: list) {
      PImage c = images.get(int(coin.z));
      float x = coin.x * k + wOffset;
      float y = coin.y * k + yOffset;
      
      image(c, x, y);
    }
    
    saveFrame("frames/moedas-###.tif");
    
    if(initial.size() > 0) {
      int x = floor(random(initial.size()));
      PVector c = initial.get(x);
      c.z = floor(random(images.size()));
      
      list.add(c);
      initial.remove(x);
      
      if(initial.size() == 0) {
        wait = frameCount + 78;
      }
    } else if(list.size() > 0 && frameCount >= wait) {  
      list.remove(int(random(list.size())));
    } else if(list.size() == 0) {
      exit();
    }
}
