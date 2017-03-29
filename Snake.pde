import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer geometryDashMusic;
AudioInput input;

int r = 255;
int g = 0;
int b = 0;
float speed = 10;
int size = 0;
float snakeBodyX = 100;
float snakeBodyY = 100;
float redDotX = 500;
float redDotY = 500;
boolean changeColor = false;
int score = 0;

void setup()
{
  fullScreen(P2D);
  background(0);
  minim = new Minim(this);
  geometryDashMusic = minim.loadFile("Forever Bound - Stereo Madness.mp3");
  //input = minim.getLineIn();
  geometryDashMusic.loop();
  redDotX = random(width);
  redDotY = random(height);
}

void draw()
{
  {
    snake();
    moveSnake();
    drawScore();
    keyPressed();
    ellipse(redDotX, redDotY, 20, 20);

    //if(changeColor == false)
    //{
    //  g = 0;
    //  b = 0;
    //}

    //if(changeColor == true)
    //{
    //  g = 255;
    //  b = 255;
    //}

    //If the distance between the snake and the red dot is less than 20, the red dot will change it's position.
    if (dist(snakeBodyX, snakeBodyY, redDotX, redDotY)<20)
    {
      //changeColor = true;
      redDotX = random(width);
      redDotY = random(height);
      speed = speed +0.5;
      score = score+1;
      size = size +1;
      // snakeBodyX [size] = snakeX + 100;
    }

    fill(r, g, b);
    stroke(0, 0, 0, 0);
    ellipse(redDotX, redDotY, 20, 20);
    fill(255);
    rect(snakeBodyX, snakeBodyY, 20, 20);
  }
}

void snake()
  //If the snake goes off one side of the screen it will appear on the other. 
{
  background(0);
  fill(255);
  rect(snakeBodyX, snakeBodyY, 20, 20);
  rectMode(CENTER);

  if (snakeBodyY<0)
  {
    snakeBodyY = height;
  }
  if (snakeBodyY>height)
  {
    snakeBodyY = 0;
  }
  if (snakeBodyX<0)
  {
    snakeBodyX = width;
  }
  if (snakeBodyX>width)
  {
    snakeBodyX=0;
  }
}

void moveSnake()
  //Arrow keys move the snake left, right, up, and down.
{
  if (key == CODED)
  {
    if (keyCode == UP) 
    {
      snakeBodyY= snakeBodyY-speed;
    } else if (keyCode == DOWN)
    {
      snakeBodyY = snakeBodyY+speed;
    } else if (keyCode == LEFT)
    {
      snakeBodyX= snakeBodyX-speed;
    } else if (keyCode == RIGHT)
    {
      snakeBodyX = snakeBodyX+speed;
    }
  }
}

//Score that counts how many red dots have been collected. 
void drawScore()
{
  stroke(0);
  textSize(27);
  fill(255);
  text(score, width-50, 50);
}