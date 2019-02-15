private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .4;
int c1 = 0;
int c2 = 0;
int c3 = 0;

public void setup() 
{   
	size(640,480);     
} 
public void draw() 
{   
	c1 += 1;
	c2 += 1;
	c3 += 1;
	if(c1 >= 255)
		c1 = 0;
	if(c2 >= 255)
		c2 = 0;
	if(c3 >= 255)
		c3 = 0;
	background(c1,c2,c3);   
	stroke(175,15,15);   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *= fractionLength;

	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if(branchLength > smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 
