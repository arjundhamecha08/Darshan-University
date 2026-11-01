import java.util.*;
public class Lab_43 {
    static int max(int a, int b, int c){
        int max= a>b?(a>c?a:c):(b>a?(b>c?b:c):c);
            return max;
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter Three Numbers: ");
        int a = sc.nextInt();
        int b = sc.nextInt();
        int c = sc.nextInt();
        System.out.print("Maximum Number is: "+max(a, b, c));
        sc.close();
    }
}
