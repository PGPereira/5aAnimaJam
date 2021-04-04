def setup():
    global r, cycle
    cycle = 24 * 10.0
    noStroke();
    r = 200;
    size(1980,1080)
    
def draw():
    global r, cycle
    
    fill("#05ffa1")
    rect(0, 0, width, height)
    
    fill(255,251,150,128)
    circle(width/2, height * sin((frameCount/cycle) * PI), (r + 15) * (1 + 2 * sin((frameCount/cycle) * PI)))
    
    fill("#ff71ce")
    circle(width/2, height * sin((frameCount/cycle) * PI), r * (1 + 2 * sin((frameCount/cycle) * PI)))
    
    fill("#01cdfe")
    rect(0, height * 3/4, width, height)
    
    fill(255,251,150,128)
    arc(width/2, height * 3/4,  3 * r * (1 + 2 * sin((frameCount/cycle) * PI)), 3 * sqrt(10 * r * (1 + 2 * sin((frameCount/cycle) * PI))), 0, PI, CHORD)
    
    fill(255,113,206, 128)
    arc(width/2, height * 3/4,  2 * r * (1 + 2 * sin((frameCount/cycle) * PI)), 2 * sqrt(10 * r * (1 + 2 * sin((frameCount/cycle) * PI))), 0, PI, CHORD)
    
    if(frameCount <= cycle / 2):
        saveFrame("frames/sunset-###.tif")
    else:
        exit()
    
