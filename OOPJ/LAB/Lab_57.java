import java.util.Scanner;
public class Lab_57 {
    public static void main(String[] args) {
        int arr[] = {4,5,6,7,0,1,2};
        System.out.println("Enter Element That you want to search: ");
        Scanner sc = new Scanner(System.in);
        int ele = sc.nextInt();

        int left = 0;
        int right = 6;
        while(left <= right){
            int mid = (left+ right)/2;
            // System.out.println("mid = "+mid);
            if(arr[mid] == ele){
                System.out.println(mid);
                return;
            }

            if(arr[left] < arr[mid]){
                if(arr[left] <= ele && ele < arr[mid]){
                    right = mid - 1;
                }else{
                    left = mid + 1;
                }
            }else{
                if(arr[right] <= ele && ele > arr[mid]){
                    left = mid + 1;
                }else{
                    right = mid - 1;
                }
            }
        }
         System.out.println("-1");
         sc.close();
    }
}
