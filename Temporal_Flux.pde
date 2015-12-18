// Temporal Flux v0.1 - Michael F Bergmann
// Initializes to count down from 15 minutes
// Press K to start / stop, R to reset
// Adjust the speed of counting with J and L


PFont displayFont;
PFont interfaceFont;
int totalTime = 900000;
int second;
int minute;
int speed = 1000;
int time = millis();
float speedDisplay;
Boolean run = false;


String secondDisplay = nf(second, 2);
String minuteDisplay = nf(minute, 2);
String timerDisplay = minuteDisplay + ":" + secondDisplay;

void settings() {
//  fullScreen(P2D, 2);
  size(800, 600);
}

void setup() {
  fill(255, 0, 0);
  displayFont = loadFont("Erbos-Draco-1st-Open-NBP-160.vlw");
  interfaceFont = loadFont("Courier-Bold-96.vlw");
  textAlign(CENTER, CENTER);

 
}

void draw() {
  background(0);
  
  textFont(displayFont, 96);
  text(timerDisplay, width/2, height/2);
  speedDisplay = map((speed/100), 0, 20, 5, -5);
  thread("count");
  
  textFont(interfaceFont, 48);
  text("Speed adjustment: " + speedDisplay, width/2, height - 100);
  text("Running: " + run, width/2, height - 150);
  println(speed / 100);
  
  }

void count() {
    if(millis() - time >= speed) {
      second = (totalTime / 1000) % 60;
      minute = (totalTime / (1000 * 60)) % 60;
      secondDisplay = nf(second, 2);
      minuteDisplay = nf(minute, 2);
      timerDisplay = minuteDisplay + ":" + secondDisplay;
      //println(totalTime);
      //println(minute + ":" + second);
      time = millis();
      if ((totalTime > 0) && (run == true)){
        totalTime = totalTime - 1000;
      }
    }   
  }

void keyPressed() {
  switch(key) {
    case 'j':
    case 'J':
      speed = speed + 100;
      break;
    case 'l':
    case 'L':
      speed = speed - 100;
      break;
    case 'k':
    case 'K':
      if(run == true){
        run = false;
      } else if(run == false){
        run = true;
      }
      break;
    case 'r':
    case 'R':
      totalTime = 900000;
      run = false;
      break;
  }
}