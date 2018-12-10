import processing.serial.*;

Serial port;

void setup()
{
	size(500, 300);
	frameRate(60);

	background(128);

	println(Serial.list());
	println("select = " + Serial.list()[0]);
	port = new Serial(this, Serial.list()[0], 9600);
	port.clear();
}

int pRead;
boolean [] btnState = new boolean[4];
static final char[] key_name = {'D', 'F', 'J', 'K'};

void draw()
{
	if(port.available() > 0)
	{
		pRead = port.read();
		println("Read = " + pRead);
		for(int i = 0; i < 4; i++)
		{
			btnState[i] = pRead % 2 != 0 ? true : false;
			pRead /= 2;
		}
	}

	boolean p = false;
	for(int i = 0; i < 4; i++)
	{
		if(btnState[i])
		{
			print(key_name[i]);
			p = true;
		}
	}
	if(p)
		println();

	fill(255);
	for(int i = 0; i < 4; i++)
	{
		if(btnState[i])
		{
			fill(0, 0, 255);
		}
		else
			fill(255);
		rect(50 + i * 100, 50, 100, 100);
	}

}