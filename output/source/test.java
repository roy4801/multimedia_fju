import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class test extends PApplet {



SoundFile file;

Counter [] ctList;

Counter c;

public void setup()
{
    
    noStroke();
    
    frameRate(30);
    randomSeed(0);

    // file = new SoundFile(this, "bg1.mp3");
    // println("Channel= " + file.channels());
    // println("Duration= " + file.duration() + " seconds");
    // file.play();

    c = new Counter();
    c.setDuration(1000);
    c.start();
}

boolean timeCnt = true;

public void draw()
{
    if(timeCnt)
        println(millis());
    
    // Update
    c.update();


    // Draw
    if(timeCnt && c.isOver())
    {
        println("The counter is over");
        timeCnt = false;
    }


    // if(keyPressed && key == 'p')
    // {
    //     file.play();
    // }
}
class Counter
{
    boolean on, over;
    int dur;
    int start;

    Counter()
    {
        on = over = false;
        dur = start = -1;
    }
    public void setDuration(final int dur)
    {
        this.dur = dur;
    }
    public void start()
    {
        if(on)
        {
            println("Sound: Counter is already on!");
            return;
        }

        if(dur != -1)
        {
            on = true;
        }
        else
        {
            println("Sound: The duration or start is -1");    
        }
    }
    public void update()
    {
        if(on)
        {
            int now = millis();

            if(now - start >= dur)
                over = true;
        }
    }

    public boolean isOver()
    {
        return over;
    }
}
class Note
{
	int sMs; // Start time (ms)
	int dur; // Duration (ms)
}
  public void settings() {  size(800, 600);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
