int num = 50;
int[] x = new int[num];
int[] y = new int[num];

class CircleColor
{
	int r, g, b;

	CircleColor()
	{
		r = g = b = 0;
	}

	void Rand()
	{
		r = (int)random(255);
		g = (int)random(255);
		b = (int)random(255);
	}
}

CircleColor [] cir = new CircleColor[num];

 void setup()
 {
	 size(800, 600);
	 noStroke();
	 smooth();
	 fill(255, 102);
	 randomSeed(0);

	 for(int i = 0; i < num; i++)
	 {
	 	cir[i] = new CircleColor();
	 }
 }

 void draw()
 {
	 background(0);
	 // Shift the values to the right
	 for (int i = num-1; i > 0; i--)
	 {
		 x[i] = x[i-1];
		 y[i] = y[i-1];
		 // cir[i] = cir[i-1];
		 cir[i].r = cir[i-1].r;
		 cir[i].g = cir[i-1].g;
		 cir[i].b = cir[i-1].b;
	 }
	 // Add the new values to the beginning of the array
	 x[0] = mouseX;
	 y[0] = mouseY;
	 
	 // print("Rand: " + cir[0].r + " " + cir[0].g + " " + cir[0].b + "\n");
	 cir[0].Rand();

	 // Draw the circles
	 for (int i = 0; i < num; i++)
	 {
	 	fill(cir[i].r, cir[i].g, cir[i].b);
	 	// ellipse(x[i], y[i], i/2.0, i/2.0);
	 	ellipse(x[i], y[i], 30, 10);
	 	ellipse(x[i], y[i], 10, 30);
	 }
 }