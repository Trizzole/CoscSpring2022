import java.util.Scanner;

// Thomas Reinke 2/22/2022
public class Midterm1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//Creates scanner to take in values from user
		Scanner scan = new Scanner(System.in);
		
		//creates an array from user inputs
		int[] arr = new int[10];
		for(int i = 0; i < 10; i++) {
			int input = scan.nextInt();
			arr[i] = input;
		}
		
		//initializes values to hold the sum of even and odd inputs
		int sumEven = 0;
		int sumOdd = 0;
		
		//for loop to calculate sums for even and odd inputs
		for(int i = 0; i < 10; i++) {
			//if even input, add to even total
			if (arr[i] % 2 == 0) {
				sumEven += arr[i];
			}
			//if odd input, add to odd total
			if (arr[i] % 2 == 1) {
				sumOdd += arr[i];
			}
		}
		
		//initializes value to hold sum of all inputs	
		int total = 0;
		//loop to calculate sum of all inputs
		for(int i = 0; i < 10; i++) {
			total += arr[i];
		}
		
		//prints out the sum of even, odd, and all inputs
		System.out.println("Sum of even inputs is " + sumEven);
		System.out.println("Sum of odd inputs is " + sumOdd);
		System.out.println("Sum of all inputs is " + total);
	}

}
