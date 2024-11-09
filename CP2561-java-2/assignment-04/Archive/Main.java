import java.time.LocalDateTime;

public class Main {
    public static void main(String[] args) {
        Observation o1 = new Observation(LocalDateTime.of(2024, 11, 03, 03, 24, 42), "HCL005", "Car", "Green", "In");

        System.out.println(o1.getTime());
        System.out.println(o1.getColour());
        System.out.println(o1.toString());
    }
}

// 2024-11-03 03:24:42,HCL005,Car,Green,In
