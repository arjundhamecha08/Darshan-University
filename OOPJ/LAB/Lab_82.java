class A{
    static int count;
    A(){
        count++;
    }
}
public class Lab_82 {
    public static void main(String[] args) {
        A a = new A();
        A a1 = new A();
        A a2 = new A();
        A a3 = new A();
        A a4 = new A();
        System.out.println(A.count);
    }
}
