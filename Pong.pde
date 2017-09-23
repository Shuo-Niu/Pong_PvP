//import processing.sound.*;

//SoundFile ding;

Puck puck;
Paddle left;
Paddle right;

int leftscore = 0;
int rightscore = 0;

void setup(){  // Processing
  size(600,400);
  //ding = new SoundFile(this,"ding.mp3");
  puck = new Puck();
  left = new Paddle("left");
  right = new Paddle("right");
}

void draw(){  // Processing
  background(0);
  
  puck.checkPaddle(left);
  puck.checkPaddle(right);
  
  left.update();
  right.update();
  left.show();
  right.show();
  
  puck.update();
  puck.edges();
  puck.show();
  
  fill(255);
  textSize(32);
  text(leftscore,32,40);
  text(rightscore,width-64,40);
}

void keyReleased(){  // Processing
  left.move(0);
  right.move(0);
}

void keyPressed(){  // Processing
  if(key == 'a'){
    left.move(-10);
  } else if(key == 'z'){
    left.move(10);
  }
  
  if(key == 'k'){
    right.move(-10);
  } else if(key == 'm'){
    right.move(10);
  }
}