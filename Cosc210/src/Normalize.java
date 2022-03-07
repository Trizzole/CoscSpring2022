import java.util.Scanner;
public class Normalize {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scan = new Scanner(System.in);
		
		//initialize largest value
		double maxVal = 0.0;
		//initialize our array
		double[] values = new double[10];
		
		//read in values
		for (int i = 0; i < 10; i++) {
			values[i]  = scan.nextDouble();
			//check against max value
			if (values[i] > maxVal) {
				maxVal = values[i];
			}
		}
		
		//normalize and output
		for (int i = 0; i < 10; i++) {
			values[i] = values[i] / maxVal;
			System.out.println(values[i] + " ");
		}
		
	}

}
