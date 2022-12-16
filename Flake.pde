class Flake {
  int fS;
  int x, y;
  color c;
  boolean stuck, ended;
  Flake() {
    fS = 20;
    x = width/2;
    y = 0;
    c = color((int) (Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
    stuck = false;
    ended = false;
  }
  void move() {
    x += -10;
    y += (int)((Math.random() * 5)) - 2;
  }
  void show() {
    fill(c);
    line(x, y, fS, fS);
  }
  boolean isStuck() {
    for (Flake f : mySnowflake) {
      if (this != f) {
        if (dist(x, y, f.x, f.y) <= fS) {
          stuck = true;
          ended = true;
        }
      }
    }
    return stuck;
  }
  boolean isEnded() {
    if (x <= fS/2) {
      ended = true;
      stuck = true;
    }
    return ended;
  }
  
  boolean update() {
    return isStuck() || isEnded();
  }
}
