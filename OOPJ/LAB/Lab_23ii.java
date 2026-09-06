import java.util.*;
public class Lab_23ii {
    public static void main(String[] args) {
        String name,city;
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter Your Name: ");
        name = sc.nextLine();
        System.out.print("Enter Your City: ");
        city = sc.nextLine();

        System.out.println("Name: "+name);
        System.out.println("City: "+city);

        sc.close();
    }
}
