import java.util.Scanner;

class Student{
    String name;
    int roll_no;
    double spi;
    String course;

    void setter(String name,int roll_no,double spi,String course){
        this.name = name;
        this.roll_no = roll_no;
        this.spi = spi;
        this.course = course;
    }
    void getter(){
        System.out.println("\nStudent Details: ");
        System.out.println("Name: "+name);
        System.out.println("Roll_no: "+roll_no);
        System.out.println("SPI: "+spi);
        System.out.println("Course: "+course);
    }
}
public class Lab_61 {    
    public static void main(String[] args) {
        Student student = new Student();
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Name: ");
        String name = sc.next();
         System.out.print("Enter Roll_no: ");
        int roll_no = sc.nextInt();
         System.out.print("Enter SPI: ");
        double spi = sc.nextDouble();
         System.out.print("Enter Course: ");
        String course = sc.next();

        student.setter(name, roll_no, spi, course);
        student.getter();

        sc.close();
    }
}
