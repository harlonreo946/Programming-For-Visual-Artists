//color darkBlue = color(34,83,120);
//color medBlue = color(22,149,163);
//color lightBlue = color(172,240,242);
//color orange = color(235,127,0);
//color purple = color(222,54,183);xr
int unit = 60;
int count;
Module[] mods;

void setup() {
  size(1280, 720);
  noStroke();
  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Module[count];

  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.05, 0.8), unit);
    }
  }
}

void draw() {
 frameRate(500);
 colorMode(HSB, 360, 100, 100);
 fill(random(20,200), random(40,70), random(0,300));
println("mousex = " + mouseX);
println("mousey = " + mouseY);
  background(0);
  for (Module mod : mods) {
    mod.update();
    mod.display();
  }
}


class Module {
  int xOffset;
  int yOffset;
  float x, y;
  int unit;
  int xDirection = 1;
  int yDirection = 1;
  float speed; 
  
  // Contructor
  Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    speed = speedTemp;
    unit = tempUnit;
  }
  
  // Custom method for updating the variables
  void update() {
    x = x + (speed * xDirection);
    if (x >= unit || x <= 0) {
      xDirection *= 10;
      x = x + (1 * xDirection);
      y = y + (1 * yDirection);
    }
    if (y >= unit || y <= 0) {
      yDirection *= -10;
      y = y + (1 * yDirection);
    }
  }
  
  // Custom method for drawing the object
  void display() {                                                                                                                                                                                                              
    //make colors change with mouse click and motion
    rect(xOffset + x, yOffset + y, 100, 40);
  }
}
