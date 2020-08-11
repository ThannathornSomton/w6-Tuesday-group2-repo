Ball[] balloon;
Block block = new Block();
int Balloon_quantity = 5;
float sumArea = 0; 

void setup(){
  background(255);
  size(800, 495);
  balloon = new Ball[5];
  for(int i = 0; i < Balloon_quantity; i++){
    balloon[i] = new Ball();
    balloon[i].draw();  //draw new balloon
    sumArea += balloon[i].getArea(); //Adition area with new circle 
  }
  println(sumArea,"Area"); //display Sumation of are 
}
 
//class name Ball
class Ball{
  
  float position_x,  position_y, size, red, green, blue;

// Constructor
    Ball(){
      red = random(0,255);  //random red color
      green = random(0,255); //random green color 
      blue = random(0,255);  //random blue color 
      position_x = random(0, width);  //random position 
      position_y = random(0, height);   
      size = random(50, 150);    //random size 
    }
    
    Ball(float pos_x, float pos_y){
      red = random(0,255);
      green = random(0,255);
      blue = random(0,255);
      position_x = pos_x;
      position_y = pos_y;
      size = random(50, 150);
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
    float getArea() {
        float area = (size/2)*(size/2)*3.14;  //calculate area of circle is pi*r^2
        return area;  //return area of circle 
    }
}

class Block{
  
  float position_x,  position_y, size, red, green, blue;
  
  Block(){
    red = random(0,255);
    green = random(0,255);
    blue = random(0,255);
    position_x = 50;
    position_y = 400;
    size = 50;
    
  }
  
  Block(float pos_x, float pos_y, int size_block){
    red = random(0,255);
    green = random(0,255);
    blue = random(0,255);
    position_x = pos_x;
    position_y = pos_y;
    size = size_block;
  }
  
  Block(float pos_x, float pos_y){
     red = random(0,255);
     green = random(0,255);
     blue = random(0,255);
     position_x = pos_x;
     position_y = pos_y;
     size = random(50, 150);
    }
  
  
  void draw(){
    fill(red, green, blue);
    rect(position_x, position_y, size, size);
  }
  
  float getArea() {
        float area = size*size; //calculate area of block is X*X
        return area;  //return area of block 
    } 
 
    
  
}
