int buttonState1 = 0;
int buttonState2 = 0;

int switchPin1 = 7; // Switch connected to pin 4
int switchPin2 = 8;
void setup()
{
    pinMode(switchPin1, INPUT);
    pinMode(switchPin2, INPUT);// Set pin 0 as an input
    Serial.begin(9600); // Start serial communication at 9600 bps
}


#define DBG 0

#define BIT(x) (1<<x)
bool need_zero = false;
int prev;

void loop() {
    int i, j, k;

    buttonState1 = digitalRead(switchPin1);
    buttonState2 = digitalRead(switchPin2);

    // Serial.println(BIT(0));
    // Serial.println(BIT(1));
    int payload = 0;

        if (buttonState1 == HIGH)
        {
            payload |= BIT(0);
            need_zero = true;
        }
        else
        {
            payload &= ~BIT(0);
        }

        if (buttonState2 == HIGH)
        {
            payload |= BIT(1);
            need_zero = true;
        }
        else
        {
            payload &= ~BIT(1);
        }

    if(payload)
    {
    	if(prev != payload)
    	{
	    	#if DBG
	    	Serial.println(payload);
	    	#else
	    	Serial.write(payload);
	    	#endif
	    }
    }
    else
    {
    	if(need_zero)
    	{
    		#if DBG
    		Serial.println(0);
    		#else
    		Serial.write(0);
    		#endif
    		need_zero = false;
    	}
    }
    prev = payload;
}
