import java.util.Scanner;

class Student{

    Scanner sc = new Scanner(System.in);

    int id_no;
    int no_of_subjects;
    String subject_code[];
    int subject_credits[];
    String grade_obtained[];
    double spi;
    double total_credits,obtain_credits;
    Student(int id,int n){
        this.id_no = id;
        this.no_of_subjects = n;
        this.subject_code = new String[n];
        this.subject_credits= new int [n];
        this.grade_obtained= new String[n];
    }
    void setSubjects(){
        for(int i=0;i<no_of_subjects;i++){
            System.out.print("Enter Subject code:");
            subject_code[i] = sc.next();

            System.out.print("Enter Subject credit:");
            subject_credits[i] = sc.nextInt();

            System.out.print("Enter Subject Grade:");
            grade_obtained[i] = sc.next();
        }
    }

    void calc_spi(){
        for(int i=0;i<no_of_subjects;i++){

            switch (grade_obtained[i]) {
                case "A":
                    obtain_credits += subject_credits[i]*10;
                    break;
                
                case "B":
                    obtain_credits += subject_credits[i]*9;
                    break;

                case "C":
                    obtain_credits += subject_credits[i]*8;
                    break;

                case "D":
                    obtain_credits += subject_credits[i]*7;
                    break;

                case "F":
                    obtain_credits += 0;
                    break;
                
                default:
                    break;
            }
            total_credits += subject_credits[i];
        }
        spi = obtain_credits/total_credits;
        System.out.println("SPI: "+spi);
    }
}

public class Lab_91{
    public static void main(String[] args) {
        Student s[] = new Student[5];
        for(int i=0;i<5;i++){
            s[i] = new Student(101+i, 5);
            s[i].setSubjects();
            s[i].calc_spi();
        }
    }
}