public class Lab_47 {
    static void primeNumbers(){
        int j;
        for(int i=100;i<=999;i++){
            j=2;
            int flag = 0;
           while (j<i) {
            if(i%j == 0){
                flag=1;
                break;
            }
            j++;
           }
           if(flag==0)
           System.out.println(i);
        }
    }
    public static void main(String[] args) {
        primeNumbers();
    }
}
