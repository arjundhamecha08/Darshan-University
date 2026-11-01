import java.util.*;
public class Lab_46 {
    static String isPalindroma(int num){
        int temp = num;
        int revrse=0,rem;
        while(temp>0){
            rem = temp%10;
            revrse = (revrse+rem)*10;
            temp /= 10;
        }
        revrse /= 10;
        if(num == revrse){
            return "Palindroma";
        }
        return "Not Palindroma";
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Number: ");
        int num = sc.nextInt();
        System.out.println(isPalindroma(num));
        sc.close();
    }
}
