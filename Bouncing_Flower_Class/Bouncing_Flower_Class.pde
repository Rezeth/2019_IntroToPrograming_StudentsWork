Flower f1;
Flower f2;
float speedX;
float speedY;

void setup() {
  size(800,600);

  f1 = new Flower(30,6);
  speedX=3;
  speedY=3;
  f2 = new Flower(50,speedX,speedY);
  
}

void draw(){
   background(#43AF76);


if(f1.overlaps(f2)){
background (0,0,255);
}

f2.display();
f1.display();

}
