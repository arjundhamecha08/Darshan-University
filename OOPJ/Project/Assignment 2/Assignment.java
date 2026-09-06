public class Assignment{
    public static void main(String[] args) {

        int x, y, z;
        int a, b, c;
        int i, j, k, m;
        int result;

        x = 1;
        x++;
        ++x;
        x--;
        System.out.println(x);

        i = 11;
        i = i++ + ++i;
        System.out.println(i);

        a = 11;
        b = 22;
        c = a + b + a++ + b++ + ++a + ++b;
        System.out.println(c);

        i = 0;
        i = i++ - --i + ++i - i--;
        System.out.println(i);

        i = 1;
        j = 2;
        k = 3;
        m = i-- - j-- - k--;

        System.out.println("i=" + i);
        System.out.println("j=" + j);
        System.out.println("k=" + k);
        System.out.println("m=" + m);

        a = 1;
        b = 2;
        System.out.println(--b - ++a + ++b - --a);

        i = 19;
        j = 29;
        k = i-- - i++ + --j - ++j + --i - j-- + ++i - j++;

        System.out.println("i=" + i);
        System.out.println("j=" + j);
        System.out.println("k=" + k);

        a = 1;
        a = a++ + ++a * --a - a--;
        System.out.println(a);

        x = 3;
        y = ++x + x++ + ++x;
        System.out.println(y);

        a = 5;
        b = a-- - --a;
        System.out.println(b);

        x = 2;
        y = x++ + x++ + x;
        System.out.println(y);

        a = 2;
        b = 3;
        c = a++ + b++ + ++a + ++b;
        System.out.println(c);

        i = 10;
        System.out.println(--i + i-- + i++);

        i = 0;
        i = i++ - --i + ++i - i--;
        System.out.println(i);

        i = 3;
        result = i++ * ++i * i--;
        System.out.println(result);

        x = 1;
        y = 1;
        z = x++ + ++y + x++ + y++ + ++x + ++y;
        System.out.println(x + " " + y + " " + z);

        x = 1;
        y = x++ + ++x + x-- + --x;
        System.out.println(x + " " + y);

        x = 10;
        x = x++ + x-- - x++ + x;
        System.out.println(x);

        a = 5;
        b = 6;
        result = a++ + --b + ++a + b++;
        System.out.println(result);

        i = 1;
        j = i++ + i++ + ++i + i++ + ++i + i;
        System.out.println(i + " " + j);
    }
}