
interface Transport {
    public abstract void deliver();
}

abstract class Animal {

    public Animal(String name) {
        System.out.println("Name: " + name);
    }
}

class Tiger extends Animal {

    public Tiger() {
        super("Tiger");
    }
}

class Camel extends Animal implements Transport {

    public Camel() {
        super("Camel");
    }

    @Override
    public void deliver() {
        System.out.println("Camel is Deliver");
    }

}

class Deer extends Animal {

    public Deer() {
        super("Deer");
    }
}

class Donkey extends Animal implements Transport {

    public Donkey() {
        super("Donkey");
    }

    @Override
    public void deliver() {
        System.out.println("Donky is Deliver");
    }

}

public class Lab_11_3 {

    public static void main(String[] args) {
       Animal[] animals = new Animal[4];
       animals[0] = new Tiger();
       animals[1] = new Camel();
       animals[2] = new Deer();
       animals[3] = new  Donkey();
       for(int i=0;i<4;i++){
        if(animals[i] instanceof Transport transport){
               transport.deliver();
        }
       }
    }
}
