import java.util.Scanner;
class Circle{
    double r;
    Circle(double r){
        this.r = r;
    }
    double area(){
        return Math.PI*r*r;
    }
}

public class Lab_71 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Circle Radius: ");
        double r = sc.nextDouble();

        Circle c = new Circle(r);
        System.out.println("Area of the Circle is: "+c.area());
        sc.close();
    }
}
