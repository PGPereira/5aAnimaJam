class stars:
    def __init__(self, x, y, r, life, init):
        self.x = x
        self.y = y
        self.r = r
        self.life = life
        self.init = init
        self.dead = False
        
    def display(self, now):
        alive = float(now - self.init)
        if(alive > 0 and not(self.dead)):
            if(self.life - alive >= 0):
                fill(255.0 * ((self.life - alive)/self.life), 128.0, 255.0, 64.0)
                circle(self.x, self.y, self.r + 1.0)
                
                fill(255.0 * (alive/self.life), 255.0, 255.0)
                circle(self.x, self.y, self.r)
            else:
                m = self.r * (1 + sin((1 + (alive - self.life)/self.life) * PI))
                
                if (m == 0):
                    self.dead = True
                else:                
                    fill(255.0, 255.0, 255.0 * (alive/self.life))
                    circle(self.x, self.y, m)
