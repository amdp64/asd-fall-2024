import java.io.IOException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PetIntoJSON {

    //private static ObjectMapper objectMapper;
    public static void main(String[] args) {

        ObjectMapper Obj = new ObjectMapper();
        //objectMapper.findAndRegisterModules();

        Pet dog = new Pet();

        dog = getObjectData(dog);

        try {
            String jsonStr = Obj.writeValueAsString(dog);
            System.out.println(jsonStr);

            Pet newPet = (Pet) Obj.readValue(jsonStr, Pet.class);
            System.out.println(newPet);

        } catch (IOException e) {
            e.printStackTrace();
        }

}

    public static Pet getObjectData(Pet dog) {
        dog.setPet_name("Koda");
        dog.setPet_type("Canine");
        dog.setAge(10);
        // Return the object
        return dog;
    }
}
