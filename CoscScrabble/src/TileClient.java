/**
 * A test program for the Tile class
 *
 * @author thomas
 * @version (1)
 */
public class TileClient
{
    
    public static void main(String[] args)
    {
        //construct three Tile objects using both constructors
    	Scribble tile1 = new Scribble();
        Scribble tile2 = new Scribble("A",1);
        Scribble tile3 = new Scribble("Z",6);
        
        //Do tiles have correct values?
        System.out.println("Tile 1 should have letter A and value 1");
        System.out.println("Tile 1 - " + tile1);
        System.out.println();
        System.out.println("Tile 2 should have letter A and value 1");
        System.out.println("Tile 2 - " + tile2);
        System.out.println();
        System.out.println("Tile 3 should have letter Z and value 6");
        System.out.println("Tile 3 - " + tile3);
        System.out.println();
        //Do first two tiles have same letter and value?
        System.out.print("Comparing tiles 1 and 2; ");
        System.out.println("next line should say that tiles are equal");
        if (tile1.equals(tile2)) {
            System.out.println("Tiles are equal");
        } else {
            System.out.println("Tiles are not equal");
        }
        System.out.println();
        
        //Do second and third tiles have different values?
        System.out.println("Comparing Tiles 2 and 3; ");
        System.out.println("next line should say that tiles are not equal");
        if (tile2.equals(tile3)) {
            System.out.println("Tiles are equal");
        } else {
            System.out.println("Tiles are not equal");
        }
        System.out.println();
        
        //Change value of Tile 1 and letter of Tile 2
        System.out.println("Change value of Tile 1 to 5");
        tile1.setPoint(5);
        System.out.println("Change letter of Tile 2 to G");
        tile2.setLetter("G");
        System.out.println();
        
        System.out.println("Tile 1 should have letter A and value 5");
        System.out.println("Tile 1 - " + tile1);
        System.out.println();
        System.out.println("Tile 2 should have letter G and value 1");
        System.out.println("Tile 2 - " + tile2);
        System.out.println();
        
        //Test combining letters and values
        System.out.println("Combining Tile 1 and 2 (AG and 6)");
        System.out.print("Combining results in a letter combo of ");
        System.out.print(tile1.combineLetters(tile2) + " and a value of ");
        System.out.println(tile1.sumValues(tile2));
        
        //Second test
        //Test combining letters and values
        System.out.println("Combining Tile 2 and 3 (GZ and 7)");
        System.out.print("Combining results in a letter combo of ");
        System.out.print(tile2.combineLetters(tile3) + " and a value of ");
        System.out.println(tile2.sumValues(tile3));        
    }
}