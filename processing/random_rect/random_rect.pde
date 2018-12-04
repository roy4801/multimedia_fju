size(800, 600);
background(255, 255, 255);
noStroke();
randomSeed(0);

for(int i = 0; i < 800; i++)
{
  for(int j = 0; j < 600; j++)
  {
    fill((int)random(1, 255), (int)random(1, 255), (int)random(1, 255), (int)random(1, 255));
    rect((int)random(800), (int)random(600), (int)random(300), (int)random(300));
  }
}
