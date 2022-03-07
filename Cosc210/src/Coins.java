import java.util.Scanner;
public class Coins {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Set up input
		Scanner scan = new Scanner(System.in);
		
		//Construct Arrays
		String[] denoms = {"Pennies", "Nickles", "Dimes", "Quarters", "Half Dollars", "Silver Dollars"};
		double[] coinValues = {.01, .05, .1, .25, .5, 1.0};
		int[] numCoins = new int[coinValues.length];
		
		
		//Declare variable to hold total value
		double totalAmount = 0.0;
		
		//Populate numCoins from input
		for(int i = 0; i < coinValues.length; i ++) {
			System.out.println("How many " + denoms[i] + "? ");
			numCoins[i] = scan.nextInt();
			System.out.println();
		}
		
		//Compute total value
		for(int i = 0; i < coinValues.length; i ++) {
			totalAmount += coinValues[i] * numCoins[i];
		}
		//Print out result
		System.out.println("I have a total of $" + totalAmount);
	}

}
