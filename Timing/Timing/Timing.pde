
int currenttime=0;
int oldtime=0;
int timediff=0;
color c= color(0);
int d=35;

void setup() {
  size(600, 600);
  ellipse(random(d, width-d), random(d, height-d), d, d);
}

void draw() {
  currenttime=millis();
  timediff=currenttime - oldtime;
  if (timediff >= 3000) {
    c=color(random(255), random(255), random(255));
    fill(c);
    ellipse(random(d, width-d), random(d, height-d), d, d);
    oldtime=currenttime;
  }
}

