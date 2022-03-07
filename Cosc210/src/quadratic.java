
import java.util.Scanner;


public class quadratic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double discriminant, a, b, c;
		
		//Construct Scanner for input
		Scanner scan = new Scanner(System.in);
		
		//Prompt user for input
		System.out.println("This program finds the real roots of ax**2 + bx + c");
		System.out.println();
		
		System.out.println("Enter coefficient a: ");
		a = scan.nextDouble();
		if (a != 0) {//checking for divide by zero
			//read in b and c
			System.out.println();
			System.out.println("Enter coefficient for b: ");
			b = scan.nextDouble();
			System.out.println("Enter coefficient for c: ");
			c = scan.nextDouble();
			System.out.println();
			
			//Compute discriminant
			discriminant = (b * b) - (4 * a * c);
			
			if (discriminant < 0) {
				System.out.println("Discriminant is negative. No real roots");
			}
			else if (discriminant == 0) {
				System.out.println(" One real solution:" + (-b / (2 * a)));
			}
			else {
				//Compute square root of discriminant
				double sqrtDisc = Math.sqrt(discriminant);
				System.out.print("Two real solutions: " + ((-b - sqrtDisc)/2*a));
				System.out.println(" " + ((-b + sqrtDisc)/(2*a)));
			}
		}
		else {//handle divide by zero case
			System.out.println("You cannot divide by zero");
		}
		
	}

}
