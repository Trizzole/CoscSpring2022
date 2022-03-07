
public class RationalClient {
	public static void main(String[] args) {
		Rational zero = new Rational(); // Testing default constructor; object represents 0/1
		Rational oneHalf = new Rational(1, 2); // Object to represent one half
		Rational fourSixths = new Rational(4, 6); // Object to represent four-sixths (this gives us a chance to test the
													// reduce method as well)

		// Test printRational()
		System.out.print("Here is the rational number 1/2:  ");
		oneHalf.printRational();

		// Test toString() and toDouble(); also tests that values are correct for the
		// objects
		System.out.println("This is zero: " + zero + " which is written as " + zero.toDouble());
		System.out.println("This is one half: " + oneHalf + " which is written as " + oneHalf.toDouble());

		// Test toString(),toDouble(), and reduce()
		System.out.println("This is four sixths: " + fourSixths + " which is written as " + fourSixths.toDouble()
				+ " and can be reduced to " + fourSixths.reduce());
		System.out.println();
		// Test add and multiply
		Rational sum = oneHalf.add(fourSixths); // sum contains 7/6
		Rational prod = oneHalf.multiply(fourSixths); // prod contains 1/3 (1/2 * 4/6 = 4/12 = 1/3)
		System.out.println("This is the sum of those two numbers (7/6): " + sum);
		System.out.println("This is the product of those two numbers (1/3): " + prod);
		System.out.println();
		// Test invert on sum
		sum.invert();
		System.out.println("Here is the sum inverted (6/7): " + sum);

		// Test negate on prod
		prod.negate();
		System.out.println("Here is the product negated (-1/3): " + prod);
	}
}
