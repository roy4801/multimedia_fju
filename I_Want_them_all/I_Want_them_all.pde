/*
 * I want them all.
 * Author: roy4801
 * 406262515
 */
size(600, 320);
background(255, 255, 255);

// Left Body
stroke(0, 0, 0);
fill(0, 0, 255);
rect(150, 150, 150, 130, 7);

// Left Head
fill(255, 255, 255);
rect(220, 100, 70, 100, 7);

// Left Face
fill(224, 209, 150);
rect(240, 100, 45, 70, 7);

// Left Hat
int l1 = 180, l2 = 320;
fill(244, 65, 65);
triangle(245, 70, l1, 100, l2, 100);

// Right Body
fill(174, 174, 174); // grey
rect(310, 150, 130, 130, 7);

// Right Face
fill(224, 209, 150);
rect(330, 100, 55, 50, 7);

// Right Hat
fill(0, 0, 0);
rect(330, 75, 55, 35, 7);

save("I want them all");
