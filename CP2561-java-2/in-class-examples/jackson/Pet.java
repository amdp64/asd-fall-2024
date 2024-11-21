public class Pet {
    private String pet_name;
    private String pet_type;
    private int Age;

    // Getter
    public String getPet_name() {
        return pet_name;
    }

    // Setter
    public void setPet_name(String pet_name) {
        this.pet_name = pet_name;
    }

    // Getter
    public String getPet_type() {
        return pet_type;
    }

    // Setter
    public void setPet_type(String pet_type) {
        this.pet_type = pet_type;
    }

    // Getter
    public int getAge() {
        return Age;
    }

    // Setter
    public void setAge(int age) {
        Age = age;
    }

    // Creating toString Method
    @Override public String toString() {
        return "Pet [pet_name="
        + pet_name
        + ", type=" + pet_type
        + ", Age=" + Age + "]";
    }
}
