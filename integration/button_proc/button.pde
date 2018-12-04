import processing.serial.*;

class Ball
{
	float hitOffset = 1.f;
	float scale;
	float x, y;
	PImage img;

	Ball()
	{
		scale = 0.f;
	}

	void setPos(float xx, float yy)
	{
		x = xx;
		y = yy;
	}

	void setOffset(float offset)
	{
		hitOffset = offset;
	}
	void setImage(PImage i)
	{
		img = i;
	}

	void hit()
	{
		scale += hitOffset;
	}

	void display()
	{
		image(img, x, y, 100 + scale, 100 + scale);
	}

	boolean judge()
	{
		if(scale > 300)
			return true;
		else
			return false;
	}
}

Serial port;
int val;

PImage blue, purple;
Ball b1, b2;

void setup() {
	size(800, 600);
	frameRate(60);

	println(Serial.list()); 
	String portName = Serial.list()[1]; 
	println("PortName = " + portName);

	background(0);

	port = new Serial(this, portName, 9600);

	blue = loadImage("blue.jpg");
	purple = loadImage("purple.jpg");

	b1 = new Ball();
	b2 = new Ball();

	b1.setPos(0, 100);
	b2.setPos(400, 100);

	b1.setOffset(0.5);
	b1.setImage(blue);

	b2.setOffset(0.5);
	b2.setImage(purple);

	textAlign(CENTER);
	textSize(36);
}

int now, orig;
boolean [] btn = new boolean[2], prev = new boolean[2];
boolean end = false;

void draw() {
	if(end)
		return;

	if (0 < port.available())
		val = port.read();

	background(255);
	
	fill(128);
	// left
	if(val == 2 || val == 3)
	{
		b1.hit();
	}

	fill(128);
	// right
	if(val == 1 || val == 3)
	{
		b2.hit();
	}

	for(int i = 0; i < 2; i++)
		btn[i] = prev[i];
	b1.display();
	b2.display();

	fill(0, 0, 0);
	if(!end && b1.judge())
	{
		text("Player 1 Win", 400, 100);
		end = true;
	}

	if(!end && b2.judge())
	{
		text("Player 2 Win", 400, 100);
		end = true;
	}

	println("Ball 1 = " + b1.scale);
	println("Ball 2 = " + b2.scale);
}