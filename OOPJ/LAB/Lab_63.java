
class Account {
    int accNum;
    String accType;
    double Balance;

    public void setter(int accNum, String accType, double Balance) {
        this.accNum = accNum;
        this.accType = accType;
        this.Balance = Balance;
    }

    void getter() {
        System.out.println("Account Number: " + accNum);
        System.out.println("Account Type: " + accType);
        System.out.println("Balance: " + Balance);
        System.out.println(" ");
    }
}

public class Lab_63 {
    public static void main(String[] args) {

        Account a1 = new Account();
        Account a2 = new Account();
        Account a3 = new Account();

        a1.setter(123456, "Saving", 10000);
        a2.setter(102030, "Saving", 20000);
        a3.setter(506070, "Saving", 30000);

        a1.getter();
        a2.getter();;
        a3.getter();

    }
}