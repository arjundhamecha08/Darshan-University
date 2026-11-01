
import java.util.Random;

class NumberGenerator extends Thread {
    Random random = new Random();

    public void run() {
        try {
            while (true) {
                int number = random.nextInt(100);

                System.out.println("\nGenerated Number: " + number);

                if (number % 2 == 0) {
                    SquareThread square = new SquareThread(number);
                    square.start();
                } else {
                    CubeThread cube = new CubeThread(number);
                    cube.start();
                }

                Thread.sleep(1000);
            }
        } catch (InterruptedException e) {
            System.out.println("Number Generator interrupted.");
        }
    }
}

class SquareThread extends Thread {
    int number;

    SquareThread(int number) {
        this.number = number;
    }

    public void run() {
        System.out.println("Square of " + number + " = "
                           + (number * number));
    }
}

class CubeThread extends Thread {
    int number;

    CubeThread(int number) {
        this.number = number;
    }

    public void run() {
        System.out.println("Cube of " + number + " = "
                           + (number * number * number));
    }
}

public class Lab_13_5 {
    public static void main(String[] args) {
        NumberGenerator generator = new NumberGenerator();
        generator.start();
    }
}
