
#define LED_NUM 5
int pin[] = {4, 5, 6, 7, 8};
#define SPEAKER 12
#define ROLL A0

//const int speed = 300;

// 700 ~ 500 light
// 300

// Init
void setup() {
  Serial.begin(9600);

  for(int i = 0; i < LED_NUM; i++)
  {
    pinMode(pin[i], OUTPUT);
  }
}
bool on;
bool prev;
//bool ledState[LED_NUM];
int nowLed = 0;

void ledOn(int n)
{
  digitalWrite(pin[n], HIGH);
}
void ledOff(int n)
{
  digitalWrite(pin[n], LOW);
}
void play(int t, int s, int e)
{
  tone(SPEAKER, t);
  delay(s);
  noTone(SPEAKER);
  delay(e);
}

void loop() {
  int sensorValue = analogRead(A2);
  int roll = map(analogRead(ROLL), 0, 1023, 300, 100);

  if(sensorValue >= 500)
  {
    Serial.println("Light");
    on = false;
  }
  else if(sensorValue <= 300)
  {
    Serial.println("Dark");
    on = true;
  }

  ledOn(nowLed);
  if(!prev && on)
  {
    if(nowLed == 2)
    {
      Serial.println("Win");
      // ccccGAcAc
      play(262, 100, 100); // c
      play(262, 100, 100); // c
      play(262, 100, 100); // c
      play(262, 200, 200); // c
      play(196, 200, 200); // G 
      play(220, 200, 200); // A
      play(262, 200, 200); // c
      play(220, 100, 100); // A
      play(262, 200, 200); // c
      for(int i = 0; i < 10; i++)
      {
        digitalWrite(pin[2], i % 2 != 0 ? HIGH : LOW);
        delay(100);
      }
    }
    delay(1000);
  }
  else
  {
    delay(roll);
  }
  ledOff(nowLed);

  prev = on;
  delay(1);
  nowLed++;
  if(nowLed >= LED_NUM)
      nowLed -= LED_NUM;
}
