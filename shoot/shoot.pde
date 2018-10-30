PImage sprite;

int numBullet = 100;
int currentBullet = 0;

int numMonster = 100;
int currentMonster = 0;

class Clock
{
	int orig;

	Clock()
	{
		orig = millis();
	}

	void reset()
	{
		orig = millis();
	}

	int elasped()
	{
		return millis() - orig;
	}
}

boolean shot; // once click per shot

class Rocket
{
	int x, y;

	Rocket()
	{
		x = 400;
		y = 500;
	}

	void display()
	{
		image(sprite, x - 25, y - 50, 50, 100);
	}

	void goLeft()
	{
		x -= 10;
	}
	void goRight()
	{
		x += 10;
	}
}

class Monster
{
	float x, y;
	boolean valid;

	Monster()
	{
		valid = false;
	}

	void start(float x, float y)
	{
		this.x = x;
		this.y = y;

		valid = true;
	}

	void end()
	{
		valid = false;
	}

	void update()
	{
		y += 10;

		if(y > 600)
			valid = false;
	}
	void display()
	{
		if(valid)
			rect(x - 25, y - 25, 50, 50);
	}
}

class Bullet
{
  float x, y;
  boolean valid;
  
  Bullet()
  {    
	valid = false;
  }
  
  void start(float x, float y)
  {
  	this.x = x;
  	this.y = y;
   	
   	valid = true;
  }

  void end()
  {
	valid = false;
  }
  
  void update()
  {
    if(valid)
    {
   		y -= 10;
   		if(y < 0)
   			valid = false;
    }
  }
  
  void display()
  {
    if(valid)
    {
    	ellipse(x - 5, y - 5, 10, 10);
      // image(sprite, x, y, imageW, imageH);
    }
  }
}

Bullet [] b  = new Bullet[numBullet];
Monster [] m = new Monster[numMonster];
Rocket r = new Rocket();
Clock c;
int score = 0;

void setup()
{
    size(800, 600);
    textSize(20);
    background(0);
    frameRate(30);
    randomSeed(0);
    // Init
    sprite = loadImage("rocket.jpg");
    shot = false;
    

    c = new Clock();
    for(int i = 0; i < numBullet; i++)
    {
  		b[i] = new Bullet();
    }

    for(int i = 0; i < numMonster; i++)
    	m[i] = new Monster();
}

void draw()
{
    background(0);
    //---------------------------------------------
    // Processing Input
    if(mousePressed)
    {
		if(mouseButton == LEFT)
		{
			b[currentBullet].start(r.x, r.y - 50);
			currentBullet++;
			currentBullet %= numBullet;
		}
    }

    // rocket
    if(keyPressed)
    {
    	if(key == 'a' || key == 'A')
    		r.goLeft();
    	else if(key == 'd' || key == 'D')
    		r.goRight();
    }
    
    //---------------------------------------------
    // Update
    // gen monster
    if(c.elasped() >= 500)
    {
    	m[currentMonster].start(random(0, 800), 0);
    	currentMonster++;
    	if(currentMonster > numMonster)
    		currentMonster = 0;
    	c.reset();
    }

    for(int i = 0; i < numBullet; i++)
        b[i].update();
    for(int i = 0; i < numMonster; i++)
    	m[i].update();
    
    // judgement
    for(int i = 0; i < numBullet; i++)
    {
    	if(b[i].valid)
	    	for(int j = 0; j < numMonster; j++)
	    	{
	    		boolean p = false;
	    		if(m[j].valid)
	    		{
		    		float xx = pow(abs(b[i].x - m[j].x), 2);
		    		float yy = pow(abs(b[i].y - m[j].y), 2);
		    		float dis = sqrt(xx + yy);
		    		if(!p)
		    		{
    					println("Dis " + dis + "\n");
    					p = true;
		    		}
		    		if(dis < 60)
		    		{
		    			println("end:" + b[i].x + " " + b[i].y);
		    			println("end:" + m[j].x + " " + m[j].y);
		    			m[j].end();
		    			b[i].end();
		    			score++;
		    		}
		    	}
	    	}
    }
    
    //---------------------------------------------
    // Draw
    for(int i = 0; i < numBullet; i++)
        b[i].display();
    for(int i = 0; i < numMonster; i++)
    	m[i].display();
    r.display();


    text("Score: " + str(score), 10, 20);
}
