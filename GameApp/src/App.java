import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.awt.*;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			JFrame window = new JFrame("Art");
			//When we close window, program stops
			window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			
			
			MyCanvas canvas = new MyCanvas();
			window.add(canvas);
			
			// fit the window size around the components (just our canvas)
			window.pack();
			//don't allow resizing
			window.setResizable(false);
			//open window in center of screen
			window.setLocationRelativeTo(null);
			// display the window
			window.setVisible(true);
			
	}

}







