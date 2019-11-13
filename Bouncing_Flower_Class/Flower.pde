//Trail functionality taken from processing turtorials

class Flower {
  float r;//radius of flower
  float petalX; 
  float petalY;
  float x=width/2; //flower center x
  float y=height/2; //flower center y
  float petal=0;//number of petals
  float xSpeed;//flower moving speed x
  float ySpeed;//flower moving speed y
  
  //variables for trails following non mouse flowers
  int num = 50;//max length of trail
  float[] trailX = new float[num];
  float[] trailY = new float[num];
  
  //variables for trails following mouse flower
  int mouseFlowerNum = 50;//legnth of trail that follows mouse
int[] mouseFlowerX = new int[mouseFlowerNum];
int[] mouseFlowerY = new int[mouseFlowerNum];
int indexPosition = 0;
  
  Flower(
    float tempR, /*define size of flower*/ 
    float tempSpeedX, /*define speed on x axis*/ 
    float tempSpeedY /*define speed on y axis*/) {
    r = tempR;
    petal = 8;
    xSpeed=tempSpeedX;
    ySpeed=tempSpeedY;
  }

  Flower(
    float tempR, /*define size of flower*/ 
    float tempP /*define number of petals*/
    ) {
    r = tempR;
    petal = tempP;
    xSpeed=10;
    ySpeed=5;
  }

  Flower( //Flower that follows mouse
    ) {
      r = 30;
    petal = 8;
  }

  void display() {
//trail contruction
    for (int i = num-1; i > 0; i--) {
      trailX[i] = trailX[i-1];
      trailY[i] = trailY[i-1];
    }
      // Add the new values to the beginning of the array
      trailX[0] = x;
      trailY[0] = y;
      // Draw the circles
      for (int i = 0; i < num; i++) {
        noStroke(); //WILL make all objects with noStroke if not defined in other displays
        fill(255, 50);
        ellipse(trailX[i], trailY[i], i/2.0, i/2.0);
      }    

//flower construction
      stroke(1);
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
      if (x>width-r || x<r) {
        xSpeed = xSpeed* -1;
      }
      y = y+ySpeed;
      if (y>height-r || y<r) {
        ySpeed = ySpeed* -1;
      }

  }
  void displayMouseFlower() { //special flower that doesn't bounce but instead follows mouse
    
  noStroke();
  fill(255, 102);
  mouseFlowerX[indexPosition] = mouseX;
  mouseFlowerY[indexPosition] = mouseY;
  // Cycle between 0 and the number of elements
  indexPosition = (indexPosition + 1) % mouseFlowerNum;
  for (int i = 0; i < num; i++) {
    // Set the array position to read
    int pos = (indexPosition + i) % mouseFlowerNum;
    float radius = (mouseFlowerNum-i) / 2.0;
    ellipse(mouseFlowerX[pos], mouseFlowerY[pos], radius, radius);
  }
    
    stroke(1);
    fill(255, 255, 90);
    for (float i=0; i<PI*2; i+=2*PI/petal) { //flower petals surrounding flower
      petalX=r*cos(i);
      petalY=r*sin(i);
      ellipse(mouseX+petalX, mouseY+petalY, r, r);
    }
    //flower center
    fill(200, 0, 0);
    ellipse(mouseX, mouseY, r*1.2, r*1.2);
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
