Ball[] ball;  //set ball as object of Ball 
Block[] block; //set block as object of Block 
int balloon_quantity = 5, block_quantity = 5;
float sumArea = 0;   //sumation of all area 
boolean deleteCheck; //boolean for check first clicked
void setup(){
        background(255);
        size(800, 495);
        
        ball = new Ball[balloon_quantity];   //create ball
        block = new Block[block_quantity];   //create block 
        for(int i = 0; i < balloon_quantity; i++){
            ball[i] = new Ball();        //random each ball 
            sumArea += ball[i].getArea(); //Adition area with new circle 
        }
        for(int j = 0; j < block_quantity; j++){
            block[j] = new Block();        //random each block 
            sumArea += block[j].getArea(); //Adition area with new block
        }  
        println(sumArea,"Area"); //display Sumation of area
}


void draw(){
        background(255); 
        for(Ball each_balloon : ball){ //for each in ball[]
          each_balloon.draw();  //draw new balloon
        }
        for(Block each_block : block){ //for each in ball[] 
          each_block.draw();  //draw new block
        }
}

void mouseClicked(){
      deleteCheck = false; //set deleteCheck to default 
      for(int i = block.length - 1; i >= 0; i--){ //checking all obj in array of block 
        if  ((mouseX > block[i].position_x) && (mouseX < block[i].position_x + block[i].size)   
              && (mouseY > block[i].position_y) && (mouseY < block[i].position_y + block[i].size)){
           //if click in some block 
          println(sumArea-block[i].getArea(),"=",sumArea,"-",block[i].getArea());
          sumArea -= block[i].getArea();  // substraction sumation of area  
          if   (i < (block.length - 1)){   //if is not last object 
              arraycopy(block, i+1, block, i, block.length-(i+1));  //move i object to most right array 
              block =(Block[]) shorten(block);       //remove most right object
          }
          else{      //if is last object
              block = (Block[]) shorten(block); //remove most right object 
          }
          deleteCheck = true;
          break;  //break if removed 
        }
      }
      
      if (deleteCheck == false){  //remove if block didn't remove 
        for(int j = ball.length - 1; j >= 0; j--){  //check all ball 
          float d = dist(mouseX, mouseY, ball[j].position_x, ball[j].position_y); 
          //distance between mouse and center of each ball 
          if (d < (ball[j].size / 2)){ //if distance  not over radius  means click in ball 
              println(sumArea-ball[j].getArea(),"=",sumArea,"-",ball[j].getArea());
              sumArea -= ball[j].getArea();
              if (j < (ball.length - 1)){ //check if it's not last object 
                  arraycopy(ball, j+1, ball, j, ball.length-(j+1));  //move j object to  most right array 
                  ball =(Ball[]) shorten(ball);  //remove last object 
              }
              else{  //if it's last object 
              ball =(Ball[]) shorten(ball);  //remove last object 
              }
              break;
          }
        }
     }
}

class Ball{
  
  float position_x,  position_y, size, red, green, blue; //set x y size and color as attribute 

  // Constructor if no input random it 
  Ball(){
    red = random(0, 255);  //random red color
    green = random(0, 255); //random green color 
    blue = random(0, 255);  //random blue color 
    this.position_x = random(0, width);  //random position  of ball 
    this.position_y = random(0, height);   
    this.size = random(50, 150);    //random size 
  }
   
  Ball(float pos_x, float pos_y){
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = random(50, 150);
  }
  
  Ball(float pos_x, float pos_y, int size_ball){
    red = random(0,255);
    green = random(0,255);
    blue = random(0,255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = size_ball;
  }
  
  //Method draw ball each x,y,z size and color 
  void draw(){
    fill(red, green, blue);
    ellipse(position_x, position_y, size, size);
  }
  
  float getArea() {
    float area = (size/2)*(size/2)*PI;  //calculate area of circle is pi*r^2
    return area;  //return area of circle 
  }
}

class Block{
  
  float position_x,  position_y, size, red, green, blue; //set x y size and color as attribute
  
  Block(){  //if no input random it 
    red = random(0, 255);  //random red color 
    green = random(0, 255); //random green color 
    blue = random(0, 255);  //random blue color 
    this.position_x = random(0, width);
    this.position_y = random(0, height);
    this.size = random(0, 200);
    
  }
  
  Block(float pos_x, float pos_y, int size_block){
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = size_block;
  }
  
  Block(float pos_x, float pos_y){
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = random(50, 150);
  }
  
  
  void draw(){ //draw block from x,y,size and set color 
    fill(red, green, blue);
    rect(position_x, position_y, size, size);
  }
  
  float getArea() {
    float area = size*size; //calculate area of block is side*side
    return area;  //return area of block 
  } 
  
}
