import java.util.Scanner;

class Employee {
    String Name;
    String Job_title;
    double Salary;

    Employee(String Name, String Job_title, double Salary) {
        this.Name = Name;
        this.Job_title = Job_title;
        this.Salary = Salary;
    }

    double cal_salary() {
        return Salary * 12;
    }

    void updateSalary(double Salary) {
        this.Salary = Salary;
    }
}

public class Lab_65 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter Your Name: ");
        String name = sc.next();
        System.out.print("Enter Your Job Title: ");
        String Job_title = sc.next();
        System.out.print("Enter Your Salary: ");
        double salary = sc.nextDouble();


        Employee emp = new Employee(name, Job_title, salary);
        System.out.println("Yearly Salary: "+emp.cal_salary());

        System.out.print("Enter your Updated Salary: ");
        double up_salary = sc.nextDouble();
        emp.updateSalary(up_salary);
        System.out.println("Yearly Salary After Update: "+emp.cal_salary());
    }
}