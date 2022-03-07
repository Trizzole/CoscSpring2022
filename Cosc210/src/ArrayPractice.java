import java.util.Random;
import java.util.Scanner;
public class ArrayPractice {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		double[][] values = new double[2][4];
		
		
		
		int counter = 0;
		for(int j = 0; j < 4; j++) {
			for (int i = 0; i < 2; i++) {
				values[i][j] = counter;
				counter++;
			}
		}
		
		for(int j = 0; j < 4; j++) {
			for (int i = 0; i < 2; i++) {
				System.out.print(values[i][j] + " ");
			}
			System.out.println();
		}
		
		// number of rows
		System.out.println(values.length);
		// number of columns
		System.out.println(values[0].length);
		
		int[][] matrix = { {1,2,3},{4,5,6},{7,8,9}};
		// {1,2,3} is a row
		// for {i, j, k, ... , z} each letter is a column
		
		
		
		int[][] array = { {1,2,3},{-1,-2,-3},{4,5,6} };
		int sumdiagonal = 0;
		for (int row = 0; row < array.length; row++) {
			sumdiagonal += array[row][row]; 
	
		}
		System.out.println(sumdiagonal);
		
		
		Random random = new Random();
		
		double[][] randoms = new double[3][4];
		for (int row = 0; row < randoms.length; row++) {
			for (int col = 0; col < randoms[0].length; col++) {
				randoms[row][col] = Math.random() * 100;
			}
		}
		for(int row = 0; row < randoms.length; row++) {
			for(int col = 0; col < randoms[0].length; col++) {
				System.out.print(randoms[row][col] + " ");
			}
			System.out.println();
		}
		Scanner scan = new Scanner(System.in);
		int[] arr = new int[4];
		for(int i = 0; i < 4; i++) {
			arr[i] = scan.nextInt();
		}
		for(int j = 0; j < arr.length; j++){
			arr[j] = arr[j] * arr[j+1];
			System.out.println(arr[j]);
		}
		
		
	}

	
	
}
