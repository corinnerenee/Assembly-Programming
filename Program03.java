public class Program03 {
    public static void main(String[] args) throws Exception {
    double pi = 3.14159;
    double fourPtZero = 4.0;
    double threePtZero = 3.0;
    double radius = 17.25;
    double surfaceArea = 0.0;
    double volume = 0.0;
    
    double rsquared = radius * radius;
    surfaceArea = (fourPtZero * pi) * (rsquared);
    double rcubed = rsquared * radius;
    volume = ((fourPtZero * pi)/threePtZero) * rcubed;

    System.out.println("Volume: " + volume);
    System.out.println("Surface Area" + surfaceArea);


    }

}