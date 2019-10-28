class Flower {

  float r;//radius of flower
  float petalX; 
  float petalY;
  float x; //flower center x
  float y; //flower center y
  float petal=0;//number of petals
  float xSpeed;//flower moving speed x
  float ySpeed;//flower moving speed y

  Flower(
    float tempR, /*define size of flower*/ 
    float tempSpeedX, /*define speed on x axis*/ 
    float tempSpeedY /*define speed on y axis*/) {
    x = 0;
    y = 0;
    r = tempR;
    petal = 8;
    xSpeed=tempSpeedX;
    ySpeed=tempSpeedY;
  }

  Flower(
    float tempR, /*define size of flower*/ 
    float tempP /*define number of petals*/
    ) {
    x = 0;
    y = 0;
    r = tempR;
    petal = tempP;
    xSpeed=10;
    ySpeed=5;
  }

  void display() {
    fill(255, 255, 90);
    for (float i=0; i<PI*2; i+=2*PI/petal) { //flower petals surrounding flower
      petalX=r*cos(i);
      petalY=r*sin(i);
      ellipse(x+petalX, y+petalY, r, r);
    }
    //flower center
    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);

  //bounce functionality
    x = x+xSpeed; 
    if (x>width || x<0) {
      xSpeed = xSpeed* -1;
    }
    y = y+ySpeed;
    if (y>height || y<0) {
      ySpeed = ySpeed* -1;
    }
}

  boolean overlaps(Flower OtherFlower) {
    if (dist (x, y, OtherFlower.x, OtherFlower.y)<(2.2*r+OtherFlower.r))
    {
      return true;
    } else
    {  
      return false;
    }
  }
  
}
