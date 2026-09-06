import java.util.Scanner;

class D2DBank {

    public StringBuffer Uname;
    private StringBuffer Password;

    public long accountNo;
    private double Bal;

    public static String bName = "D2DBank";


    // Constructor for Guest account
    D2DBank(StringBuffer Uname, StringBuffer Password, double Bal) {
        this.Uname = Uname;
        this.Password = Password;
        if(Bal<3000){
            System.out.println("Balance must equal or more than 3000");
        }else{
            this.Bal += Bal; 
        }
    }




    // Display balance
    public void dispBalance() {

        System.out.println("Current Balance: ₹" + Bal);
    }


    // Deposit
    public void depositeAmt(double Amt) {

        if (Amt <= 0) {
            System.out.println("Invalid amount!");
            return;
        }

        Bal += Amt;

        System.out.println(
                "Amount Deposited Successfully!"
        );

        System.out.println("Final Balance: ₹" + Bal);
    }


    // Withdraw
    public void withdrawAmt(double Amt) {

        if (Amt <= 0) {
            System.out.println("Invalid amount!");
            return;
        }

        if ((Bal - Amt) < 3000) {

            System.out.println(
                    "You can't withdraw ₹" + Amt +
                    " because minimum balance must be ₹3000."
            );

        } else {

            Bal -= Amt;

            System.out.println(
                    "Amount Withdrawn Successfully!"
            );

            System.out.println(
                    "Final Balance: ₹" + Bal
            );
        }
    }
}


public class Main{

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);


        System.out.println("Welcome To: "+D2DBank.bName);
        System.out.print("Enter User name: ");
        String Uname = sc.nextLine();
        System.out.print("Enter Password: ");
        String Password = sc.next();
        System.out.print("Enter Balance: ");
        double bal = sc.nextDouble();

        D2DBank bank = new D2DBank(new StringBuffer(Uname), new StringBuffer(Password), bal);

        int choice = 0;        
        double amount;
        while(choice != 4){
            System.out.println("");
            System.out.println("Enter choice: ");
            System.out.println("1: Display Balance");
            System.out.println("2: Deposite Amout");
            System.out.println("3: Withdraw Amount");
            System.out.print("4: Exit: ");

            choice = sc.nextInt();
            switch (choice) {
                case 1:
                    bank.dispBalance();
                    break;

                case 2:
                    System.out.print("Enter Amount: ");
                    amount = sc.nextDouble();
                    bank.depositeAmt(amount);
                    break;
                
                case 3:
                    System.out.print("Enter Amount: ");
                    amount = sc.nextDouble();
                    bank.withdrawAmt(amount);
                    break;

                default:
                    System.out.println("Thank You From D2DBank...!");
                    break;
            }
        }
        sc.close();
        System.exit(0);
    }
}