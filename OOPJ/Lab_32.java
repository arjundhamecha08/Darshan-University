/**
 * Lab_32
 */
import java.util.*;
public class Lab_32 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Scanner sc1 = new Scanner(System.in);

        


        String op = " ";

        while (!op.equals("exit")) {

            System.out.println("Enter operation: ");
            op = sc1.next();
            System.out.println("Enter number 1: ");
            int num1 = sc.nextInt();
            System.out.println("Enter number 2: ");
            int num2 = sc.nextInt();
            
            switch (op) {
                case "+":
                    System.out.println("Addition: "+(num1+num2));
                    break;
                case "-":
                    System.out.println("Substraction: "+(num1 - num2));
                    break;
                case "*":
                    System.out.println("Multiplication: "+(num1 * num2));
                    break;
                case "/":
                    System.out.println("Division: "+(num1 / num2));
                    break;
                case "%":
                    System.out.println("Reminder: "+(num1 % num2));
                    break;
                case "exit":
                    System.out.println("Exit.");;
                default:
                    break;
                }
            }
        
        sc.close();
        sc1.close();
    }
    
}