void circle(int length, int offsetX, int offsetY, int r, int g, int b)
{
  for(int i = 0; i < 4; i++)
  {
    for(int j = 0; j < 3; j++)
    {
      fill(r, g, b);
      ellipse(100 + 200 * i + offsetX, 100 + 200 * j + offsetY, length, length);
    }
  }
}

int height = 600, width = 800;

void setup()
{
    size(800, 600);
    background(128, 128, 128);
    noStroke();
    randomSeed(0);
}


void draw()
{
  float offsetX = (float)(mouseX - width/2) / (float)width;
  float offsetY = (float)(mouseY - height/2) / (float)height;
  
  print("X:", mouseX, "y:", mouseY, '\n');
  
  circle(200, 0, 0, 255, 0, 0);
  circle(100, (int)(30 * offsetX), (int)(20 * offsetY), 0, 255, 0); // big
  circle(50, (int)(75 * offsetX), (int)(50 * offsetY), 0, 0, 255); // small
}
