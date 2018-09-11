
void diag()
{
     for(int i = 0; i < 100; i++)
     {
         stroke(255, 0, 0);
         strokeWeight(3);
         ellipse(0 + 10 * i, 0 + 10 * i, 10, 10);
     }
     
     
}

void setup()
{
    size(800, 800);
    background(255, 255, 255);
    noStroke();
}


void draw()
{
  diag();
}
