
import java.io.*;

class Lab_14_1 {
    public static void main(String[] args) {
        try {
            BufferedReader br = new BufferedReader(
                new FileReader("abc.txt"));

            int characters = 0, words = 0, lines = 0;
            String str;

            while ((str = br.readLine()) != null) {
                lines++;
                characters += str.length();
                words += str.split("\\s+").length;
            }

            br.close();

            System.out.println("Characters: " + characters);
            System.out.println("Words: " + words);
            System.out.println("Lines: " + lines);
        }
        catch (FileNotFoundException e) {
            System.out.println("File does not exist.");
        }
        catch (IOException e) {
            System.out.println("Error reading file.");
        }
    }
}
