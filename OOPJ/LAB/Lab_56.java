import java.util.Scanner;
public class Lab_56 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Size: ");
        int size=sc.nextInt();
        for(int i=0;i<size;i++){
            for(int j = 0; j<size;j++){
                if(i==0 || i==size-1 || j == 0 || j==size-1){
                    System.out.print("* ");
                }
                else{
                    System.err.print("  ");
                }
            }
            System.out.println(" ");
        }
        sc.close();
    }
}
