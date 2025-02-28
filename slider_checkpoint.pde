color black = #000000;
color white = #FFFFFF;

float sliderY;

void setup() {
  size(800,600);
  strokeWeight(5);
  stroke(white);
  fill(white);
  sliderY = 400;
}

void draw() {
  background(0);
  
  line(400,100,400,500);
  circle(400, sliderY, 50);
}

void mouseReleased() {
  if (mouseX > 
