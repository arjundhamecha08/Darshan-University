import java.util.*;;
public class Lab_24_Scanner_class {
    public static void main(String[] args) {
        int a,b,c;
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter Number one: ");
        a = sc.nextInt();
        System.out.print("Enter Number Two: ");
        b = sc.nextInt();

        c = a+b;
        System.out.println("Addition of two Numbers: "+c);

        sc.close();
    }
}
