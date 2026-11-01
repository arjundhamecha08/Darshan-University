import java.util.Scanner;

class A {
    int arr[];
    int sum;

    A(int arr[]) {
        this.arr = arr;
    }

    void sortArray() {
        for (int i = 0; i < arr.length - 1; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] > arr[j]) {
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
        }
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + "\n");
        }
        System.out.println();
    }

    boolean searchArray(int x) {
        for (int i = 0; i < arr.length; i++) {
            if (x == arr[i]) {
                return true;
            }
        }
        return false;
    }

    int sumArray() {
        for (int i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        return sum;
    }

    int avgArray() {
        return sumArray() / arr.length;
    }
}

public class Lab_64 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Size of an Array: ");
        int size = sc.nextInt();
        int[] arr = new int[size];

        for(int i=0;i<size;i++){
            System.out.print("Enter Element No."+(i+1)+": ");
            int ele = sc.nextInt();
            arr[i] = ele;
        }
        A a = new A(arr);
        int choice;
        while (true) {
            System.out.println("Enter choice: ");
            System.out.println("1 Sum Array:  ");
            System.out.println("2 Average Array: ");
            System.out.println("3 Sort Array: ");
            System.out.println("4 Search Array: ");
            System.out.print("5 exit: ");
            choice = sc.nextInt();
            switch (choice) {
                case 1:
                    System.out.println("Sum of an Array: " + a.sumArray()+"\n");
                    break;
                case 2:
                    System.out.println("Average of an array: " + a.avgArray()+"\n");
                    break;
                case 3:
                    a.sortArray();
                    break;
                case 4:
                    System.out.print("Enter element that you want to search: \n");
                    int ele = sc.nextInt();
                    if (a.searchArray(ele)) {
                        System.out.println("Element found...!"+"\n");
                    } else {
                        System.out.println("Element Not found..!"+"\n");
                    }
                    break;
                case 5:
                    System.exit(0);
                default:
                    break;
            }
        }

    }
}
