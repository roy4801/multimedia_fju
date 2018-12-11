#include <Arduino.h>

#define on(x) digitalWrite((x), HIGH)
#define off(x) digitalWrite((x), LOW)


void setup()
{
	pinMode(13, OUTPUT);
}

void loop()
{
	on(13);
	delay(1000);
	off(13);
}

int main()
{
	
	setup();
	for(;;)
	{
		loop();
	}

	return 0;
}