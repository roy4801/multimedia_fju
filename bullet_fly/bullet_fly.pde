PImage sprite;

int numBullet = 5;
int currentBullet = 0;
float imageW = 130, imageH = 160;
boolean shot; // once click per shot

class Bullet
{
  float x, y;
  float [] target, from;
  boolean valid, move;
  
  final float unit = 10;
  final float speed = 1;
  
  Bullet()
  {
    target = new float[2];
    from = new float[2];
    
    valid = true;
    move = false;
  }
  
  Bullet(int x, int y)
  {
    target = new float[2];
    from = new float[2];
    
    from[0] = this.x = x;
    from[1] = this.y = y;
    
    valid = true;
  }
  
  void start(float x, float y)
  {
    target[0] = x;
    target[1] = y;
    
    move = true;
  }
  
  void update()
  {
    if(valid && move)
    {
      x += (target[0] - from[0]) / unit * speed;
      y += (target[1] - from[1]) / unit * speed;
    }
  }
  
  void display()
  {
    if(valid)
      image(sprite, x, y, imageW, imageH);
  }
}

Bullet [] b  = new Bullet[numBullet];

void setup()
{
    size(800, 600);
    background(0);
    frameRate(30);
    // Init
    sprite = loadImage("bullet.png");
    shot = false;
    
    for(int i = 0; i < numBullet; i++)
    {
      b[i] = new Bullet(100 + i*100, 400);
    }
}

void draw()
{
    background(0);
    //---------------------------------------------
    // Processing Input
    if(mousePressed)
    {
      if(!shot && mouseButton == LEFT)
      {
        b[currentBullet].start(mouseX, mouseY);
        currentBullet++;
        currentBullet %= numBullet;
        shot = true;
      }
    }
    else
    {
        shot = false;
    }
    
    //---------------------------------------------
    // Update
    for(int i = 0; i < numBullet; i++)
        b[i].update();
    
    //---------------------------------------------
    // Draw
    for(int i = 0; i < numBullet; i++)
        b[i].display();
}
