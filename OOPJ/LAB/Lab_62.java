import java.util.Scanner;

class Cube{
    double height,width,depth;

    void setter(double height,double width,double depth){
        this.height = height;
        this.width = width;
        this.depth = depth;
    }
    void getter(){
        System.out.println("Height: "+height);
        System.out.println("Width: "+width);
        System.out.println("Depth: "+depth);
    }
    void volme(){
        System.out.println( "Volume of cube: "+(height*width*depth));
    }
}

public class Lab_62 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Height: ");
        double height = sc.nextDouble(); 
        System.out.print("Enter Width: ");
        double width = sc.nextDouble();
        System.out.print("Enter Height: ");
        double depth = sc.nextDouble();

        Cube c = new Cube();
        c.setter(height, width, depth);
        c.getter();
        c.volme();

        sc.close();
    }
}
