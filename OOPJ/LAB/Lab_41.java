import java.util.Scanner;

class Result {
    int OOPJ,WT,DS,DBMS,Python;
    Result(int OOPJ, int WT, int DS, int DBMS, int Python){
        this.OOPJ = OOPJ;
        this.WT = WT;
        this.DS = DS;
        this.DBMS = DBMS;
        this.Python = Python;
    }
    
   
    String DisplayResult(){
        float percentage = (OOPJ+WT+DBMS+DS+Python)/5;
        if(percentage>=60){
            return "First Division";
        }
        else if (percentage>50 && percentage<59) {
            return "Second Division";
        }
         else if (percentage>40 && percentage<49) {
            return "Third Division";
        }
        else{
            return "Fail";
        }
        
    }

    
}
public class Lab_41 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int OOPJ,WT,DS,DBMS,Python;

        System.out.print("Enter Marks For OOPJ: ");
        OOPJ = sc.nextInt();
        System.out.print("Enter Marks For WT: ");
        WT = sc.nextInt();
        System.out.print("Enter Marks For DS: ");
        DS = sc.nextInt();
        System.out.print("Enter Marks For DBMS: ");
        DBMS = sc.nextInt();
        System.out.print("Enter Marks For Python: ");
        Python = sc.nextInt();

        Result r = new Result(OOPJ, WT, DS, DBMS, Python);
        String Result = r.DisplayResult();
        System.out.println("Result: "+Result);

        sc.close();
    }   
}
