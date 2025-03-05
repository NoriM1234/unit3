color black = #000000;
color red = #FF0900;
color orange = #FF8D00;
color yellow = #FFEA00;
color green = #27CB1D;
color blue = #0337FF;
color white = #FFFFFF;
color lightGrey = #A5A5A5;
color darkGrey = #646464;

color selectedColor;

float thickness;
float sliderY;


void setup() {
  size(800,600);
  background(255);
  sliderY = 215;
  thickness = 0;
}

void draw() {
  thickness = map(sliderY,50,400,0,50);
  strokeWeight(5);
  stroke(lightGrey);
  fill(lightGrey);
  rect(0,0,200,600);
  
  strokeWeight(2);
  stroke(black);
  fill(darkGrey);
  rect(75,10,50,30);
  rect(10,10,50,30);
  rect(140,10,50,30);
 
  
  tactile(50,75,20);
  fill(red);
  circle(50,75,50);
  
  
  tactile(50,135,20);
  fill(orange);
  circle(50,135,50);
  
  tactile(50,195,20);
  fill(yellow);
  circle(50,195,50);
  
  tactile(50,255,20);
  fill(green);
  circle(50,255,50);
  
  tactile(50,315,20);
  fill(blue);
  circle(50,315,50);
  
  tactile(50,375,20);
  fill(white);
  circle(50,375,50);
  
  tactile(50,435,20);
  fill(black);
  circle(50,435,50);
  
  stroke(black);
  strokeWeight(5);
  fill(white);
  line(150,65,150,385);
  circle(150,sliderY,25);
}

void tactile (int x, int y, int r) {
  if (dist(x,y,mouseX,mouseY) < r) {
  stroke(white);
  } else {
  stroke(black);
  }
}
  
void mouseDragged() {
  strokeWeight(thickness);
  stroke(selectedColor);
  line(pmouseX,pmouseY,mouseX,mouseY);
  controlSlider();
}

void mouseReleased() {
  controlSlider();
  
  if ( dist(50,75,mouseX,mouseY) < 50) {
    selectedColor = red;
  }
  
  if ( dist(50,135,mouseX,mouseY) < 50) {
    selectedColor = orange;
  }
  
  if ( dist(50,195,mouseX,mouseY) < 50) {
    selectedColor = yellow;
  }
  
  if ( dist(50,255,mouseX,mouseY) < 50) {
    selectedColor = green;
  }
  
  if ( dist(50,315,mouseX,mouseY) < 50) {
    selectedColor = blue;
  }
  
  if ( dist(50,375,mouseX,mouseY) < 50) {
    selectedColor = white;
  }
  
  if ( dist(50,435,mouseX,mouseY) < 50) {
    selectedColor = black;
  }
}

void controlSlider() {
  if(mouseY > 65 && mouseY < 385 && mouseX > 135 && mouseX < 165) {
    sliderY = mouseY;
  }
}
