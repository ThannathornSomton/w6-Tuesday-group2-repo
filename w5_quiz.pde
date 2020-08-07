Ball balloon_1;

void setup(){
  background(255);
  size(800, 495);
  balloon_1 = new Ball();
}

void draw(){
  background(255);
  balloon_1.draw(); 
}

//class name Ball
class Ball{
  
  float position_x,  position_y, size;

// Constructor
Ball(){
  position_x = 400;
  position_y = 400;
  size = 50;
}

//Method
void draw(){
  fill(0);
  ellipse(position_x, position_y, size, size);
}

}
