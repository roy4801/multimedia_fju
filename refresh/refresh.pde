int y = 0;

void clearScr()
{
  background(255, 255, 255);
}

void setup()
{
  size(300, 300);
  clearScr();
  frameRate(30);
}

void draw()
{
  line(0, y, 300, y);
  y += 4;
  
  if(y > 300)
  {
    clearScr();
    y %= 300;
  }
}
  
