class Product{
    int item;
    boolean ifproducing;
    synchronized public void put(int item){
        while(ifproducing){
            try {
                wait();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        this.item = item;
       ifproducing = true;
        notify();
        System.out.println("Produced item" + item); 
    }

    synchronized public int get(){
        while(!ifproducing){
            try{
                wait();
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
        notify();
        ifproducing = false;
        return item;
    }

}

class Producer extends Thread{
    Product p;

    public Producer(Product p) {
        this.p = p;
    }
    public void run(){
        for(int i = 1;i<=5;i++){
            p.put(i);
            try{
                Thread.sleep(500);
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}

class Consumer extends Thread{
    Product p;

    public Consumer(Product p) {
        this.p = p;
    }
    public void run(){
        for(int i = 1;i<=5;i++){
            System.out.println("Consumed: "+p.get());
            try{
                Thread.sleep(500);
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}
public class Lab_13_4 {
    public static void main(String[] args) {
        Product p = new Product();
        Producer pd = new Producer(p);
        Consumer c = new Consumer(p);
        pd.start();
        c.start();
    }
}
