//
//A Simple demonstration of the Wolenstien 3D Raycasting technique.
//(C) Patrick Kelly 2004. (patrickellyswd AT iol DOT ie)
//

//I declare this freeware in the Public Domain - do whatever you want with it 
//as long as you give credit to me and anyone who modifies it. 
//That includes derivative works.
//
//NOTES:
//Try and add texture mapping it's dead easy to do.
//This is completely unoptimised - work it out youself :-).
//
// If you modify this please add your name here so we know what's happening!
// List of changes:
//
// June 20 2004 - Patrick Kelly (patrickellyswd AT iol DOT ie) - Created this unoptimised code.

//Imports
import	java.awt.*;
import	java.awt.image.*;
import	java.awt.event.*;
import	javax.swing.*;

//Class declaration
public class Raycaster extends JFrame implements Runnable
{
	//Off screen buffer
	Graphics	gcb;
	BufferedImage	imgBuffer;
	
	//What the player is currently doing
	int PlayerAction = -1;
	
	//Useful constants
	//Our screen is 320 pixels wide, we want 60 degree field of view
	//that means that our unit is 320 * 6 = 1920, because 360 / 6 is 60.
	static final int Angle360 = 1920;
	static final int Angle270 = 1440;
	static final int Angle180 = 960;
	static final int Angle90 = 480;
	static final int Angle60 = 320;
	static final int Angle45 = 240;
	static final int Angle30 = 160;
	static final int Angle6 = 32;

	//Player Actions
	static final int UP = 1;
	static final int DOWN = 2;
	static final int LEFT = 3;
	static final int RIGHT = 4;
	
