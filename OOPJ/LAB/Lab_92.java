import java.util.Scanner;

class Employee{

    double salary;
    void work(){
        System.out.println("Employee is Working...!");
    }

    void getSalary(){
        System.out.println("Salary : "+salary);
    }
}

class HRManager extends Employee{
    Scanner sc = new Scanner(System.in);

    @Override 
    void work(){
        System.out.println("HR Working....!");
    }
    void addEmployee(){
        System.out.println("Employee Added...");
    }
    void giveSalary(){
        System.out.println("Enter Salary: ");
        double salary = sc.nextDouble();
        this.salary = salary;
    }
}
public class Lab_92 {
    public static void main(String[] args) {
        HRManager hm = new HRManager();
        hm.work();
        hm.addEmployee();
        hm.giveSalary();
        hm.getSalary();
    }
}
