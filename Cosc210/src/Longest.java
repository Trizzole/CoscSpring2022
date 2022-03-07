import java.util.Scanner;
public class Longest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		
		boolean check = true;
		String longest = "";
		
		while(check == true) {
			String input = scan.next();
			if(input.equals("halt")) {
				check = false;
			}
		
			else if((input.length() > longest.length())) {
				longest = input;
			}
			
			
		}
		System.out.println(longest);
		
	}

}
