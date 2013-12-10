class Raindrops {
  //declare pvectors and variables location, acceleration, velocity, size and diameter
  PVector loc;
  PVector acc;
  PVector vel;
  float s;
  int d;


  Raindrops() {
    //we want the drops to appear at varying times, so we give some a longer distance to fall  (random(-height/2, 0))
    loc=new PVector(random(width), random(-height/2, 0));
    vel=new PVector(random(-.1, .1), random(1, 3));
    acc=new PVector(0, random(0, 1));

    //the size (s) is set randomly between 1 and 6. each value range of s gives a different diameter for the drop
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

  //draws the circle
  void show () {
    ellipse(loc.x, loc.y, d, d);
  }

  //moves the circle, sets a max acceleration (because otherwise, things get faster for ever)
  void move() {
    loc.add(acc);
    loc.add(vel);
    if (acc.y>3) {
      acc.y=3;
    }
  }

  //if the raindrop falls offscreen, it appears back somewhere above the top of the screen, and it loses its acceleration
  void comeback() {
    if (loc.y>height) {
      loc.y=random(-height/2, 0);
      acc.set(0, 0);
    }
  }

//this is where the magic happens. the catcher class is given a variable c to stand in.
//if there is an overlap between the catcher and a drop, the location is set to somewhere in the jail and it stops moving.
  boolean catchit(Catcher c) {
    if (loc.dist(c.cloc) <d/2 + c.dh/2) {
      loc.set(random(450+d, 550-d), random(100+d, 200-d));
      vel.set(0, 0);
      acc.set(0, 0);
      return true;
    }
    else {
      return false;
    }
  }
}

