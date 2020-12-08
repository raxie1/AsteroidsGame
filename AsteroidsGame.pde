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
    float d = dist(manifestgoodgrades.getX(), manifestgoodgrades.getY(), ihateithere.get(i).getX(), ihateithere.get(i).getY());
    if (d < 10)
      ihateithere.remove(i);
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
