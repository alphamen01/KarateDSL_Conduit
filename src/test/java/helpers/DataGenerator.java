package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {
    
    public static String getRandomEmail(){
        Faker faker = new Faker();
        String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0,100) +  "@gmail.com";
        return email;
    }

    public static String getRandomUserName(){
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }

    public String getRandomUserName2(){
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }

}
