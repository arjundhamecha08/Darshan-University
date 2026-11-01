class BankAccount{
    int accNo;
    double balance;
    static String bankName;
    static Double interestRate;

    static void setbname(String bName){
        bankName = bName;
    }

    static void setintrest(double ir){
        interestRate = ir;
    }
    void setaccno(int accno){
        accNo = accno;
    }
    void setbalance(double b){
        balance = b;
    }
    static String getbname(){
        return bankName;
    }
    static double getinterest(){
        return interestRate;
    }
    int getaccno(){
        return accNo;
    }
    double getbalance(){
        return balance;
    }

    void display(){
        System.out.println("Bank Name: "+bankName);
        System.out.println("Account No: "+accNo);
        System.out.println("Interest Rate: "+interestRate);
        System.out.println("Balance: "+balance);
    }
}
public class Lab_83 {
    public static void main(String[] args) {
        BankAccount b1 = new BankAccount();
        BankAccount b2 = new BankAccount();
        BankAccount b3 = new BankAccount();

        b1.setaccno(1234);
        b2.setaccno(5678);
        b3.setaccno(9101);

        BankAccount.setintrest(1000);
        BankAccount.setbname("D2DBank");

        b1.setbalance(1000);
        b2.setbalance(1000);
        b3.setbalance(1000);

        System.out.println("Bank Name: "+BankAccount.bankName);
        System.out.println("Interest Rate: "+BankAccount.interestRate);
        System.out.println("Object1 accno: "+b1.getaccno());
        System.out.println("Object2 accno: "+b2.getaccno());
        System.out.println("Object3 accno: "+b3.getaccno());

        System.out.println("Object1 balance: "+b1.balance);
        System.out.println("Object2 balance: "+b2.balance);
        System.out.println("Object3 balance: "+b3.balance);

        b1.display();;
        b2.display();;
        b3.display();
        
    }
}
