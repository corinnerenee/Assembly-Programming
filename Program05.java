import java.util.Stack;

public class Program05 {
    public static void main(String[] args) throws Exception {
    int myArray [] = {1,  3,  5,  7,  9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59,};
    Stack <Integer> stack = new Stack<Integer>();

    for (int num : myArray){
       stack.push(num);
    }

    for (int num : myArray){
        stack.pop();
    }
}
}
