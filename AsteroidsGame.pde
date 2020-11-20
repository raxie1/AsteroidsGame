Spaceship manifestgoodgrades;
ArrayList <Asteroid> ihateithere;
ArrayList <Bullet> bob = new ArrayList <Bullet>();
Star [] prettySky = new Star[600];

public void setup() 
{
  size (500, 500);
  for (int i = 0; i < prettySky.length; i++)
  {
    prettySky[i] = new Star();
  }
  ihateithere = new ArrayList <Asteroid>();
  for(int i = 0; i < 15; i++)
  {
    ihateithere.add(i, new Asteroid());
  }
  manifestgoodgrades = new Spaceship ();
}
public void draw() 
{
  background(0);
  for (int i = 0; i < prettySky.length; i++)
  {
    prettySky[i].show();
  }
  for(int i = 0; i < ihateithere.size(); i++)
  {
    ihateithere.get(i).show();
    ihateithere.get(i).move();
  }
  for(int i = 0; i < bob.size(); i++)
  {
    bob.get(i).show();
    bob.get(i).move();
  } 
  for (int i = 0; i < bob.size(); i++)
  {
    for (int p = 0; p < ihateithere.size(); p++)
    {
      if(dist(bob.get(i).getX(), bob.get(i).getY(), ihateithere.get(p).getX(), ihateithere.get(p).getY()) < 20)
        ihateithere.remove(p);
    }
  }
  manifestgoodgrades.show();
  manifestgoodgrades.move();
}

public void keyPressed()
{
  if (key == 'a')
  {
    manifestgoodgrades.turn(-5);
  }
  if (key == 'd') 
  {
    manifestgoodgrades.turn(5);
  }
  if (key == 'w') 
  {
    manifestgoodgrades.accelerate(.3);
  }
  if (key == 's')
  {
    manifestgoodgrades.accelerate(-.5);
  }
  if (key == ' ')
  {
    bob.add(new Bullet(manifestgoodgrades));
  }
  if (key == 'h')
  {
    manifestgoodgrades.setCenterX((int)(Math.random()*500));
    manifestgoodgrades.setCenterY((int)(Math.random()*500));
    manifestgoodgrades.setPointDirection((double)Math.random()*360);
    manifestgoodgrades.setDirectionX(0);
    manifestgoodgrades.setDirectionY(0);
  }
}

class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void turn (double degreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=degreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

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
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}

class Asteroid extends Floater
{   
    private int rotSpeed;
    public Asteroid()
    {
        rotSpeed = (int)(Math.random()*8)-4;
        myColor = 150;
        corners = 6;
        xCorners = new int[corners];
        yCorners = new int[corners];
        xCorners[0] = -11;
        yCorners[0] = -8;
        xCorners[1] = (int)(Math.random()*9)+6;
        yCorners[1] = -10;
        xCorners[2] = (int)(Math.random()*11)+9;
        yCorners[2] = 0;
        xCorners[3] = (int)(Math.random()*8)+5;
        yCorners[3] = (int)(Math.random()*10)+9;
        xCorners[4] = -11;
        yCorners[4] = (int)(Math.random()*9)+7;
        xCorners[5] = -13;
        yCorners[5] = 0;
        myCenterX = ((int)Math.random()*600);
        myCenterY = ((int)Math.random()*600);
        myDirectionX = ((Math.random()*6)-3);
        myDirectionY = ((Math.random()*6)-3);
        
    }
    public void setCenterX(int x)
    {
        myCenterX = x;
    }
    public int getX()
    {
      return (int)myCenterX;
    }
    public void setCenterY(int y)
    {
        myCenterY = y;
    }
    public int getY()
    {
      return (int)myCenterY;
    }
    public void setPointDirection(double a)
    {
        myPointDirection = a;
    }
    public double getPointDirection()
    {
      return myPointDirection;
    }
    public void setDirectionX(int b)
    {
        myDirectionX = b;
    }
    public double getDirectionX()
    {
      return myDirectionX;
    }
    public void setDirectionY(int c)
    {
        myDirectionY = c;
    }
    public double getDirectionY()
    {
      return myDirectionY;
    }
    
     public void move()
     {
        turn(rotSpeed);
        super.move();
     }
}

class Bullet extends Floater
{
    public void setCenterX(int x)
    {
        myCenterX = x;
    }
    public int getX()
    {
      return (int)myCenterX;
    }
    public void setCenterY(int y)
    {
        myCenterY = y;
    }
    public int getY()
    {
      return (int)myCenterY;
    }
    public void setPointDirection(double a)
    {
        myPointDirection = a;
    }
    public double getPointDirection()
    {
      return myPointDirection;
    }
    public void setDirectionX(int b)
    {
        myDirectionX = b;
    }
    public double getDirectionX()
    {
      return myDirectionX;
    }
    public void setDirectionY(int c)
    {
        myDirectionY = c;
    }
    public double getDirectionY()
    {
      return myDirectionY;
    }
    

  public Bullet(Spaceship manifestgoodgrades)
  {
    myCenterX = manifestgoodgrades.getX();
    myCenterY = manifestgoodgrades.getY();
    myPointDirection = manifestgoodgrades.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + manifestgoodgrades.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + manifestgoodgrades.getDirectionY();

  }
  public void show()
  {
    fill(255, 204, 222);
    ellipse((float)myCenterX, (float)myCenterY, 8, 8);
  }
  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
  }
}

class Spaceship extends Floater
{   
    public Spaceship()
    {
        myColor = color(233, 199, 247);
        corners = 4;
        xCorners = new int[corners];
        yCorners = new int[corners];
        xCorners[0] = -8;
        yCorners[0] = -8;
        xCorners[1] = 16;
        yCorners[1] = 0;
        xCorners[2] = -8;
        yCorners[2] = 8;
        xCorners[3] = -2;
        yCorners[3] = 0;
        myCenterX = 300;
        myCenterY = 300;
    }
    
   public void setCenterX(int x)
    {
        myCenterX = x;
    }
    public int getX()
    {
      return (int)myCenterX;
    }
    public void setCenterY(int y)
    {
        myCenterY = y;
    }
    public int getY()
    {
      return (int)myCenterY;
    }
    public void setPointDirection(double a)
    {
        myPointDirection = a;
    }
    public double getPointDirection()
    {
      return myPointDirection;
    }
    public void setDirectionX(int b)
    {
        myDirectionX = b;
    }
    public double getDirectionX()
    {
      return myDirectionX;
    }
    public void setDirectionY(int c)
    {
        myDirectionY = c;
    }
    public double getDirectionY()
    {
      return myDirectionY;
    }
}

public class Star 
{
  private int myX, myY;
  public Star()
  {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  public void show()
  {
    fill((int)(Math.random()*256),(int)(Math.random()*100),(int)(Math.random()*256));
    ellipse(myX, myY, 3, 3);
  }
}
