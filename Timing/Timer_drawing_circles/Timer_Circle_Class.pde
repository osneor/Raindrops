class Circle {
  PVector loc;
  int d;
  color c;
  float w;

  Circle() {
    d = int (random(20, 50));
    loc = new PVector(random(d,width-d), random(d,height-d));
    c = color(random(255), random(255), random(255));
    w=(random(d/10,d/1.1));
  }
  void display() {
    fill(c);
    strokeWeight(w);
    ellipse(loc.x, loc.y, d, d);
  }
}
