/**
 *
 * @author (thomas)
 * @version (2/3/2022)
 */
public class Scribble {

    // instance variables - 
    private String letters;
    private int points;

    //constructs default Scribble
    public Scribble()
    {
        // Initializes instance variables
        this.letters = "A";
        this.points = 1;
    }
    
    //constructs any Scribble
    public Scribble(String letter, int point) {
        this.letters = letter;
        this.points = point; 
    }
    
    //gets letter from Scribble
    public String getLetter () {
        return this.letters;
    }
    
    //gets points from Scribble
    public int getPoint() {
        return this.points;
    }
    
    //sets new letter value for Scribble
    public void setLetter(String newLetter) {
        this.letters = newLetter;
    }
    
    //sets new point value for Scribble
    public void setPoint(int newPoint) {
        this.points = newPoint;
    }
    
    //toString method - returns the letter and its point value
    public String toString() {
        String firstPart = "Letter: " + this.letters + " Is worth: " + this.points + " points";
        return firstPart ;
    }
    
    //equals() method - checks if letters are equal and if points are equal
    public boolean equals(Scribble other) {
        return this.letters.equals(other.letters) && this.points == other.points;
    }

    //adds up points from two Scribbles
    public int sumValues(Scribble other) {
		int total = 0;
		total = this.points + other.points;
    	return total;
        
    }
    
    //adds together the chars from two Scribbles
    public String combineLetters(Scribble other) {
    	String both = "";
    	both = this.letters + other.letters;
    	return both;
    }
    
}