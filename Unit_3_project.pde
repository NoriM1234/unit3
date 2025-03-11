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

PImage smiley;
boolean smileyOn;

void setup() {
  size(800, 600);
  background(255);
  sliderY = 215;
  thickness = 0;
  smiley = loadImage("Smiley.png");
  smileyOn = true;
}

void draw() {
  thickness = map(sliderY, 50, 400, 0, 50);
  strokeWeight(5);
  stroke(lightGrey);
  fill(lightGrey);
  rect(0, 0, 200, 600);

  tactile(50, 480, 100, 100);
  if (smileyOn) {
    fill(lightGrey);
  } else {
    fill(white);
  }
  square(50, 480, 100);
  image(smiley, 55, 485, 90, 90);

  strokeWeight(2);
  stroke(black);
  fill(darkGrey);
  tactile(75, 10, 50, 30);
  rect(75, 10, 50, 30);
  fill(black);
  text("NEW", 89, 30);

  fill(darkGrey);
  tactile(10, 10, 50, 30);
  rect(10, 10, 50, 30);
  fill(black);
  text("SAVE", 23, 30);

  fill(darkGrey);
  tactile(140, 10, 50, 30);
  rect(140, 10, 50, 30);
  fill(black);
  text("LOAD", 151, 30);


  tactile(50, 75, 20);
  fill(red);
  circle(50, 75, 50);


  tactile(50, 135, 20);
  fill(orange);
  circle(50, 135, 50);

  tactile(50, 195, 20);
  fill(yellow);
  circle(50, 195, 50);

  tactile(50, 255, 20);
  fill(green);
  circle(50, 255, 50);

  tactile(50, 315, 20);
  fill(blue);
  circle(50, 315, 50);

  tactile(50, 375, 20);
  fill(white);
  circle(50, 375, 50);

  tactile(50, 435, 20);
  fill(black);
  circle(50, 435, 50);

  stroke(black);
  strokeWeight(5);
  fill(white);
  line(150, 65, 150, 385);
  circle(150, sliderY, 25);

  strokeWeight(5);
  stroke(black);
  fill(selectedColor);
  square(125, 410, 50);
  
}

void tactile (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(black);
  }
}

void tactile (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(white);
  } else {
    stroke(black);
  }
}

void mouseDragged() {
  if (smileyOn == false && mouseX > 200) {
    strokeWeight(thickness);
    stroke(selectedColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
    controlSlider();
  } else {
    strokeWeight (0);
  }
  if (smileyOn == true) {
    image(smiley, mouseX, mouseY, 100, 100);
  }
}

void mouseReleased() {
  controlSlider();
  if (mouseX > 50 && mouseX < 150 && mouseY > 480 && mouseY < 580) {
    smileyOn = !smileyOn;
  }

  if ( dist(50, 75, mouseX, mouseY) < 20) {
    selectedColor = red;
  }

  if ( dist(50, 135, mouseX, mouseY) < 20) {
    selectedColor = orange;
  }

  if ( dist(50, 195, mouseX, mouseY) < 20) {
    selectedColor = yellow;
  }

  if ( dist(50, 255, mouseX, mouseY) < 20) {
    selectedColor = green;
  }

  if ( dist(50, 315, mouseX, mouseY) < 20) {
    selectedColor = blue;
  }

  if ( dist(50, 375, mouseX, mouseY) < 20) {
    selectedColor = white;
  }

  if ( dist(50, 435, mouseX, mouseY) < 20) {
    selectedColor = black;
  }
  if (mouseX > 75 && mouseX < 125 && mouseY > 10 && mouseY < 40) {
    stroke(255);
    fill(255);
    rect(200, 0, 600, 600);
  }
  if (mouseX > 10 && mouseX < 60 && mouseY > 10 && mouseY < 40) {
    selectOutput("Choose a name for your new image file", "saveImage");
  }
  if (mouseX > 140 && mouseX < 190 && mouseY > 10 && mouseY < 40) {
    selectInput("Pick an image to load", "openImage");
  }
}

void saveImage(File f) {
  if (f != null) {
    PImage canvas = get(201, 1, width-201, height-1);
    canvas.save(f.getAbsolutePath());
  }
}

void openImage(File f) {
  if (f != null) {
    //KLUDGE
    int n = 0;
    while (n < 10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 0, 0);
    n = n + 1;
    }
  }
}

void controlSlider() {
  if (mouseY > 65 && mouseY < 385 && mouseX > 135 && mouseX < 165) {
    sliderY = mouseY;
  }
}
