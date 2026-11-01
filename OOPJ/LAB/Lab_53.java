import java.util.Scanner;
public class Lab_53 {
    public static void main(String[] args) {
        Scanner sc =new Scanner(System.in);
        System.out.println("Enter size of an Array: ");
        int size = sc.nextInt();
        int arr[] = new int[size];
        int ele;
        for(int i=0;i<size;i++){
            System.out.print("Enter "+(i+1)+" Element: ");
            ele = sc.nextInt();
            arr[i] = ele;
        }
        for(int i = size-1;i>=0;i--){
            System.out.println(arr[i]);
        }
        sc.close();


    }
}
