
void bezier(int fromX, int fromY, int toX , int toY, int c1, int c2)
{
	stroke(255, 0, 0); // Red

	float x = float(fromX);
    float y = float(fromY);
    for(float t = 0.f; t <= 1.f; t += 0.01f)
    {
        float nx = (1.f - t) * (1.f - t) * fromX + 2.f * t * (1.f - t) * c1 + t * t * toX;
        float ny = (1.f - t) * (1.f - t) * fromY + 2.f * t * (1.f - t) * c2 + t * t * toY;
        println("x:", x);
        println("y:", y);
        print('\n');

        line(x, y, nx, ny);
        x = nx;
        y = ny;
    }
}

void setup()
{
    size(800, 600);
    background(255, 255, 255);
    frameRate(10);
}

float t = 0.f;
int fromX = 30, fromY = 30, toX = 700, toY = 500, c1 = 600, c2 = 50;
float x = float(fromX);
float y = float(fromY);

void draw()
{
  if(t >= 1.f)
    return;
    //bezier(30, 30, 700, 500, 600, 50);
    stroke(255, 0, 0); // Red
  
    
    //for(float t = 0.f; t <= 1.f; t += 0.01f)
    //{
        float nx = (1.f - t) * (1.f - t) * fromX + 2.f * t * (1.f - t) * c1 + t * t * toX;
        float ny = (1.f - t) * (1.f - t) * fromY + 2.f * t * (1.f - t) * c2 + t * t * toY;
        println("x:", x);
        println("y:", y);
        print('\n');

        line(x, y, nx, ny);
        x = nx;
        y = ny;
    //}
    t += 0.01f;
    
}
