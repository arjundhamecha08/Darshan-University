
public class Static_demo {
    static{
        System.out.println("Static 1");
    }
    static{
        System.out.println("Static 2");
    }
    static{
        System.out.println("Static 3");
    }
    static{
        System.out.println("Static 4");
    }
    static{
        System.out.println("Static 5");
    }
    public static void main(){
        System.out.println("Main method");
    }
    static{
        main();
    }
    public static void main(String[] args) {
        System.out.println("Actual Main method");
        main();
    }
}