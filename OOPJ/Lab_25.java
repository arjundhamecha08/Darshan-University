import java.util.*;
public class Lab_25 {
    public static void main(String[] args) {
        int meter;
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Meter: ");
        meter = sc.nextInt();
        System.out.println("Meters into feet: "+meter*3.28);

        sc.close();
    }
}
