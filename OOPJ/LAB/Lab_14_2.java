
import java.io.*;

class Lab_14_2 {
    public static void main(String[] args) {
        try {
            BufferedReader br = new BufferedReader(
                new FileReader("file1.txt"));
            BufferedWriter bw = new BufferedWriter(
                new FileWriter("file2.txt"));

            String line;
            int count = 0;

            while ((line = br.readLine()) != null) {
                String[] words = line.split(" ", -1);

                for (int i = 0; i < words.length; i++) {
                    if (words[i].equals("abhay")) {
                        words[i] = "nakum";
                        count++;
                    }
                }

                bw.write(String.join(" ", words));
                bw.newLine();
            }

            br.close();
            bw.close();

            System.out.println("Number of replacements: " + count);
        }
        catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
