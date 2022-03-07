import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;

import javax.swing.JPanel;

class MyCanvas extends JPanel {
	
	public MyCanvas() {
		// set the canvas size
		setPreferredSize(new Dimension(900,600));
		//sets background color to white
		setBackground(Color.white);
	}
	
	@Override
	protected void paintComponent(Graphics g) {
		super.paintComponent(g);
		
		Paintbrush myBrush = new Paintbrush(g);
		
		
		myBrush.drawSky();
		myBrush.drawGrass();
		myBrush.drawMountains();
		myBrush.drawTree();
		myBrush.finishingTouches();
		
	}
}