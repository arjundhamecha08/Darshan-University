import java.util.*;
public class Lab_35 {
    public static void main(String[] args) {
        int num1,num2,num3;
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Number 1: ");
        num1 = sc.nextInt();
        System.out.print("Enter Number 2: ");
        num2 = sc.nextInt();
        System.out.print("Enter Number 3: ");
        num3 = sc.nextInt();

        if(num1>num2 && num1>num3){
            System.out.print("Maximum Number is: "+num1);
        }
        else if(num2>num1 && num2>num3){
            System.out.print("Maximum Number is: "+num2);
        }
        else{
            System.out.print("Maximum Number is: "+num3);
        }

        sc.close();
    }
}
