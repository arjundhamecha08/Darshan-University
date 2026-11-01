import java.util.Scanner;

public class Lab_12_4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        try {
            System.out.print("Enter Num1: ");
            int num1 = Integer.parseInt(sc.next());

            System.out.print("Enter Num2: ");
            int num2 = Integer.parseInt(sc.next());

            int result = num1 / num2;
            System.out.println("Result = " + result);
        }
        catch (NumberFormatException e) {
            System.out.println("Error: Please enter integers only.");
        }
        catch (ArithmeticException e) {
            System.out.println("Error: Cannot divide by zero.");
        }

        sc.close();
    }
}