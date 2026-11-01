
import java.io.*;

class Lab_14_3 {
    public static void main(String[] args) {
        int count = 0;

        try {
            FileReader fr = new FileReader(args[0]);
            int ch;

            while ((ch = fr.read()) != -1) {
                if (ch == '5') {
                    count++;
                }
            }

            fr.close();

            System.out.println("Number of occurrences of digit 5: " + count);
        }
        catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
