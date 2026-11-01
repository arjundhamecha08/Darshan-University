import java.util.Scanner;

class Complex{
    int real;
    int imaginary;
    
    Complex(){
        System.out.println(0 + "+" + 0+"i");
    }
    Complex(int real, int imaginary){
        this.real = real;
        this.imaginary = imaginary;
    }
}
public class Lab_74 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter Real Number for Complex1: ");
        int real1 = sc.nextInt();
        System.out.println("Enter imaginary Number for Complex1: ");
        int imaginary1 = sc.nextInt();
         System.out.println("Enter Real Number for Complex2: ");
        int real2 = sc.nextInt();
        System.out.println("Enter imaginary Number for Complex2: ");
        int imaginary2 = sc.nextInt();
        if ((real1 == 0 && imaginary1 == 0)&&(real2 == 0 && imaginary2 == 0)) {
            Complex complex = new Complex();
            return;
        }
        Complex c1 = new Complex(real1,imaginary1);
        Complex c2 = new Complex(real2,imaginary2);

        System.out.println((c1.real+c2.real)+"+"+(c1.imaginary+c2.imaginary)+"i");

        sc.close();
    }

}
