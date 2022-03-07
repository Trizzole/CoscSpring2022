import java.util.Scanner;
public class AverageTwo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Construct Scanner object for reading input
		Scanner scan = new Scanner(System.in);
		
		//Set up running total of num of items
			int total = 0;
			int numOfItems = 0;
			int input = 0;
		boolean check = true;
		while (check == true) {
			input = scan.nextInt();
			if (input > 0 ) {
				total = total + input;
				numOfItems ++;
			}
			else {
				check = false;
			}
			
		}
		double average = (double) (total/numOfItems);
		System.out.println("Average is " + average);
			
		
	}

}
