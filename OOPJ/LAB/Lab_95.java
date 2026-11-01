
class MyPoint {
    private double x;
    private double y;

    // No-argument constructor
    MyPoint() {
        x = 0;
        y = 0;
    }

    // Parameterized constructor
    MyPoint(double x, double y) {
        this.x = x;
        this.y = y;
    }

    // Getter methods
    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    // Distance between two MyPoint objects
    public double distance(MyPoint p) {
        return Math.sqrt(
            Math.pow(p.x - x, 2) +
            Math.pow(p.y - y, 2)
        );
    }

    // Distance using specified coordinates
    public double distance(double x, double y) {
        return Math.sqrt(
            Math.pow(x - this.x, 2) +
            Math.pow(y - this.y, 2)
        );
    }
}

// ThreeDPoint inherits MyPoint
class ThreeDPoint extends MyPoint {
    private double z;

    // No-argument constructor
    ThreeDPoint() {
        super();
        z = 0;
    }

    // Parameterized constructor
    ThreeDPoint(double x, double y, double z) {
        super(x, y);
        this.z = z;
    }

    // Getter method for z
    public double getZ() {
        return z;
    }

    // Override distance method for 3D points
    @Override
    public double distance(MyPoint p) {
        return Math.sqrt(
            Math.pow(p.getX() - getX(), 2) +
            Math.pow(p.getY() - getY(), 2) +
            Math.pow(((ThreeDPoint)p).getZ() - z, 2)
        );
    }
}

// Main class
public class Lab_95 {
    public static void main(String[] args) {

        ThreeDPoint p1 = new ThreeDPoint(0, 0, 0);
        ThreeDPoint p2 = new ThreeDPoint(10, 30, 25.5);

        double result = p1.distance(p2);

        System.out.println("Distance between two points = " + result);
    }
}
