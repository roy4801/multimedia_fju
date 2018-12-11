int [] backgroundColor = {255, 255, 255};
int [] nowFillColor = {0, 0, 0};

void drawText(String s, int x, int y, int r, int g, int b)
{
  fill(r, g, b);
  text(s, x, y);
}

void functionArea()
{
  strokeWeight(1);
  // red 0
  fill(255, 0, 0);
  rect(0, 0, 100, 100);
  // green 1
  fill(0, 255, 0);
  rect(0, 100, 100, 100); // 100 200
  // blue 2
  fill(0, 0, 255);
  rect(0, 200, 100, 100);// 100 300
  // yellow 3
  fill(255, 255, 0);
  rect(0, 300, 100, 100); // 100, 400
  // cyan 4
  fill(0, 255, 255);
  rect(0, 400, 100, 100); // 100, 500
  // purple 5
  fill(255, 0, 255);
  rect(0, 500, 100, 100);
  
  //-----------------------------------
  // Draw Right function area
  textSize(16);
  // Clear button 750-800 0-50
  fill(255, 255, 255);
  rect(750, 0, 50, 50);
  
  drawText("Clear", 755, 30, 255, 0, 0);
  //
  // Draw button
  fill(255, 255, 255);
  rect(750, 50, 50, 50); // y: 50-100
  
  drawText("Eraser", 753, 80, 255, 0, 0);
  //
  // Draw size small x:750-800 y:150-200
  fill(255, 255, 255);
  rect(750, 150, 50, 50);
  
  fill(0, 0, 0);
  ellipse(775, 175, 8, 8);
  //
  // Draw size big x:750-800 y:200-250
  fill(255, 255, 255);
  rect(750, 200, 50, 50);
  
  fill(0, 0, 0);
  ellipse(775, 225, 16, 16);
  //
  // Draw save button
  fill(255, 255, 255);
  rect(750, 550, 50, 50);
  
  drawText("Save", 760, 580, 255, 0, 0);
  
  // Reset stroke weight
  stroke(0, 0, 0);
  strokeWeight(8);
}

void setup() {
    size(800, 600);
    smooth();
    background(backgroundColor[0], backgroundColor[1], backgroundColor[2]);
    functionArea();
    noFill();
    ellipse(400, 600, 200, 200);
    strokeWeight(8);

}

int nowColor;
boolean picked = false;


void draw() {
      // Judge choose color
      if(mousePressed && mouseButton == LEFT)
      {
        // Red
        if(mouseX <= 100 && mouseY <= 100)
        {
          nowColor = 0;
          picked = true;
        }
        // Green
        else if(mouseX >= 0 && mouseX <= 100 && mouseY >= 100 && mouseY <= 200)
        {
          nowColor = 1;
          picked = true;
        }
        // Blue
        else if(mouseX >= 0 && mouseX <= 100 && mouseY >= 200 && mouseY <= 300)
        {
          nowColor = 2;
          picked = true;
        }
        // Yellow
        else if(mouseX >= 0 && mouseX <= 100 && mouseY >= 300 && mouseY <= 400)
        {
          nowColor = 3;
          picked = true;
        }
        // Cyan
        else if(mouseX >= 0 && mouseX <= 100 && mouseY >= 400 && mouseY <= 500)
        {
          nowColor = 4;
          picked = true;
        }
        // Purple
        else if(mouseX >= 0 && mouseX <= 100 && mouseY >= 500 && mouseY <= 600)
        {
          nowColor = 5;
          picked = true;
        }
        /// Right function area
        else if(mouseX >= 750)
        {
          // Clear
          if(mouseY <= 50)
          {
            background(backgroundColor[0], backgroundColor[1], backgroundColor[2]);
            stroke(0, 0, 0);
            functionArea();
          }
          // Eraser
          else if(mouseY > 50 && mouseY <= 100)
          {
            //
            //stroke(0, 0, 0);
            nowColor = -1;
            picked = true;
          }
          // size small
          else if(mouseY > 150 && mouseY <= 200)
          {
              strokeWeight(8);
          }
          // size large
          else if(mouseY > 200 && mouseY <= 250)
          {
              strokeWeight(16);
          }
          else if(mouseY > 550 && mouseY <= 600)
          {
              //background(backgroundColor[0], backgroundColor[1], backgroundColor[2]);
              save("pic.jpg");
              functionArea();
          }
        }
        // drawing
        else if(picked)
        {
          switch(nowColor)
          {
            // Eraser
            case -1:
              stroke(backgroundColor[0], backgroundColor[1], backgroundColor[2]);
            break;
            //////////////
            // Color
            case 0:
              stroke(255, 0, 0);
            break;
            
            case 1:
              stroke(0, 255, 0);
            break;
            
            case 2:
              stroke(0, 0, 255);
            break;
            
            case 3:
              stroke(255, 255, 0);
            break;
            
            case 4:
              stroke(0, 255, 255);
            break;
            
            case 5:
              stroke(255, 0, 255);
            break;
          }
          line(mouseX, mouseY, pmouseX, pmouseY);
        }
    }
}