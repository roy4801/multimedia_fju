final int numText = 10;
Text[] text = new Text[numText];
int currentText = 0;

final int WIDTH = 600, HEIGHT = 600;

void setup()
{
  size(600, 600);
  smooth();
  randomSeed(0);
  
  for(int i = 0; i < numText; i++)
      text[i] = new Text();
}

void draw()
{
  background(0);
  
  // Update
  for(int i = 0; i < numText; i++)
  {
    text[i].grow();
  }
  
  
  // Draw
  for(int i = 0; i < numText; i++)
  {
    text[i].display();
  }
}

void keyPressed()
{
  text[currentText].setText(key);
  text[currentText].start(random(WIDTH), random(HEIGHT));
  currentText++;
  currentText %= numText;
}

class Text
{
  char t;
  float x, y, size;
  boolean on;
  int [] rgb;
  
  Text()
  {
    t = 0;
    size = 0.f;
    on = false;
    rgb = new int[3];
  }
  
  void setText(char c)
  {
     t = c;
  }
  
  void start(float x, float y)
  {
    this.x = x;
    this.y = y;
    on = true;
    rgb[0] = (int)random(255);
    rgb[1] = (int)random(255);
    rgb[2] = (int)random(255);
    size = 1;
  }
  
  void grow()
  {
    if(on)
    {
      size += 0.5;
      
      if(size > 1000.f)
        on = false;
    }
  }
  
  void display()
  {
    if(on)
    {
      fill(rgb[0], rgb[1], rgb[2]);
      textSize(size);
      text(t, x, y);
    }
  }
}
