from stars import *

def setup():
    global stars
    size(1920,1080)
    noStroke()
    colorMode(HSB)
    stars = [
        stars(
            random(0,width),
            random(0,height),
            random(1,5),
            int(random(48,96)),
            int(random(192))
        ) for i in range(10000)]

def draw():
    print(frameCount)
    fill(0)
    rect(0,0,1920,1080)
    for star in stars:
        star.display(frameCount)
    
    if (frameCount <= 192):
        saveFrame("frames/star-###.png")
    else:
        exit() 
    
