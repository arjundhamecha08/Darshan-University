
class Thread1 extends Thread {
    public void run() {
        System.out.println("Thread Class...");
    }
}

class Thread2 implements Runnable {
    public void run() {
        System.out.println("Runnable Interface...");
    }
}

public class Lab_13_1 {
    public static void main(String[] args) {
        Thread1 t1 = new Thread1();
        t1.start();
        Thread2 t2 = new Thread2();
        Thread t3 = new Thread(t2);
        t3.start();
    }

}