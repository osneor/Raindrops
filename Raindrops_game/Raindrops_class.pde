class Raindrops {
  PVector loc;
  PVector acc;
  PVector vel;
  float s;
  int d;


  Raindrops() {
    loc=new PVector(random(width), random(-height/2, 0));
    vel=new PVector(random(-.1, .1), random(1, 3));
    acc=new PVector(0, random(0, 1));
    s= random(1, 6);
    if (s>=1 && s<2) {
      d=20;
    }
    if (s>=2 && s<3) {
      d=30;
    }
    if (s>=3 && s<4) {
      d=40;
    }
    if (s>=4 && s<5) {
      d=50;
    }
    if (s>=5) {
      d=60;
    }
  }

  void show () {
    ellipse(loc.x, loc.y, d, d);
  }

  void move() {
    loc.add(acc);
    loc.add(vel);
    if (acc.y>3) {
      acc.y=3;
    }
  }

  void comeback() {
    if (loc.y>height) {
      loc.y=random(-height/2, 0);
      acc.set(0, 0);
    }
  }

  boolean catchit(Catcher c) {
    if (loc.dist(c.cloc) <d/2 + c.dh/2) {
      loc.set(random(450+d,550-d), random(100+d,200-d));
      vel.set(0,0);
      acc.set(0,0);
      return true;
    }
    else {
      return false;
    }
  
}
}
