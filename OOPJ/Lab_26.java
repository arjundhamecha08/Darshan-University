public class Lab_26 {
    public static void main(String[] args) {
        
        char c = args[0].charAt(0);

    
        if(
            c=='a'
            || c=='A'
            || c=='e'
            || c=='E'
            || c=='i'
            || c=='I'
            || c=='o'
            || c=='O'
            || c=='u'
            || c=='U'
        ){

            System.out.println("Charecter is Vowel");
        }
        else{
            System.out.print("Charecter is Constant");
        }

    }
}
