abstract  class BankAccount{
    public abstract void deposit();
    public abstract void withdraw();
}

class SavingsAccount extends BankAccount{
    public void deposit(){
        System.out.println("deposit in saving");
    }
    public void withdraw(){
        System.out.println("withdraw in saving");
    }
}

class CurrentAccount extends BankAccount{
    public void deposit(){
        System.out.println("deposit in current");
    }
    public void withdraw(){
        System.out.println("withdraw in current");
    }
}

public class Lab_10_2 {
    public static void main(String[] args) {
        SavingsAccount s1 = new SavingsAccount();
        CurrentAccount c1 = new CurrentAccount();
        s1.deposit();
        s1.withdraw();
        c1.deposit();
        c1.withdraw();
    }
}
