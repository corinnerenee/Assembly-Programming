import java.util.Scanner; 

public class Program02 {
    public static void main(String[] args) throws Exception {
    System.out.println("Enter a number: ");
    Scanner kb = new Scanner(System.in);
    int val = kb.nextInt();

    val *= val;
    System.out.println("The squared value is: " + val);

    }
}
