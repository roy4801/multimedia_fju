
void setup()
{
    size(800, 600);
    background(255, 255, 255);
    frameRate(5);
}

void draw()
{
    
}

void bezier(int fromX, int fromY, int toX , int toY, int c1, int c2)
{
    for(float t = 0.f; i <= 1.f; i += 0.01)
    {
        float x = (1.f - t) * (1.f - t) * fromX + 2.f * t * (1.f - t) * c1 + i * i * toX;
    }
}
