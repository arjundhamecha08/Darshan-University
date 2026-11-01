import java.util.Scanner;

public class Lab_52 {
     public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Size of an array: ");
        int size = sc.nextInt();
        int arr[] = new int[size];
        int ele,sum = 0;
        double avg=0;
        for(int i=0;i<size;i++){
            System.out.print("Enter "+(i+1)+" Element: ");
            ele = sc.nextInt();
            arr[i] = ele;
        }
        for(int i = 0;i<size;i++){
            sum += arr[i];
        }
        avg = sum/size;
        System.out.println("Average = "+avg);
        sc.close();
        
    }
}
