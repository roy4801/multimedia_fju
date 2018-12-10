import processing.serial.*;
 
Serial port;    // The serial port
int n;
 
void setup()
{
    size(400,200);
    // List all the available serial ports:
    // printArray(Serial.list());

    port = new Serial(this, Serial.list()[0], 9600);
    port.clear();
}
 
void draw()
{
    background(0);
    text("received = " + n, 10,50);
}
 
void serialEvent(Serial p)
{
    n = p.read();
}