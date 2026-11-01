interface A{
    int a = 10;
    public abstract void get_a();
}
interface A1 extends A{
    int a1 = 20;
    public abstract void get_a1();
}
interface A2 extends A{
    int a2 = 30;
    public abstract void get_a2();
}

interface A12 extends A1,A2{
    int a12 = 40;
    public abstract void get_a12();
}
class B implements A12{
    @Override
    public void get_a(){
        System.out.println("Value of A interface: "+a);
    }
    @Override
    public void get_a1(){
        System.out.println("Value of A1 interface: "+a1);
    }
    @Override
    public void get_a2(){
        System.out.println("Value of A2 interface: "+a2);
    }
    @Override
    public void get_a12(){
        System.out.println("Value of A12 interface: "+a12);
    }
}
public class Lab_11_1 {
    public static void main(String[] args) {
        B b = new B();
        b.get_a();
        b.get_a1();
        b.get_a2();
        b.get_a12();
    }
}
