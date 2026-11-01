abstract  class Vehicle{
    public abstract void startEngine();
    public abstract void stopEngine();
}

class Car extends Vehicle{
    @Override
    public void startEngine(){
        System.out.println("Car is Start");
    }
    @Override
    public void stopEngine(){
        System.out.println("Car is stop");
    }
}

class Motorcycle extends Vehicle{
    @Override
    public void startEngine(){
        System.out.println("Motorcycle is start");
    }
    @Override
    public void stopEngine(){
        System.out.println("Motorcycle is stop");
    }
}

public class Lab_10_3 {
    public static void main(String[] args) {
        Car c1 = new Car();
        Motorcycle m1 = new Motorcycle();
        m1.startEngine();
        m1.stopEngine();
        c1.startEngine();
        c1.stopEngine();
    }
}
