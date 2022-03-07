import java.util.Scanner;
public class Triangle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		System.out.println("Enter three values to see if they can form a triangle");
		int a = scan.nextInt();
		int b = scan.nextInt();
		int c = scan.nextInt();
		
		boolean checkTriangle = false;
		
		if (((a + b) >= c) && ((b + c) >= a) && ((a + c) >= b)) {
			checkTriangle = true;
		}
		
		
		if (checkTriangle == true) {
			System.out.println("these can form a triangle");
		}
		else {
			System.out.println("these cannot form a triangle");
		}
	}

}
