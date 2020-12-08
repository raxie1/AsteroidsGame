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