	//The world - can be any size.
	static final int map[][] = 
	{
		{ 1, 1, 2, 3, 2, 3, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1 },
		{ 1, 0, 3, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 0, 2, 0, 0, 0, 2, 0, 6, 0, 5, 0, 5, 0, 0, 1 },
		{ 1, 0, 3, 0, 0, 0, 3, 0, 6, 0, 5, 2, 5, 2, 5, 1 },
		{ 1, 0, 2, 0, 0, 0, 2, 0, 6, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 0, 3, 2, 3, 2, 3, 0, 6, 4, 4, 4, 4, 4, 0, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 1 },                
		{ 1, 0, 4, 0, 4, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 1 },
		{ 1, 0, 4, 0, 4, 0, 1, 0, 0, 4, 4, 4, 4, 4, 0, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 0, 4, 0, 4, 0, 1, 0, 0, 5, 2, 5, 2, 5, 0, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 0, 4, 0, 4, 0, 1, 0, 0, 5, 2, 5, 2, 5, 0, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
	};

	//Colour pallette
	static final Color Colours[] = { Color.red, Color.yellow, Color.cyan, Color.magenta, Color.white, Color.pink };

	//Constructor
	Raycaster()
	{

		//Show a little message
		JOptionPane.showMessageDialog
		( 
			null, 
			(Object)"Simple JAVA Raycaster demo\nby Patrick Kelly\nEmail: patrickkellyswd AT iol DOT ie\n",
			"Some Info...",
			JOptionPane.INFORMATION_MESSAGE,
			null
		);
		
		//Create buffer for offscreen rendering.
		imgBuffer = new BufferedImage( 320, 240, BufferedImage.TYPE_INT_RGB );
		gcb = imgBuffer.getGraphics();
		
		//Make sure we can close the window.
		addWindowListener
		(
			new WindowAdapter()
			{
				public void windowClosing( WindowEvent e )
				{
					setVisible( false );
					dispose();
					System.exit( 0 );
				}
			}
		);

		//Keyboard handler
		addKeyListener
		(
		 	new KeyAdapter()
			{
				public void keyPressed( KeyEvent e )
				{
					int key = e.getKeyCode();
					switch( key )
					{
						case KeyEvent.VK_UP:
							PlayerAction = UP;
							break;
						case KeyEvent.VK_DOWN:
							PlayerAction = DOWN;
							break;
						case KeyEvent.VK_LEFT:
							PlayerAction = LEFT;
							break;
						case KeyEvent.VK_RIGHT:
							PlayerAction = RIGHT;
							break;
						default:
							break;
					}
				}

				public void keyReleased( KeyEvent e )
				{
					int key = e.getKeyCode();
					switch( key )
					{
						case KeyEvent.VK_UP:
						case KeyEvent.VK_DOWN:
						case KeyEvent.VK_LEFT:
						case KeyEvent.VK_RIGHT:
							PlayerAction = -1;
							break;
						default:
							break;
					}
				}
			}
		);
			
		//Display window				
		setTitle( "Simple JAVA Raycaster V1.0" );
		setSize( 320, 240 );
		setVisible( true );

		//Start running
		new Thread( this ).start();
	}

	//This method converts our angles on our 1920 "Degree" circle to radians.
	private double getAngle( int a )
	{
		return	( (double)a * (Math.PI / 960) );
	}

	//Main loop
	public void run()
	{

		//ray being cast, angle of ray, players viewing angle, colour of wall,
		//distance of wall from player, height of wall, for compensating for fishbowl effect.
		int	ray, angle, pangle, wall, distance, height, fix;
		//Used to keep steady fps
		long	timeStart;
		//Ray step x, Ray step y, player x world position, player y world position,
		//ray x world position, ray y world position, collision detection.
		double	stepx, stepy, playerx, playery, rayx, rayy, oldplayerx, oldplayery;
		//Centre of screen
		final int cx = getWidth() / 2;
		final int cy = getHeight() / 2;
		
		//Set player at middle of map, looking to angle 0.
		playerx = 8;
		playery = 8;
		pangle = 0;
    		
		//Man loop begins
		while( true )
		{
			timeStart = System.currentTimeMillis(); //Used to keep steady 25 fps

			//Our rays starting angle is the players view angle minus 30 for a 60 degree fov.
			angle = ( pangle - Angle30 );
			
			//320 ray for each vertical screen line
    		        for( ray = 0; ray < 320; ++ray )
		        {
				//Make sure ray is in bounds
                		angle = angle % Angle360;
		                if( angle < 0 )
                		{
      			              angle = Angle360 + angle;
            			}
                
				//This is the fix angle for compensating for fishbowl effect.
				//That is when rays are cast from a sigle point it distorsts the view.
				//fix angle is always bettween  and 
   			        fix = ( ray - Angle30 ) % Angle360;
              			if( fix < 0 ) fix = Angle360 + fix;
                
				//Ray starting position = player starting position
		                rayx = playerx; 
                		rayy = playery;

				//Calculate ray step x, ray step y.
				//Need to multiply by 1 / cos( fix ) to get rid of fishbowl.
				//Remove it and see what happens.
		                stepx = ( Math.cos( getAngle( angle ) ) * ( 1.0 / Math.cos( getAngle( fix ) ) ) ) / 8;
                		stepy = ( Math.sin( getAngle( angle ) ) * ( 1.0 / Math.cos( getAngle( fix ) ) ) ) / 8;
            
				//Set these to minimum value
				wall = 0;
				distance = 1; //Do *NOT* set to 0 or you might get /0 error.

				//Loopp until wall found
		                while( wall == 0 )
                		{
		                    rayx += stepx;	//Ray traverses map in x by stepx.
                		    rayy += stepy;	//Ray traverses map in x by stepy.
		                    wall = map[ (int)rayx ][ (int)rayy ]; //Have we hit a wall.
                		    distance++;		//Increment distance for each step.
                		}
				
				//calculate height of wall. If you reduce you y - res reduce 1024.            
				height = ( 1024 / distance ); 

				//Draw sky
				gcb.setColor( Color.blue );
				gcb.drawLine( ray, 0, ray, cy - height );
				
				//Draw Wall
				gcb.setColor( Colours[ wall - 1 ] );
		                gcb.drawLine( ray, cy - height, ray, cy + height );

				//Draw ground
				gcb.setColor( Color.green );
				gcb.drawLine( ray, cy + height, ray, getHeight() );

				//Increase angle to next ray.
                		++angle;
			}
			
			repaint();
			
			//Handle player actions
			switch( PlayerAction )
			{
				case UP:
					oldplayerx = playerx;	//For collison
					oldplayery = playery;	//For collison

					//16 is the number of steps a player takes through each map cell
					playerx += ( Math.cos( getAngle( pangle ) ) / 16 ); //Increase X
					playery += ( Math.sin( getAngle( pangle ) ) / 16 ); //Increase Y
					
					//Have we hit a wall
					if( map[ (int)playerx ][ (int)playery ] > 0 )
					{
						playerx = oldplayerx;
						playery = oldplayery;
					}
					break;
				case DOWN:
					//This is same as above
					oldplayerx = playerx;
					oldplayery = playery;
					playerx -= ( Math.cos( getAngle( pangle ) ) / 16 );
					playery -= ( Math.sin( getAngle( pangle ) ) / 16 );
					if( map[ (int)playerx ][ (int)playery ] > 0 )
					{
						playerx = oldplayerx;
						playery = oldplayery;
					}					
					break;
					
				case LEFT:
					pangle -= Angle6;	//Player turns left
					pangle %= 1920;
			                if( pangle < 0 )
        	        		{
      				              pangle = 1920 + pangle;
            				}
               				break;
				case RIGHT:
					pangle += Angle6;	//Player turns right
					pangle %= 1920;
			                if( pangle < 0 )
        	        		{
      				              pangle = 1920 + angle;
            				}
                			break;
				default:
					break;
			}
			
			//Keep 25FPS. 1000 / 25 = 40
			while( ( System.currentTimeMillis() - timeStart ) < 40 )
			{
			}
		}
	}

	//Paint screen
	public void paint( Graphics g )
	{
		g.drawImage( (Image)imgBuffer, 0, 0, this );
	}
	
	//Main
	public static void main( String[] args )
	{
		new Raycaster();
	}
		
}
	
