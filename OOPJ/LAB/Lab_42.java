import java.util.*;;
public class Lab_42 {
    static String oddEven(int num){
        if (num ==0){
            return "Zero";
        }
        else if(num%2 == 0){
            return "Even";
        }
        else{
            return "Odd";
        }
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Number: ");
        int num = sc.nextInt();
        System.out.println(oddEven(num));
        sc.close();
    }
}
