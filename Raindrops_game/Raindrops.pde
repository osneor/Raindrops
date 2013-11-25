class Raindrops {
  PVector loc;
  PVector acc;
  PVector vel;
  float s;
  int d;
  float score;

  Raindrops() {
    loc=new PVector(random(width), random(-height/2, 0));
    vel=new PVector(random(-.1, .1), random(1, 3));
    acc=new PVector(0, random(0, 1));
    s= random(1, 6);
    d=10;
    score=0;
  }

  void show () {

    if (s>=1 && s<2) {
      d=5;
    }
    if (s>=2 && s<3) {
      d=15;
    }
    if (s>=3 && s<4) {
      d=2;
    }
    if (s>=4 && s<5) {
      d=30;
    }
    if (s>=5) {
      d=10;
    }
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

  void catchit(Catcher c) {
    if (loc.dist(c.cloc) <d/2 + c.dh/2) {
      loc.set(random(width), random(-height/2, 0));
    }
  }
}

