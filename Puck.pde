class Puck{
  float x = width/2;
  float y = height/2;
  float r = 12;
  float xspeed;
  float yspeed;
  
  Puck(){
    reset();
  }
  
  void checkPaddle(Paddle p){
    if(y < p.y + p.h/2 && y > p.y - p.h/2){
      if(p.name.equals("right") && xspeed > 0 && x > p.x - p.w/2 - r || p.name.equals("left") && xspeed < 0 && x < p.x + p.w/2 + r){
        if(p.name.equals("left")){
          float diff = y - (p.y - p.h/2);
          float rad = radians(45);
          float angle = map(diff,0,p.h,-rad,rad);
          xspeed = 5 * cos(angle);
          yspeed = 5 * sin(angle);
        } else if(p.name.equals("right")){
          float diff = y - (p.y - p.h/2);
          float angle = map(diff,0,p.h,radians(225),radians(135));
          xspeed = 5 * cos(angle);
          yspeed = 5 * sin(angle);
        }
        
        //float diff = (y - p.y) / p.h;
        
        //yspeed = diff * 5;
        //xspeed *= -1;
      }
    }
  }
  
  void update(){
    x += xspeed;
    y += yspeed;
  }
  
  void reset(){
    x = width/2;
    y = height/2;
    
    float angle = random(-PI/4,PI/4);  // processing
    xspeed = 5 * cos(angle);  // processing
    yspeed = 5 * sin(angle);  // processing
  }
  
  void edges(){
    if(y < 0 + r || y > height - r){
      yspeed *= -1;
    }
    
    if(x < 0 - r){
      //ding.play();
      rightscore++;
      reset();
    }
    
    if(x > width + r){
      //ding.play();
      leftscore++;
      reset();
    }
  }
  
  void show(){
    fill(255);
    ellipse(x,y,2*r,2*r);  // Processing
  }
}