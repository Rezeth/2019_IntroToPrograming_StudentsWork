//Flower f1;
//Flower f2;
float speedX;
float speedY;
float size0;
float size1;
int petals;

Flower[] flowers = new Flower[3];

void setup() {
  size(800,600);
  stroke(1);
  /*f1 = new Flower(30,6); old non array code
  f2 = new Flower(50,speedX,speedY);*/
  size0 =30;
  size1 = 50;
  speedX=3;
  speedY=3;
  petals=6;
  flowers[0] = new Flower(size0,petals);
  flowers[1] = new Flower(size1,speedX,speedY);
  flowers[2] = new Flower();
  
}

void draw(){
   background(#43AF76);
stroke(1);
if(flowers[0].overlaps(flowers[1])){
background (0,0,255);
}

flowers[0].display();
flowers[1].display();
flowers[2].displayMouseFlower();

} 
