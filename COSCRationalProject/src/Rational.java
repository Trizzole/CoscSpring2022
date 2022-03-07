/**
 *
 * @author (thomas)
 * @version (2/13/2022)
 */

public class Rational {

	// instance variables -
	private int numerator;
	private int denominator;

	// Creates default rational class
	public Rational() {
		// Initializes instance variables
		this.numerator = 0;
		this.denominator = 1;
	}

	// constructs any Rational
	public Rational(int num, int denom) {
		this.numerator = num;
		this.denominator = denom;
	}

	// constructs printRational function to display it
	public void printRational() {
		System.out.println(this.numerator + " / " + this.denominator);
	}

	// toString method - returns numerator and denominator
	public String toString() {
		String fraction = "Numerator: " + this.numerator + " Denominator: " + this.denominator;
		return fraction;
	}

	// Negate method that switches the signs
	public void negate() {
		this.numerator = this.numerator * -1;
	}

	// Invert method that switches numerator and denominator
	int swap = 0;

	public void invert() {
		swap = this.numerator;
		this.numerator = this.denominator;
		this.denominator = swap;
	}

	// toDouble method that creates a double from the rational
	public double toDouble() {
		double buble = (1.0 * this.numerator) / this.denominator;
		return buble;
	}

	// Creates a reduce method that returns a rational in simplest form
	public Rational reduce() {
		int num = this.numerator;
		int denom = this.denominator;
		int t = 0;
		// Euclidean algorithm
		while (denom != 0) {

			t = denom;
			denom = num % denom;
			num = t;

		}
		int gcd = num;

		Rational result = new Rational(this.numerator / gcd, this.denominator / gcd);
		return result;
	}

	// Creates a add method that returns a rational in reduced form
	public Rational add(Rational that) {
		int newnum = (this.numerator * that.denominator) + (that.numerator * this.denominator);
		int newdenom = this.denominator * that.denominator;
		Rational result = new Rational(newnum, newdenom);
		result = result.reduce();
		return result;
	}

	// Creates a multiply method that returns a rational in reduced form
	public Rational multiply(Rational that) {
		int newnum = this.numerator * that.numerator;
		int newdenom = this.denominator * that.denominator;
		Rational result = new Rational(newnum, newdenom);
		result = result.reduce();
		return result;
	}

}
