//declare array of raindrops
Raindrops[] drop = new Raindrops[200];

//start screen
boolean start;

//declare variables for timer functions
int index = 0;
int currenttime;
int oldtime=0;
int timediff=0;

//declare catcher and variable for score
Catcher c1;
float score;

void setup() {
  size(600, 600);

  //initialize raindrops
  for (int i = 0; i < drop.length; i++) {
    drop[i] = new Raindrops();
  }
  start=false;

  //initialize catcher
  c1=new Catcher();
}

void draw() {
  if (start==false) {
    stroke(255);
    strokeWeight(5);
    fill(255, 0, 50, 100);
    background(0);
    ellipse(width/2, height/2, 100, 100);
    fill(255);
    textSize(100);
    textAlign(CENTER);
    text("Start", width/2, height/2);
  }
  else {
    //lovely blue background
    background(0, 50, 100);

    //drawing the jail for the raindrops to go in when they are caught
    stroke(0);
    fill(255, 255);
    strokeWeight(3);
    noFill();
    rect(450, 100, 100, 100);
    //reset strokeweight
    strokeWeight(1);

    //set text size and align because it will change multiple times, create the jail title
    textAlign(LEFT);
    textSize(20);
    text("JAIL", 450, 100);

    //show the score
    textSize(50);
    text(score, 50, 50);

    //use the catcher
    fill(255);
    c1.cshow();

    //setup for the timer. currenttime moves forward with the (obviously) current time in millis.
    //the difference between the current and old time is the time between each timer related action.
    currenttime=millis();
    timediff=currenttime - oldtime;

    if (timediff >= 2200) {
      //index is the number of raindrops being created. one is created every 2.2 seconds when index increases
      index++;
      //resets timer to the current time (difference of 0) if the timediff = 2.2 seconds
      oldtime=currenttime;
    }

    //slightly transparent raindrops
    fill(255, 150);

    //use of the raindrops
    for (int i = 0; i <= index; i++) {
      drop[i].show();
      drop[i].move();
      drop[i].comeback();

      //every time a raindrop is caught (using the boolean catchin in the raindrops class), 
      //the score goes up the size of the raindrop (s)
      //since 2 is a float, and i dont want decimals, i use round
      if (drop[i].catchit(c1)) {
        score+=round(drop[i].s);
      }

      //this is for redundency purposes. if you make it all the way to the end of the array, no matter what the score, you win. 
      //this allows you to automatically win before you reach the end of the array
      if (index>=drop.length-1) {
        textAlign(CENTER);
        text("YOU WIN ", width/2, height/2);
        drop[i].vel.set(0, 0);
        drop[i].acc.set(0, 0);
      }

      //every time you get up 25 pts, and the acc is above 0 (because the ones in the jail have an acc of 0), acc increases
      if (score>=25 && drop[i].acc.y>0) {
        drop[i].acc.add(0, .5, 0);
      }
      if (score>=50 && drop[i].acc.y>0) {
        drop[i].acc.add(0, .5, 0);
      }
      if (score>=75 && drop[i].acc.y>0) {
        drop[i].acc.add(0, .5, 0);
      }

      //if you get a score of 100, you win, it tells you so, and everything stops moving
      if (score>=100) {
        textAlign(CENTER);
        text("YOU WIN ", width/2, height/2);
        drop[i].vel.set(0, 0);
        drop[i].acc.set(0, 0);
      }
    }
  }
}

void mousePressed() {
  start=true;
}

