class Paddle{
  float x;
  float y = height/2;
  float w = 10;
  float h = 100;
  String name;
  
  float ychange = 0;
  
  // Constructor
  Paddle(String s){
    name = s;
    x = name.equals("left") ? w : width - w;
  }
  
  void update(){
    y += ychange;
    y = constrain(y,h/2,height - h/2);  // Processing
  }
  
  void move(float steps){
    ychange = steps;
  }
  
  void show(){
    fill(255);
    
    /*
     * rectMode(CENTER) interprets the first two parameters of rect() 
     * as the shape's center point, while the third and fourth parameters
     * are its width and height.
     */
    rectMode(CENTER);  // Processing
    rect(x,y,w,h);  // Processing
  }
}