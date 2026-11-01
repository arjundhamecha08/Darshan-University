
import java.util.Scanner;

class Thread1 extends Thread {
    int[][] metrix;

    public Thread1(int[][] metrix) {
        this.metrix = metrix;
    }

    public void run() {
        for (int i = 0; i < 5; i++) {

        }
    }
}

public class Lab_13_6 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println("Enter M Number of rows: ");
        int m = sc.nextInt();
        System.out.println("Enter N Number of Columns: ");
        int n = sc.nextInt();
        int matrix[][] = new int[m][n];

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                System.out.println("Enter Element At " + i + " Row " + j + " Column: ");
                matrix[i][j] = sc.nextInt();
            }
        }
        Thread1 t1[] = new Thread1[m];
    }
}
