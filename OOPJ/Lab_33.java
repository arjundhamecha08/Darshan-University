import java.util.*;
public class Lab_33 {
    public static void main(String[] args) {
        int l,b;
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Length of the rectangle: ");
        l = sc.nextInt();
        System.out.print("Enter Bridth of the rectangle: ");
        b = sc.nextInt();

        System.out.print("Area Of Rectangle is: "+(l*b));

        sc.close();
    }
}
