ArrayList <Flake> mySnowflake; //GLOBAL! EVERYTHING HAS ACCESS TO IT
int flakeNum = 6;
Flake myFlake;
void setup() {
  size(500, 500);
  mySnowflake = new ArrayList<Flake> ();
  myFlake = new Flake();
  mySnowflake.add(myFlake);
}

void draw() {
  background(255);
  translate(width/2, height/2);

  if (!myFlake.ended || !myFlake.stuck) {
    myFlake.move();
  }


  if (myFlake.update()) {
    myFlake = new Flake();
    if (getLastElement().x >= width/2 - getLastElement().fS) {
      noLoop();
    }
    mySnowflake.add(myFlake);
  }
  for (int i = 0; i<flakeNum; i ++) {
    rotate(2*PI/flakeNum);
    showFlakes();
  }
}
Flake getLastElement() {
  int sizeOfSnowflake = mySnowflake.size()-1;
  Flake lastElement = mySnowflake.get(sizeOfSnowflake);
  return lastElement;
}

void showFlakes() { 
  for (Flake f : mySnowflake) {
    f.show();
  }
}
