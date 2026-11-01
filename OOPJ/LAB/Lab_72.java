import java.util.Scanner;

class TimeAngle{
    int Hour;
    int Minitue;
    TimeAngle(int Hour, int Minitue){
        this.Hour = Hour;
        this.Minitue = Minitue;
    }
    Double findAngle(){
        if (Hour == 12) {
            Hour = 0;
        }
       Double Hour = this.Hour * 30 + Minitue * 0.5;
       Double Minitue = this.Minitue * 6.0;
       Double angle = Math.abs(Hour - Minitue);
       if (angle>180) {
        angle = 360-angle;
       }
       return angle;
    }
}

public class Lab_72 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter Hour: ");
        int hour = sc.nextInt();
        System.out.println("Enter Minitues: ");
        int minitues = sc.nextInt();
        TimeAngle ta = new TimeAngle(hour, minitues);
        System.out.println("Angle between Hour and Minitues: "+ta.findAngle());
        sc.close();
    }
}
