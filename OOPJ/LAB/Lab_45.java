import java.util.*;
public class Lab_45 {
    static String isLeapYear(int year){
        if(year%4 == 0){
            return "Leap Year";
        }
        return "Not Leap Year";
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Year: ");
        int year = sc.nextInt();
        System.out.println(isLeapYear(year));
        sc.close();
    }
}
