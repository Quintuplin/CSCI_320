import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class java_exception_handling_try_catch {
    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner sc = new Scanner(System.in);

        try {
            int x = sc.nextInt();
            int y = sc.nextInt();
            int res = (x/y);
            System.out.printf("%d", res);
        } catch (InputMismatchException e){
            System.out.println(e.getClass().getName().toString());
        } catch (Exception e){
            System.out.println(e);
        }
    }
}