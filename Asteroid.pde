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
