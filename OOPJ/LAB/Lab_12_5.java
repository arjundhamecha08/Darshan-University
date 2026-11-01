import java.util.Scanner;

class OutOfRangeException extends Exception {
    OutOfRangeException(String msg) {
        super(msg);
    }
}

public class Lab_12_5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a number: ");
        int n = sc.nextInt();

        try {
            if (n < 10 || n > 50) {
                throw new OutOfRangeException("Number is out of range!");
            }

            System.out.println("Square = " + (n * n));
        }
        catch (OutOfRangeException e) {
            System.out.println(e.getMessage());
        }

        sc.close();
    }
}