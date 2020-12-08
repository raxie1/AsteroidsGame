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
