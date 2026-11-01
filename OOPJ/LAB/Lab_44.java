import java.util.Scanner;

public class Lab_44 {
    static String primeNumber(int num){
       int i = 2;
       int flag = 0;
       while(i<num){
        if(num%i == 0){
            flag = 1;
        }
        i++;
       }
       if (flag == 0) {
        return "Prime Number";
       }
       return "Not Prime Number";
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter Number: ");
        int num = sc.nextInt();

        System.out.print(primeNumber(num));
        sc.close();
    }
}
