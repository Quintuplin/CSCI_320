import java.util.*;
import java.io.*;

class Solution{
    public static void main(String []argh){
        Scanner in = new Scanner(System.in);
        int t=in.nextInt();
        for(int i=0;i<t;i++){
            int a = in.nextInt();
            int b = in.nextInt();
            int n = in.nextInt();
            int prev = a;
            String outstr = new String();

            for(int k=0; k<n; k++){
                prev += (int)Math.pow(2,k) * b;
                outstr+=prev;

                if(k!=n-1){
                    outstr+=" ";
                }
            }

            System.out.println(outstr);
        }
        in.close();
    }
}