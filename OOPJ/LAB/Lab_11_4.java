interface Car{
    public abstract void moveForward();
    public abstract void moveBackward();
    public abstract void moveLeft();
    public abstract void moveRight();
}

class Swift implements Car{

    @Override
    public void moveForward() {
        System.out.println("Swift Move Forward");
    }

    @Override
    public void moveBackward() {
        System.out.println("Swift Move Backward");
    }

    @Override
    public void moveLeft() {
        System.out.println("Swift Move Left");
    }

    @Override
    public void moveRight() {
        System.out.println("Swift Move Right");
    }

}
class Thar implements Car{

    @Override
    public void moveForward() {
        System.out.println("Thar Move Forward");
    }

    @Override
    public void moveBackward() {
        System.out.println("Thar Move Backward");
    }

    @Override
    public void moveLeft() {
        System.out.println("Thar Move Left");
    }

    @Override
    public void moveRight() {
         System.out.println("Thar Move Right");
    }
    
}
public class Lab_11_4 {
    public static void main(String[] args) {
       Swift s = new  Swift();
       Thar t = new  Thar();
       s.moveForward();
       s.moveBackward();
       s.moveLeft();
       s.moveRight();

       t.moveForward();
       t.moveBackward();
       t.moveLeft();
       t.moveRight();
    }
}
