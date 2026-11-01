interface Playable{
    public abstract void play();
}
class footBall implements Playable{

    @Override
    public void play() {
        System.out.println("Play Football");
    }

}
class volleyBall implements Playable{

    @Override
    public void play() {
        System.out.println("Play Volleyball");
    }
    
}
class BasketBall implements Playable{

    @Override
    public void play() {
        System.out.println("Play Basketball");
    }
    
}
public class Lab_11_5 {
    public static void main(String[] args) {
        footBall f = new footBall();
        volleyBall v = new volleyBall();
        BasketBall b = new  BasketBall();

        f.play();
        v.play();
        b.play();
    }
}
