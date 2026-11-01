abstract class Vegetable {
    String color;

    public String toString() {
        return "Color: " + color;
    }
}

class Potato extends Vegetable {
    public Potato(String color) {
        this.color = color;
    }

    public String toString() {
        return "Potato - " + this.color;
    }
}

class Brinjal extends Vegetable {
    public Brinjal(String color) {
        this.color = color;
    }

    public String toString() {
        return "Brinjal - " + this.color;
    }
}

class Tomato extends Vegetable {
    public Tomato(String color) {
        this.color = color;
    }

    public String toString() {
        return "Tomato - " + this.color;
    }
}

public class Lab_10_1 {
    public static void main(String[] args) {
        Vegetable p1 = new Potato("Brown");
        Vegetable b1 = new Brinjal("Purple");
        Vegetable t1 = new Tomato("Red");

        System.out.println(p1.toString());
        System.out.println(b1.toString());
        System.out.println(t1.toString());
    }
}
