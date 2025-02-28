color black = #000000;
color darkGrey = #464646;
color medGrey = #7E7D7D;
color lightGrey = #B4B4B4;
color white = #FAFAFA;

int toggle;

void setup() {
  size (600,600);
  strokeWeight (5);
  textSize (30);
  
  toggle = 1;
  
}

void draw() {
  background(lightGrey);
 
  
  fill(black);
  stroke(medGrey);
  rect(200,250,200,100);
  
  if (toggle > 0) {
    guideline();
  }
}

void mouseReleased() {
  if (mouseX > 200 && mouseX < 400 && mouseY > 250 && mouseY < 350) {
    toggle = toggle * -1;
  }
}

void guideline() {
  fill(white);
  stroke(white);
  line(0, mouseY, width, mouseY);
  line(mouseX, 0, mouseX, height);
  
}
  
  
