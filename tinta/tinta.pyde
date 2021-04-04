def setup():
    global w, h, x, y, down, targetX, state, bg
    size(1920, 1080);
    bg = loadImage("background.png");
    bg.resize(0, height);
    noStroke();
    w = 300
    h = 100
    x = .0
    y = .0
    targetX = .0
    down = True
    state = 0
    image(bg, 0, 0)
    
def draw():
    global w, h, x, y, down, targetX, state, bg
    
    fill(255, 0, 0)
    print(x, y)
    if(state == 0):
        for i in range(1, 4000):
            k = random(0, 10)
            circle(random(x, w + x), random(y - h, y), k)
    elif(state == 1):
        copy(
            bg, 
            int(x), int(max(y - h, 0)), w, h, 
            int(x), int(max(y - h, 0)), w, h
        );
    
        
    if(down):
        y += h
    else:
        y -= h*2/3.0
        x = (targetX - w) + w * ((height - y)/height)
        
        
    if(y >= height + h):
        y = height + h
        x += w
        targetX += w;
        down = False
    elif(y <= 0):
        y = 0
        down = True
        
    saveFrame("frames/tinta-#####.tif")
    if(state == 0 and x > width):
        x = 0
        y = 0
        targetX = 0
        down = True
        state = 1
    elif(state == 1 and x > width):
        exit()
