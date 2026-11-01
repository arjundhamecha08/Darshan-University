
import java.util.Scanner;

class AgeException extends Exception{
    public AgeException(String msg){
        super(msg);
    }
}
class Voting{
    void AgeValidate(int age) throws AgeException{
        if(age<18){
            throw new AgeException("Age must be 18 for the voting...!");
        }
        else{
            System.out.println("You are Eligible For Vote...!");
        }
    }
}
public class Lab_12_3 {
    public static void main(String[] args) throws AgeException{
        Scanner sc = new Scanner(System.in);
        Voting v = new Voting();
        System.out.println("Enter Your Age: ");
        int age = sc.nextInt();
        v.AgeValidate(age);
    }    
}
