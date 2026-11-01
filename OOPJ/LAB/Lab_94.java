class Book{
    private String author_name;

}

class Book_publication extends Book{
    private String title;
    public void setter(String title){
        this.title = title;
    }
    public void getter(){
        System.out.println("Book Publication: "+this.title);
    }

}

class Pepar_publication extends Book{
    private String title;

    public void setter(String title){
        this.title = title;
    }
   public void getter(){
        System.out.println("Pepar Publication: "+this.title);
    }


}
public class Lab_94 {
    public static void main(String[] args) {
        Book b1 = new Book_publication();
        Book b2 = new Pepar_publication();
        // b1.setter("Book1");
    }
}
