float scale;           //scale factor
int loop;
float rotationAngle;   //rotation for branches
float thickness;
float scalethick;      //difference of thickness between branches
int branchesLength;

void setup(){
  size(700,700);
  noLoop();
  scale = 0.7;        //-30%
  scalethick = 0.45;
  loop = 10;
  rotationAngle = PI/10.0;
  thickness = 8.0;
  branchesLength = 150;
}
void draw(){
  pushMatrix();
  translate(width/3, height);
  tree(loop,branchesLength,thickness, rotationAngle);
  popMatrix();
  
  stroke(255);
  pushMatrix();
  translate(width/2+10, height);
  tree(loop, branchesLength,thickness, rotationAngle);
  popMatrix();
  
  stroke(70);
  pushMatrix();
  translate(width/2 + 130, height);
  tree(loop, branchesLength, thickness*0.8, rotationAngle);
  popMatrix();
  
  grass();
}


void tree(int level, float branchesLength, float strw, float rotationAngle){
  if(level>0){
    strokeWeight(strw);
    stroke(level*15-25, 255 - level*10-75, level);
    //log
    line(0,0,0,-branchesLength);
    //set coords on top of the previous log
    translate(0,-branchesLength);
    
    //leaves
    if(level<5){
      fill(random(45,150),random(100,180),50);
      float r = random(8);
      float del = 15;
      ellipse(0,0,r,r);
      ellipse(del,del,r,r);
      ellipse(-del,-del,r,r);
      ellipse(del,0,r,r);
      ellipse(0,-del,r,r);
    }
    
    pushMatrix();
    rotate(rotationAngle*rnd());
    tree(level-1, branchesLength * scale * rnd(), strw*scalethick, rotationAngle);
    popMatrix();
    
    rotate(-rotationAngle*rnd());
    tree(level-1, branchesLength * scale * rnd(), strw*scalethick, rotationAngle);
  }
}

void grass(){
  strokeWeight(1.5);
  for(int i=0;i<width;i++){
    float move = random(-2,2);
    stroke(random(75,120), random(100,200), 45);
    line(i,height, i+move, height-random(2,height-(height-15)));
  }
}

float rnd(){
  return random(0.6, 1.3);
}