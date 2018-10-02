import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class horizontal extends PApplet {


PImage cat, mouse;
boolean mouseLive = false;
boolean endGame = false;

int catPosX, catPosY, catSize;
int totalScore = 0;
int dir = 0;
final int numOfMouse = 50;

CharMouse []m = new CharMouse[numOfMouse];

class CharMouse
{
    int x, y;
    boolean live;

    CharMouse()
    {
        x = y = 0;
        live = false;
    }
}
// 1 => up
// 2 => down
// 3 => left
// 4 => right

int offsetX = 10, offsetY = 10;

final int WIDTH = 800;
final int HEIGHT = 600;

public void setup()
{
    

    cat = loadImage("nyan.png");
    mouse = loadImage("mouse.png");
    frameRate(20);
    randomSeed(0);

    catSize = 64;
}

public void spawnMouse()
{
    for(int i = 0; i < numOfMouse; i++)
    {
        m[i] = new CharMouse();
        m[i].x = (int)random(WIDTH);
        m[i].y = (int)random(HEIGHT);
        m[i].live = true;
    }
    mouseLive = true;
}

public void draw()
{
    background(255);

    // Spawn the mouse
    if(!mouseLive)
        spawnMouse();

    // print(catPosX + " " + catPosY + " // " + mousePosX + " " + mousePosY + "\n");
    print(mouseLive ? "T" : "F" + "\n");
    // Processing input
    if (keyPressed == true)
    {
        if(key == CODED)
        {
            switch(keyCode)
            {
                case UP:
                    catPosY -= offsetY;
                    dir = 1;
                break;

                case DOWN:
                    catPosY += offsetY;
                    dir = 2;
                break;

                case LEFT:
                    catPosX -= offsetX;
                    dir = 3;
                break;

                case RIGHT:
                    catPosX += offsetX;
                    dir = 4;
                break;
            }
        }
    }

    //----------------------------------------------------------
    // Game Logic
    for(int i = 0; i < numOfMouse; i++)
    {
        if(m[i].live)
        {
            int catCX = catPosX + catSize / 2, catCY = catPosY + catSize / 2;
            int mouseCX = m[i].x + 64 / 2, mouseCY = m[i].y + 64 / 2;

            println("Cat: " + catCX + " " + catCY + "Mouse: " + mouseCX + " " + mouseCY + "\n");
            println("Dis: " + sqrt( pow((catCX - mouseCX), 2.0f) + pow((catCY - mouseCY), 2.0f)));

            if(sqrt( pow((catCX - mouseCX), 2.0f) + pow((catCY - mouseCY), 2.0f)) <= 16 + catSize/2)
            {
                m[i].live = false;
                totalScore++;
                catSize += 4;
            }
        }
    }

    // End Game
    if(totalScore == numOfMouse)
        endGame = true;


    //----------------------------------------------------------
    // Drawing
    for(int i = 0; i < numOfMouse; i++)
        if(m[i].live)
            image(mouse, m[i].x, m[i].y, 64, 64);

    if(catPosX + cat.width >= WIDTH)
    {
        image(cat, catPosX - WIDTH, catPosY, catSize, catSize);
    }
    else if(catPosX < 0)
    {
        image(cat, catPosX + WIDTH, catPosY, catSize, catSize);
    }
    if(catPosY + cat.height >= HEIGHT)
    {
        image(cat, catPosX, catPosY - HEIGHT, catSize, catSize);
    }
    else if(catPosY < 0)
    {
        image(cat, catPosX, catPosY + HEIGHT, catSize, catSize);
    }
    image(cat, catPosX, catPosY, catSize, catSize);

    if(catPosX >= WIDTH || catPosY >= HEIGHT)
    {
        catPosX %= WIDTH;
        catPosY %= HEIGHT;
    }
    if(catPosY <= -catSize)
        catPosY = HEIGHT + catPosY;
    if(catPosX <= -catSize)
        catPosX = WIDTH + catPosX;

    if(endGame)
    {
        textSize(64);
        fill(0, 0, 0);
        text("Victory", WIDTH / 2 - 100, HEIGHT / 2 - 20);
    }

    // print score board
    textSize(16);
    fill(0, 0, 0);
    text("Score: " + str(totalScore), 0, 20);
}

/*
// Move the image horizontally
void horizontal()
{
    background(255);
    image(img, i, 0);

    if(i <= 0 || i >= WIDTH)
        offsetX *= -1;    
    i += offsetX;
}

int offset = 10;
void zoomIn()
{
    background(255);
    image(img, 50, 50, i, i);

    i += offset;
    if (i>400 || i <= 0)
        offset *= -1;
}

int fade = 255;
void fadeOut()
{
    tint(fade); // Tint gray
    image(img, 0, 0);

    fade = fade-20;

    if (fade<0)
        fade=0;
}
*/
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "horizontal" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
