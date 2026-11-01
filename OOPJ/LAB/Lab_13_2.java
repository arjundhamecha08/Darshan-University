class Thread1 implements Runnable {
    synchronized public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println("Good Morning...");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

class Thread2 implements Runnable {
    synchronized public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println("Good Afternoon...");
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

public class Lab_13_2 {
    public static void main(String[] args) {
        Thread t1 = new Thread(new Thread1());
        Thread t2 = new Thread(new Thread2());
        t1.start();
        t2.start();

    }
}
