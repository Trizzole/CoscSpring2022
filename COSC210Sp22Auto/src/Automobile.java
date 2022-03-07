/**
 * 
 * @author thomas
 * @version (2/3/2022)
 */

public class Automobile {

	public static void main(String[] args) {

		
		 Automobile bobsCar = new Automobile();  
		 Automobile suesCar = new Automobile("GS",2007, 45, 50, 15000);
		 Automobile bobsNewCar = new Automobile("Luxury", 2022, 0);
		 Automobile suesNewCar = new Automobile("SUV",2022, 0 );
		 Automobile stansUsedCar = new Automobile("Truck", 2013, 25000);
		 

		Automobile stansTruck = new Automobile("Truck", 1999, 123000);
		Automobile suesSUV = new Automobile("SUV", 2015, 98, 30, 10000);

		System.out.print("Stan has a " + stansTruck.getModel());
		System.out.println(" and it is going " + stansTruck.getSpeed() + " miles per hour.");
		System.out.println();
		System.out.print("Sue has a " + suesSUV.getModel());
		System.out.println(" and it is going " + suesSUV.getSpeed() + " miles per hour.");
		System.out.println();
		
		System.out.println("Sue has a " + suesSUV.getModel());
		suesSUV.setModel("BIGSUV");
		System.out.println("Sue now has a " + suesSUV.getModel());
		//toString method
		System.out.println(suesSUV);
		
	}

	// Instance variables
	private String model; // SUV, sedan, etc
	private int year; // year when car was built
	private int fuelLevel; // percent
	private int speed; // how fast is car going
	private int mileage; // how many miles has car been driven

	// Constructor for objects of class Automobile
	public Automobile() {
		// initialize instance variables
		this.model = "";
		this.year = 1950;
		this.fuelLevel = 100;
		this.speed = 0;
		this.mileage = 0;

	}

	// Constructor #2
	public Automobile(String model, int year, int fuelLevel, int speed, int mileage) {
		this.model = model;
		this.year = year;
		this.fuelLevel = fuelLevel;
		this.speed = speed;
		this.mileage = mileage;
	}

	// Constructor #3
	public Automobile(String model, int year, int mileage) {
		this.model = model;
		this.year = year;
		this.mileage = mileage;
		this.fuelLevel = 100;
		this.speed = 0;

	}
	//Getter methods
	public String getModel() {
		return this.model;
	}

	public int getYear() {
		return this.year;
	}

	public int getfuelLevel() {
		return this.fuelLevel;
	}

	public int getSpeed() {
		return this.speed;
	}

	public int getMileage() {
		return this.mileage;
	}
	//Setter methods
	public void setModel(String model) {
		this.model = model;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public void setfuelLevel(int fuelLevel) {
		this.fuelLevel = fuelLevel;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String toString() {
		String firstPart = "Model: " + this.model + " Year: " + this.year + " fuel: " + this.fuelLevel + "%";
		String lastPart = " Speed: "  + this.speed + "MPH " + "Mileage: " + this.mileage;
		return firstPart + lastPart;
	
	}
	
	public boolean equals(Automobile other) {
		return this.model.equals(other.model) && this.year == other.year && this.fuelLevel == other.fuelLevel
				&& this.speed == other.speed && this.mileage == other.mileage;
	}
	public void accelerate(int amount) {
		this.speed += amount;
	}
	public void decreaseFuel(int amount) {
		this.fuelLevel -= amount;
	}
}
