class Parent{
    int a = 10;
    Parent(){
        System.out.println("Parent Called...!");
        System.out.println("A="+a);
    }
}
class Child extends Parent{
    int a = 20;
    Child(){
        super();
        System.out.println("Child Called...!");
        System.out.println("A="+a);
        System.out.println("Parent A="+super.a);
    }
}
public class Lab_93 {
    public static void main(String[] args) {
        Child c = new Child();
    }
}
