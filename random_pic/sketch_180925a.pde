final int WIDTH = 600;
final int HEIGHT = 800;

final int total = 20;
int nowImageF = 1, nowImageB = 1;

int btnHeight = 50;

void createBtn(int x, int y, String text)
{
    fill(255, 255, 255);
    rect(x, y, 100, btnHeight);
    
    fill(0, 0, 0);
    textSize(16);
    text(text, x + 20, y + 30);
}

void btn()
{
   // upper
   createBtn(500, 0, "Random");
   createBtn(500, 100, "Next");
   createBtn(500, 150, "Previous");
   
   createBtn(500, 300, "Save");
   
   // bottom
   createBtn(500, 550, "Random");
   createBtn(500, 600, "Next");
   createBtn(500, 650, "Previous");
}

boolean func()
{
  int x = mouseX, y = mouseY;
  
  if(mousePressed == true)
  {
      if(mouseButton == LEFT)
      {
          if(x >= 500)
          {
            // Random
            if(y <= btnHeight)
            {
                nowImageF = (int)random(1, 20);
            }
            else if(y >= 550 && y <= 550 + btnHeight)
            {
                nowImageB = (int)random(1, 20);
            }
            // Next
            else if(y >= 100 && y <= 100 + btnHeight)
            {
                nowImageF++;
                
            }
            else if(y >= 600 && y <= 600 + btnHeight)
            {
                nowImageB++;
            }
            // Previous
            else if(y >= 150 && y <= 150 + btnHeight)
            {
                nowImageB--;
            }
            
            if(nowImageB > 20)
            {
              nowImageB %= total;
              nowImageB += 1;
            }
            if(nowImageF > 20)
            {
              nowImageF %= total;
              nowImageF += 1;
            }
          }
          return true;
      }
  }
  return false;
}

void setup()
{
    size(600, 800);
    frameRate(60);
    
    btn();
}


void draw()
{
    if(!func())
    {
      //
      print(nowImageF);
      String f = Integer.toString(nowImageF);
      String b = Integer.toString(nowImageB);
      
      print(f);
      
      PImage imgFront = loadImage("image/" + f + "t.jpg");
      PImage imgBack = loadImage("image/" + b + "b.jpg");
      
      image(imgFront, 0, 0);
      image(imgBack, 0, 400);
    }
}
