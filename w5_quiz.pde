Ball[] balloon;
int start_point = 100, distance = 100, Balloon_quantity = 5;

void setup(){
  background(255);
  size(800, 495);
  balloon = new Ball[5];
  for(int i = 0; i < Balloon_quantity; i++){
    balloon[i] = new Ball(start_point + distance, 400);
    balloon[i].draw();
    start_point += distance;
  }
}

//class name Ball
class Ball{
  
  float position_x,  position_y, size, red, green, blue;

// Constructor
Ball(){
  red = random(0,255);
  green = random(0,255);
  blue = random(0,255);
  position_x = 50;
  position_y = 400;
  size = 50;
}

Ball(float pos_x, float pos_y){
  red = random(0,255);
  green = random(0,255);
  blue = random(0,255);
  position_x = pos_x;
  position_y = pos_y;
  size = 50;
}

Ball(float pos_x, float pos_y, int size_ball){
  red = random(0,255);
  green = random(0,255);
  blue = random(0,255);
  position_x = pos_x;
  position_y = pos_y;
  size = size_ball;
}

//Method
void draw(){
  fill(red, green, blue);
  ellipse(position_x, position_y, size, size);
}

}
