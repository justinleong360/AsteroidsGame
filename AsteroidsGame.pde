SpaceShip bob;
Star [] stars;
ArrayList <Asteroid> one;
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;
boolean shoot = false;
float friction = 1.01;
int oneNum = 21;

public void setup() 
{
  one = new ArrayList <Asteroid>();
  oneNum = 20;
  stars = new Star[100];
  bob = new SpaceShip();
  for(int i = 0; i< stars.length; i++)
  {
    stars[i] = new Star();
  }
  for(int i = 0; i< oneNum; i++)
  {
    one.add(new Asteroid());
  }
  size(700,700);
}
public void draw() 
{
  background(0,0,0);
  for(int i = 0; i<bullets.size(); i++)
  {
    bullets.get(i).move();
    bullets.get(i).show();
  }
  for(int i = 0; i< stars.length; i++)
  {
    stars[i].show();
  }
  for(int i = 0; i< one.size(); i++)
  {
    one.get(i).show();
    one.get(i).move();
  }
  for(int i = 0; i <one.size();i++)
  {
    for(int x = 0; x<bullets.size();x++)
    {
    if(dist(one.get(i).getX(),one.get(i).getY(),bullets.get(x).getX(), bullets.get(x).getY())<10)
    {
      one.remove(i);
      bullets.remove(x);
      break;
    }
  }
  }
  bob.show();
  bob.move();
  if(left == true)
  {
    bob.rotate(-5);    
  }
  if(right == true)
  {
    bob.rotate(5);
  }
  if(up == true)
  {
    bob.accelerate(0.1);
  }
  if(down == true)
  {
    bob.accelerate(-0.1);
  }
}
public void keyPressed()
{
  if(keyCode == LEFT)
  {
    left = true;
  }
  if (keyCode == RIGHT)
  {
    right = true;
  }
  if(keyCode == UP)
  {
    up = true;
  }
  if (keyCode == DOWN)
  {
    down = true;
  }
  if(keyCode == 74)
  {
    bob.setX((int)(Math.random()*700)+1);
    bob.setY((int)(Math.random()*700)+1);
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    bob.setPointDirection((int)(Math.random()*360));
  }
  if(keyCode == ' ')
  {
    bullets.add(new Bullet(bob));
  }
}

public void keyReleased() 
{
  if(keyCode == LEFT)
  {
    left = false;  
  }
  if(keyCode == RIGHT)
  {
    right = false;
  }
  if(keyCode == UP)
  {
    up = false;
  }
  if (keyCode == DOWN)
  {
    down = false;
  }
}

class SpaceShip extends Floater  
{   
   public SpaceShip()
   {
    corners = 20;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -14;
    yCorners[0] = 28;
    xCorners[1] = -4;
    yCorners[1] = 28;
    xCorners[2] = 6;
    yCorners[2] = 24;
    xCorners[3] = -4;
    yCorners[3] = 20;
    xCorners[4] = 0;
    yCorners[4] = 14;
    xCorners[5] = 22;
    yCorners[5] = 0;
    xCorners[6] = 0;
    yCorners[6] = -14;
    xCorners[7] = -4;
    yCorners[7] = -20;
    xCorners[8] = 6;
    yCorners[8] = -24;
    xCorners[9] = -4;
    yCorners[9] = -28;
    xCorners[10] = -14;
    yCorners[10] = -28;
    xCorners[11] = -18;
    yCorners[11] = -24;
    xCorners[12] = -14;
    yCorners[12] = -20;
    xCorners[13] = -16;
    yCorners[13] = -6;
    xCorners[14] = -22;
    yCorners[14] = -2;
    xCorners[15] = -24;
    yCorners[15] = 0;
    xCorners[16] = -22;
    yCorners[16] = 2;
    xCorners[17] = -16;
    yCorners[17] = 6;
    xCorners[18] = -14;
    yCorners[18] = 20;
    xCorners[19] = -18;
    yCorners[19] = 24;
    myColor = 255;
    myCenterX = 350;
    myCenterY = 350;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
   }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}  
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)myCenterY;} 
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}  
  public double getDirectionY() {return myDirectionY;} 
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;}
}

class Asteroid extends Floater
{
  private double rotation;
  public Asteroid()
  {
    int num = (int)(Math.random()*5)+2;
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0]=(int)(Math.random()*4*num)+6*num;
    yCorners[0]=(int)(Math.random()*4*num)-3*num;
    xCorners[1]=(int)(Math.random()*4*num);
    yCorners[1]=(int)(Math.random()*4*num)-6*num;
    xCorners[2]=-(int)(Math.random()*4*num);
    yCorners[2]=(int)(Math.random()*4*num)-6*num;
    xCorners[3]=(int)(Math.random()*6*num)-6*num;
    yCorners[3]=(int)(Math.random()*4*num)-3*num;
    xCorners[4]=-(int)(Math.random()*4*num);
    yCorners[4]=(int)(Math.random()*4*num)+6*num;
    xCorners[5]=(int)(Math.random()*4*num);           
    yCorners[5]=(int)(Math.random()*4*num)+6*num;     
    myColor = 255;
    myCenterX = (int)(Math.random()*700);
    myCenterY = (int)(Math.random()*700);
    myDirectionX = Math.cos(Math.random()*2*Math.PI);
    myDirectionY = Math.sin(Math.random()*2*Math.PI);
    myPointDirection = 0;
    rotation = Math.random();
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}  
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)myCenterY;} 
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}  
  public double getDirectionY() {return myDirectionY;} 
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;}
  public int getRotation() 
  {if(rotation < 0.5)
    {rotation = 5;}
    if(rotation > 0.5)
    {rotation = -5;}
    return (int)rotation;
  }
  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    myPointDirection += rotation;

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }
}

class Bullet extends Floater
{
  public Bullet(SpaceShip bob)
  {
    myColor = 255;
    myCenterX = bob.getX();
    myCenterY = bob.getY();
    myPointDirection = bob.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + bob.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + bob.getDirectionY();
    
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}  
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)myCenterY;} 
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}  
  public double getDirectionY() {return myDirectionY;} 
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;}
  public void show()
  {
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    myDirectionX = myDirectionX/friction;
    myDirectionY = myDirectionY/friction;

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

class Star
{
  private int myX, myY, mySize, myColorR, myColorG, myColorB;
  public Star()
  {
    myX = (int)(Math.random()*700)+1;
    myY = (int)(Math.random()*700)+1;
    mySize = (int)(Math.random()*5)+5;
    myColorR = (int)(Math.random()*254)+1;
    myColorG = (int)(Math.random()*254)+1;
    myColorB = (int)(Math.random()*254)+1;
  }
  public int getX() {return myX;}
  public int getY() {return myY;}
  public int getColor1() {return myColorR;}
  public int getColor2() {return myColorG;}
  public int getColor3() {return myColorB;}
  public int getSize() {return mySize;}
  public void show()
  {
    noStroke();
    fill(getColor1(), getColor2(), getColor3());
    ellipse(getX(),getY(),getSize(),getSize());
  }
}