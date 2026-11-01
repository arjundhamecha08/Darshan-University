import java.util.Scanner;
public class Lab_54 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter size of an Array: ");
        int size = sc.nextInt();
        int arr1[] = new int[size];
        int arr2[] = new int[size];
        int ele = 0;
        for(int i = 0;i<size;i++){
            System.out.print("Enter "+(i+1)+" Element: ");
            ele = sc.nextInt();
            arr1[i] = ele;
        }
        for(int i = 0;i<size;i++){
            arr2[i] = arr1[i];
        }
        for(int i = 0;i<size;i++){
            System.out.println("1st Array: "+arr1[i]+" 2nd Array: "+arr2[i]);
        }
        sc.close();
    }
}
