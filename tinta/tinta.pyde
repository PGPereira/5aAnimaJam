def setup():
    global w, h, x, y, down, targetX, rolo
    size(1920, 1080);
    noStroke();
    rolo = loadImage("rolo.png")
    w = 300
    h = 100;
    x = .0;
    y = .0;
    targetX = .0;
    down = True
    
def draw():
    global w, h, x, y, down, targetX
    fill(255, 0, 0)
    for i in range(1, 2000):
        k = random(0, 10)
        circle(random(x, w + x), random(y - h, y), k)
        # image(rolo, x, y);
        
    if(down):
        y += h/3.0
    else:
        x = (targetX - w) + w * ((height - y)/height)
        y -= h * 2/3.0
        
    if(y >= height + h):
        y = height + h
        x += w
        targetX += w;
        down = False
    elif(y <= 0):
        y = 0
        down = True
    
    if(x < width): 
        saveFrame("frames/tinta-#####.tif");
    else:
        exit()
    # print(x, y, targetX, ((height - y)/height));
    
        
    
