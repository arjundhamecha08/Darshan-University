import java.util.Scanner;
class Count{
    int a,e,i,o,u;
    char c;
    void VowelCount(String str){
        
        for(int j=0;j<str.length();j++){
            c = str.charAt(j);
        switch (c) {
            case 'a':
                a++;
                break;
            case 'e':
                e++;
                break;
            case 'i':
                i++;
                break;
            case 'o':
                o++;
                break;
            case 'u':
                u++;
                break;
            default:
                break;
        }
    }
        System.out.println("A = "+a+"\nE = "+e+"\nI = "+i+"\nO = "+o+"\nU = "+u);
}

}
public class Lab_73 {   
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (true) {
            System.out.println("Enter String: ");
            String str = sc.next();
            str = str.toLowerCase();
            if(str.equals("quit")){
                System.exit(0);
            }
            Count count = new Count();
            count.VowelCount(str);
        }
    }
}
