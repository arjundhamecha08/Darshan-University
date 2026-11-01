import java.io.*;
import java.util.Scanner;

class Student {
    int roll;
    String name;
    int marks;

    void getData(Scanner sc) {
        System.out.print("Enter Roll No: ");
        roll = sc.nextInt();
        sc.nextLine();

        System.out.print("Enter Name: ");
        name = sc.nextLine();

        System.out.print("Enter Marks: ");
        marks = sc.nextInt();
    }

    void display() {
        System.out.println("Roll No: " + roll);
        System.out.println("Name: " + name);
        System.out.println("Marks: " + marks);
    }
}

class Lab_14_4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        try {
            Student s = new Student();

            System.out.println("Enter Student Information:");
            s.getData(sc);

            FileOutputStream fout =
                new FileOutputStream("student.txt");

            String data = s.roll + "\n" + s.name + "\n" + s.marks + "\n";
            fout.write(data.getBytes());
            fout.close();

            System.out.println("\nStudent data saved successfully.");

            FileInputStream fin =
                new FileInputStream("student.txt");

            int ch;
            System.out.println("\nStudent Information from File:");

            while ((ch = fin.read()) != -1) {
                System.out.print((char) ch);
            }

            fin.close();
        }
        catch (IOException e) {
            System.out.println("File Error: " + e.getMessage());
        }

        sc.close();
    }
}