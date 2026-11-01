
import java.util.Scanner;

// Custom Exception 1
class InvalidAmountException extends Exception {
    public InvalidAmountException(String msg) {
        super(msg);
    }
}

// Custom Exception 2
class InsufficientBalanceException extends Exception {
    public InsufficientBalanceException(String msg) {
        super(msg);
    }
}

// Custom Exception 3
class MinimumBalanceException extends Exception {
    public MinimumBalanceException(String msg) {
        super(msg);
    }
}

// Parent Class
class D2DBank {

    private String username;
    private String password;
    private final long accountNo;

    protected double balance;

    public static final double MIN_BALANCE = 3000;
    public static String bankName = "D2DBank";

    private static long nextAccountNo = 100001;

    // Parameterized Constructor
    public D2DBank(String username, String password, double balance)
            throws MinimumBalanceException {

        if (balance < MIN_BALANCE) {
            throw new MinimumBalanceException(
                "Opening balance must be at least Rs. " + MIN_BALANCE
            );
        }

        this.username = username;
        this.password = password;
        this.balance = balance;
        this.accountNo = nextAccountNo++;
    }

    // Constructor Overloading
    public D2DBank(String username, String password)
            throws MinimumBalanceException {

        this(username, password, MIN_BALANCE);
    }

    // Getter Methods
    public String getUsername() {
        return username;
    }

    public long getAccountNo() {
        return accountNo;
    }

    public double getBalance() {
        return balance;
    }

    // Login Authentication
    public boolean login(String username, String password) {
        return this.username.equals(username)
                && this.password.equals(password);
    }

    // Deposit Amount
    public void depositAmt(double amount)
            throws InvalidAmountException {

        if (amount <= 0) {
            throw new InvalidAmountException(
                "Deposit amount must be greater than zero."
            );
        }

        balance += amount;

        System.out.println("Amount Deposited Successfully!");
        System.out.printf("Updated Balance: Rs. %.2f%n", balance);
    }

    // Withdrawal Method
    public void withdrawAmt(double amount)
            throws InvalidAmountException,
                   InsufficientBalanceException,
                   MinimumBalanceException {

        if (amount <= 0) {
            throw new InvalidAmountException(
                "Withdrawal amount must be greater than zero."
            );
        }

        if (amount > balance) {
            throw new InsufficientBalanceException(
                "Insufficient Account Balance!"
            );
        }

        balance -= amount;

        System.out.println("Amount Withdrawn Successfully!");
        System.out.printf("Updated Balance: Rs. %.2f%n", balance);
    }

    // Display Account Details
    public void displayDetails() {

        System.out.println("\n------ ACCOUNT DETAILS ------");
        System.out.println("Bank Name   : " + bankName);
        System.out.println("Account No. : " + accountNo);
        System.out.println("Username    : " + username);
        System.out.printf("Balance     : Rs. %.2f%n", balance);
        System.out.println("-----------------------------");
    }

    // Display Balance
    public void displayBalance() {
        System.out.printf("Current Balance: Rs. %.2f%n", balance);
    }
}

// Child Class
class SavingsAccount extends D2DBank {

    // Constructor
    public SavingsAccount(String username, String password, double balance)
            throws MinimumBalanceException {

        super(username, password, balance);
    }

    // Constructor Overloading
    public SavingsAccount(String username, String password)
            throws MinimumBalanceException {

        super(username, password);
    }

    // Method Overriding
    @Override
    public void withdrawAmt(double amount)
            throws InvalidAmountException,
                   InsufficientBalanceException,
                   MinimumBalanceException {

        if (amount <= 0) {
            throw new InvalidAmountException(
                "Withdrawal amount must be greater than zero."
            );
        }

        if (amount > balance) {
            throw new InsufficientBalanceException(
                "Insufficient Account Balance!"
            );
        }

        if (balance - amount < MIN_BALANCE) {
            throw new MinimumBalanceException(
                "Minimum balance of Rs. " + MIN_BALANCE
                + " must be maintained."
            );
        }

        // Calling Parent Class Method
        super.withdrawAmt(amount);
    }
}

// Main Class
public class Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("================================");
        System.out.println("      WELCOME TO D2DBANK");
        System.out.println("================================");

        D2DBank bank = null;

        // Account Creation
        try {

            System.out.print("Enter Username: ");
            String username = sc.nextLine();

            System.out.print("Create Password: ");
            String password = sc.nextLine();

            System.out.print("Enter Opening Balance: Rs. ");
            double openingBalance = sc.nextDouble();

            // Runtime Polymorphism
            bank = new SavingsAccount(
                username, password, openingBalance
            );

            System.out.println("\nAccount Created Successfully!");
            System.out.println(
                "Your Account Number: " + bank.getAccountNo()
            );

        } catch (MinimumBalanceException e) {

            System.out.println(
                "Account Creation Failed: " + e.getMessage()
            );

            sc.close();
            return;

        } catch (java.util.InputMismatchException e) {

            System.out.println("Please enter a valid balance.");
            sc.close();
            return;
        }

        sc.nextLine();

        // Login Authentication
        System.out.println("\n---------- LOGIN ----------");

        System.out.print("Enter Username: ");
        String loginUser = sc.nextLine();

        System.out.print("Enter Password: ");
        String loginPassword = sc.nextLine();

        if (!bank.login(loginUser, loginPassword)) {

            System.out.println("Invalid Username or Password!");

            sc.close();
            return;
        }

        System.out.println("\nLogin Successful!");

        int choice = 0;

        // Banking Menu
        do {

            System.out.println("\n========== D2DBANK MENU ==========");
            System.out.println("1. Display Account Details");
            System.out.println("2. Display Balance");
            System.out.println("3. Deposit Amount");
            System.out.println("4. Withdraw Amount");
            System.out.println("5. Exit");

            System.out.print("Enter Your Choice: ");

            if (!sc.hasNextInt()) {

                System.out.println("Please Enter a Valid Choice!");
                sc.next();
                continue;
            }

            choice = sc.nextInt();

            try {

                switch (choice) {

                    case 1:
                        bank.displayDetails();
                        break;

                    case 2:
                        bank.displayBalance();
                        break;

                    case 3:

                        System.out.print("Enter Deposit Amount: Rs. ");
                        double deposit = sc.nextDouble();

                        bank.depositAmt(deposit);
                        break;

                    case 4:

                        System.out.print("Enter Withdrawal Amount: Rs. ");
                        double withdrawal = sc.nextDouble();

                        bank.withdrawAmt(withdrawal);
                        break;

                    case 5:

                        System.out.println(
                            "Thank You For Using D2DBank!"
                        );
                        break;

                    default:

                        System.out.println("Invalid Choice! Try Again.");
                }

            } catch (InvalidAmountException |
                     InsufficientBalanceException |
                     MinimumBalanceException e) {

                System.out.println(
                    "Transaction Failed: " + e.getMessage()
                );

            } catch (java.util.InputMismatchException e) {

                System.out.println("Please Enter a Valid Amount!");
                sc.nextLine();
            }

        } while (choice != 5);

        sc.close();
    }
}
