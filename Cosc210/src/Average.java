import java.util.Scanner;
public class Average {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Construct Scanner object for reading input
		Scanner scan = new Scanner(System.in);
		
		
		
		//Set up running total of num of items
		int total = 0;
		int numOfItems = 0;
		
		
		//Read in first number
		int input = scan.nextInt();
		//Loop through input
		while(input > 0) {
			input = scan.nextInt();
			if (input > 0 ) {
				total = total + input;
				numOfItems ++;
				
			}//end if
		}//end while
		double average = (double) total/numOfItems;
		System.out.println("Average is " + average);
		
	}

}
