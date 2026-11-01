interface EventListener{
    public abstract void performEvent();
}
interface MouseListener extends EventListener{
    public abstract void mouseClicked();
    public abstract void mousePressed();
    public abstract void mouseReleased();
    public abstract void mouseMoved();
    public abstract void mouseDragged();
}
interface KeyListener extends  EventListener{
    public abstract void keyPressed();
    public abstract void keyReleased();
}

class EventDemo implements MouseListener,KeyListener{
    @Override
    public void mouseClicked(){
        System.out.println("Mouse Clicked...!");
    }
    @Override
    public void mousePressed(){
        System.out.println("Mouse Pressed...!");
    }
    @Override
    public void mouseReleased(){
        System.out.println("Mouse Released...!");
    }
    @Override
     public void mouseMoved(){
        System.out.println("Mouse Moved...!");
    }
    @Override
     public void mouseDragged(){
        System.out.println("Mouse Dragged...!");
    }
    @Override
     public void keyPressed(){
        System.out.println("Key Pressed...!");
    }
    @Override
    public void keyReleased(){
        System.out.println("Key Released...!");
    }
    @Override
     public void performEvent(){
        System.out.println("Event Performed...!");
    }

    

}
public class Lab_11_2 {
    public static void main(String[] args) {
        EventDemo e = new EventDemo();
        e.mouseClicked();
        e.mouseReleased();
        e.mousePressed();
        e.mouseMoved();
        e.mouseDragged();
        e.keyPressed();
        e.keyReleased();
        e.performEvent();
    }
}
