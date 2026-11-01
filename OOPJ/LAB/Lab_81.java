class Time{
    int hour,minitue,second;
    public Time(int hour,int minitue,int second){
        this.hour = hour;
        this.minitue = minitue;
        this.second = second;
    }

    public Time addTime(Time t){
        Time ans = new Time(00,00,00);

        ans.second = t.second + this.second;
        ans.minitue += ans.second / 60;
        ans.second = ans.second % 60;

        ans.minitue += t.minitue + this.minitue;
        ans.hour += ans.minitue / 60;
        ans.minitue = ans.minitue % 60;

        ans.hour += t.hour + this.hour;

       return ans;
    }

}
public class Lab_81 {
    public static void main(String[] args) {
        Time t = new Time(02, 55, 55);
        Time t2 = new Time(03,07,10);
        Time ans = t.addTime(t2);

        System.out.println(ans.hour+":"+ans.minitue+":"+ans.second);
    }
}
