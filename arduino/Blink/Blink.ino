// the setup function runs once when you press reset or power the board

#define LED_R 13
#define LED_O 12
#define LED_Y 11

bool on[3];
int leds[3] = {LED_R, LED_O, LED_Y};

void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_R, OUTPUT);
  pinMode(LED_O, OUTPUT);
  pinMode(LED_Y, OUTPUT);
  for(int i = 0; i < 3; i++)
    on[i] = true;
}

void led(int f, int t, int d)
{
  for(int i = f; i < t; i++)
  {
    digitalWrite(leds[i], on[i]);
    delay(d);
  }
}

int cnt = 0;

void resetLed()
{
  cnt = -1;
}

// the loop function runs over and over again forever
void loop()
{
  if(cnt == 3)
  {
    for(int i = 0; i < 3; i++)
      on[i] = false;
  }
  else if(cnt > 3)
  {
    led(0, 3, 0);
    delay(300);
    for(int i = 0; i < 3; i++)
      on[i] = !on[i];

    if(cnt == 10)
      resetLed();
  }
  else
  {
    for(int i = 0; i < 3; i++)
      on[i] = !on[i];
    led(0, 3, 500);
  }
  cnt++;
}
