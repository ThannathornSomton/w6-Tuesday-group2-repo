Ball[] ball;  //set ball as object of Ball 
Block[] block; //set block as object of Block 
int balloon_quantity = 5, block_quantity = 5;
double sumArea = 0;   //sumation of all area 
boolean deleteCheck; //boolean for check first clicked
void setup(){
        background(255);
        size(800, 495);
        colorMode(HSB);
        
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
        println("Sumation of all area is : ",(sumArea)); //display Sumation of area
}


void draw(){
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
          println("New sumation : ",sumArea-block[i].getArea(),"=",sumArea,"-",block[i].getArea());
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
              println("New Sumtaion : ",sumArea-ball[j].getArea(),"=",sumArea,"-",ball[j].getArea());
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

public class Ball{
  
  float position_x,  position_y, size, red, green, blue, Color; //set x y size and color as attribute 

  // Constructor if no input random it 
  Ball(){
    
    Color = random(0, 255);
    red = random(0, 255);  //random red color
    green = random(0, 255); //random green color 
    blue = random(0, 255);  //random blue color 
    this.position_x = random(0, width);  //random position  of ball 
    this.position_y = random(0, height);   
    this.size = random(50, 150);    //random size 
  }
   
  Ball(float pos_x, float pos_y){
    Color = random(0, 255);
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = random(50, 150);
  }
  
  public Ball(float pos_x, float pos_y, int size_ball){
    Color = random(0, 255);
    red = random(0,255);
    green = random(0,255);
    blue = random(0,255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = size_ball;
    
  }
  
  //Method draw ball each x,y,z size and color 
  void draw(){
    if(Color < 255){
      Color++;
    }
    else{
      Color = 0;
    }
    fill(Color, 150, 255);
    ellipse(position_x, position_y, size, size);
  }
  
  float getArea() {
    float area = (size/2)*(size/2)*PI;  //calculate area of circle is pi*r^2
    return area;  //return area of circle 
  }
}

class Block{
  
  float position_x,  position_y, size, red, green, blue, Color; //set x y size and color as attribute
  Ball[] manyBall; 
  
  Block(){  //if no input random it 
    
    Color = random(0, 255);
    red = random(0, 255);  //random red color 
    green = random(0, 255); //random green color 
    blue = random(0, 255);  //random blue color 
    this.position_x = random(0, width);
    this.position_y = random(0, height);
    this.size = random(50, 200);
   
    int i = int(random(1,3));
     println(i);
    manyBall = new  Ball[i]; 
    for (int k =i-1 ; k>=0 ; k--){
      print("hello");
      manyBall[k] = new Ball(random(position_x,position_x+size), random(position_y, position_y+size) ,(int( random(size*2))));
      if ((manyBall[k].position_x-manyBall[k].size/2 < this.position_x) || (manyBall[k].position_x+manyBall[k].size/2 > this.position_x+this.size)) {
        k++;
      }
      else if ((manyBall[k].position_y-(manyBall[k].size)/2 < this.position_y) || (manyBall[k].position_y+(manyBall[k].size)/2 > this.position_y+this.size)) {
        k++;
      }
      
    }
    
     
  }
  
  Block(float pos_x, float pos_y, int size_block){
    Color = random(0, 255);
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = size_block;
  }
  
  Block(float pos_x, float pos_y){
    Color = random(0, 255);
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = random(50, 150);
  }
  
  
  void draw(){ //draw block from x,y,size and set color 
    if(Color < 255){
      Color++;
    }
    else{
      Color = 0;
    }
    fill(Color, 150, 255);
    rect(position_x, position_y, size, size);
    for (Ball eachBall : manyBall ) {
        eachBall.draw();
    }
    
  }
  
  float getArea() {
    float area = size*size; //calculate area of block is side*side
    return area;  //return area of block 
  } 
  
}
