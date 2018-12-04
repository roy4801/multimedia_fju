Ring[] rings; // Declare the array
int numRings = 50;
int currentRing = 0;

void setup() {
  size(600, 600);
  smooth();
  randomSeed(0);
  
  rings = new Ring[numRings]; // Create the array
  for (int i = 0; i < numRings; i++) {
    rings[i] = new Ring(); // Create each object
  }
}

void draw() {
  background(0);
  
  //-------------------------------------
  // Update
  for (int i = 0; i < numRings; i++) {
      rings[i].grow();
  }
  // Judge touch
  for(int i = 0; i < numRings; i++)
  {
      if(rings[i].on)
      {
        for(int j = i+1; j < numRings; j++)
        {
            if(rings[j].on)
            {
              //stroke(255);
              //line(rings[i].x, rings[i].y, rings[j].x, rings[j].y);
              float dis = (rings[i].x - rings[j].x) * (rings[i].x - rings[j].x) + (rings[i].y - rings[j].y) * (rings[i].y - rings[j].y);
              float dia = rings[i].diameter / 2.0 + rings[j].diameter / 2.0;
              float h_dia_j_2 = pow(rings[j].diameter / 2.0f, 2.0f);
              
              dia = pow(dia, 2.f);
              
                if(dia > dis)
                {
                  rings[i].on = false;
                }
            }
        }
      }
  }
  
  // Draw
  for(int i = 0; i < numRings; i++)
      rings[i].display();
}

// Click to create a new Ring
void mousePressed() {
  rings[currentRing].start(mouseX, mouseY);
  currentRing++;
  currentRing %= numRings;
}

class Ring {
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the ring
  boolean on = false; // Turns the display on and off
  int [] rgb;

  Ring()
  {
    rgb = new int [3];
  }
  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    on = true;
    rgb[0] = (int)random(255);
    rgb[1] = (int)random(255);
    rgb[2] = (int)random(255);
    diameter = 1;
  }

  void grow() {
    if (on == true) {
      diameter += 0.5;
      if (diameter > 400) {
        on = false;
      }
    }
  }

  void display() {
    if (on) {
      noFill();
      stroke(rgb[0], rgb[1], rgb[2]);
      strokeWeight(4);
      //stroke(255,0, 0);
      ellipse(x, y, diameter, diameter);
    }
  }
}
