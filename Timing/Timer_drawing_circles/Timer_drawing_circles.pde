int index = 0;
Circle[] circs = new Circle[1000];
int currenttime;
int oldtime=0;
int timediff=0;
color c= color(0);

void setup() {
  size(600, 600);
  for (int i = 0; i < circs.length; i++) {
    circs[i] = new Circle();
  }
}

void draw() {
  background(c);
  currenttime=millis();
  timediff=currenttime - oldtime;
  if (timediff >= 3000) {
    index++;
    c=color(random(255), random(255), random(255));
    oldtime=currenttime;
  }
  for (int i = 0; i <= index; i++) {
    circs[i].display();
  }
  textSize(35);
  text("Ttime: " + currenttime/1000.0,50,50);
}





