import java.util.Scanner;

class StringOp {
    String str;

    StringOp(String str){
        this.str = str;
    }

    int len_st() {
        return str.length();
    }

    void printStr(){
        for(int i=str.length()/2;i<str.length();i++){
            System.out.print(str.charAt(i));
        }
    }
}

public class Lab_66 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter String: ");
        String str = sc.next();
        StringOp st = new StringOp(str);
        System.out.println("Length of the String is: "+st.len_st());
        st.printStr();
    }
}
