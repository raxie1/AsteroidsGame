
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
