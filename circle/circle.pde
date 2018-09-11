void circle(int length, int r, int g, int b)
{
  for(int i = 0; i < 4; i++)
  {
    for(int j = 0; j < 3; j++)
    {
      fill(r, g, b);
      ellipse(100 + 200 * i, 100 + 200 * j, length, length);
    }
  }
}

void setup()
{
    size(800, 600);
    background(255, 255, 255);
    noStroke();
    randomSeed(0);
}


void draw()
{
  for(int i = 200; i >= 0; i -= 10)
  {
    circle(i, (int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  }
}
