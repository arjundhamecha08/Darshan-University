class House{
    private String address;
    private int numberOfRooms;
    private double area;

    public void setter(String address, int numberOfRooms,double area){
        this.address = address;
        this.numberOfRooms = numberOfRooms;
        this.area = area;
    }

    public void getter(){
        System.out.println("Address: "+address);
        System.out.println("Number of Rooms: "+numberOfRooms);
        System.out.println("Area: "+area);
    }

    public double calculatePrice(double meter,double price){
       return meter*price;
    }
}

public class Lab_85 {
    public static void main(String[] args) {
        House h = new House();
        h.setter("Rajkot", 07, 1024);
        h.getter();
        System.out.println("Price: "+h.calculatePrice(2048, 400));
    }
}
