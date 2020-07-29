// https://www.hackerrank.com/challenges/java-covariance/problem

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

//Complete the classes below
class Flower {
    String whatsYourName(){
        return "I have many names and types.";
    }
}

class Jasmine extends Flower {
    @Override
    String whatsYourName(){
        return "Jasmine";
    }
}

class Lily extends Flower {
    @Override
    String whatsYourName(){
        return "Lily";
    }
}

class Region {
    static Flower myFlower = new Flower();

    Flower yourNationalFlower(){
        return myFlower;
    }
}

class WestBengal extends Region{
    static Jasmine myFlower = new Jasmine();

    Jasmine yourNationalFlower(){
        return myFlower;
    }
}

class AndhraPradesh extends Region{
    static Lily myFlower = new Lily();

    Lily yourNationalFlower(){
        return myFlower;
    }
}


public class Solution {
  public static void main(String[] args) throws IOException {
      BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
      String s = reader.readLine().trim();
      Region region = null;
      switch (s) {
        case "WestBengal":
          region = new WestBengal();
          break;
        case "AndhraPradesh":
          region = new AndhraPradesh();
          break;
      }
      Flower flower = region.yourNationalFlower();
      System.out.println(flower.whatsYourName());
    }
}