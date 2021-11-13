int colorArrayCounter;
color[] colorArray = {
  color(25,165,190),
  color(95,170,200),
  color(120,190,210),
  color(170,210,230),
  color(205,225,245),
  color(220,240,250),
};

void setup() {
  fullScreen();
  //size(900,900);
  //surface.setLocation(987,70);
  //noLoop();
  noStroke();
  frameRate(10);
  mouseX = 10;
}

void draw() {
  background(#282828);
  translate(width/2, height/2);
  
  float rStep = 30;
  float rMax = 1920;
  float rMin  = mouseX;

  for (float r=rMin; r<rMax; r+=rStep) {
    float c = 2*PI*r; //circumference
    float cSegment = map(r,0,rMax,rStep*3/4,rStep/2);
    float aSegment = floor(c/cSegment); //angle Segment
    float ellipseSize = map(r,0,rMax,rStep*3/4-1,rStep/4);
    
    for (float a=0; a<360; a+=360/aSegment) {
      colorArrayCounter++;
      if(colorArrayCounter>5) colorArrayCounter=0;
      fill(colorArray[colorArrayCounter]);
      
      pushMatrix();
      rotate(radians(a));
      ellipse(r,0,ellipseSize,ellipseSize);
      popMatrix();
    }
  }
}

void keyPressed() {
  if (key==' ') {
    background(#282828);
    redraw();
  }
}
