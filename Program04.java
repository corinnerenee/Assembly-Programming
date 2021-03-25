import java.util.Arrays;
public class Program04 {
    public static void main(String[] args) throws Exception {

    int [] myArray = { 1,  3,  5,  7,  9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59  };
    int sum = 0;

    for(int num : myArray){ // for int num : myArray
        sum = sum + num;
    }

    int average = (sum / myArray.length);
    System.out.println("Average is " + average);
    System.out.println("Sum is " + sum);
    }
    
}
