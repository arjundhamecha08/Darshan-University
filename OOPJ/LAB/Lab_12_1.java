
import java.util.Scanner;

public class Lab_12_1 {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    System.out.println("Enter Number: ");
    int a = sc.nextInt();
    System.out.println("Enter Number: ");
    int b = sc.nextInt();
    int[] arr = new int[5];
    try{
          System.out.println(a/b);
    }catch(ArithmeticException e){
        System.out.println(e.getMessage());
    }

    try {
        System.out.println(arr[a]);
    } catch (ArrayIndexOutOfBoundsException e) {
        System.out.println(e.getMessage());
    }

    sc.close();
  }
}
