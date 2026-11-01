
import java.util.Scanner;


class BankException extends Exception {

    public BankException(String msg) {
        super(msg);
    }
}

class Account {

    public static final double minBalance = 3000;
    private double balance;

    void withdraw(double amount)throws BankException {
        if (balance-amount < minBalance) {
            throw new BankException("Insuffiecient Balance After WithDraw");
        }
        else{
            balance -= amount;
            System.out.println("Withdraw Successfully");
        }
    }

    void deposite(double balance) {
        this.balance += balance;
        System.out.println("Deposite Successfully");
    }

}

public class Lab_12_2 {
    public static void main(String[] args) throws BankException{
        Account ac = new Account();
        Scanner sc = new Scanner(System.in);
        double amount;
        System.out.print("Enter Amount For Deposite: ");
        amount = sc.nextDouble(); 
        ac.deposite(amount);
        System.out.print("Enter Amount For the withdraw");
        amount =  sc.nextDouble();
        ac.withdraw(amount);

        
    }
}
