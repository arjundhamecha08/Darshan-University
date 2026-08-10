import java.util.*;
public class Lab_34 {
    public static void main(String[] args) {
        int Ferh,celcius;

        Scanner sc = new Scanner(System.in);
        System.out.println("Enter Fehrenhit: ");
        Ferh = sc.nextInt();
        celcius = (Ferh-32)*5/9;

        System.out.println("Temprature in Celcius: "+celcius);

        System.out.println("Enter Celcius: ");
        celcius = sc.nextInt();
        Ferh =(celcius*9/5)+32;

        System.out.println("Temprature in Fehrenhit: "+Ferh);
        sc.close();
    }
}
