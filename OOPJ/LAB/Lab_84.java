class Area{
    static final double PI=3.14159;
    
    double circleArea(int r){
        return PI*r*r;
    }
}

public class Lab_84 {
    public static void main(String[] args) {
        Area a = new  Area();
        System.out.println("Area of a circle: "+a.circleArea(10));
    }
}
