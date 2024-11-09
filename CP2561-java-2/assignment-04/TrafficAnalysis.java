import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Collections;
import java.util.SortedMap;
import java.util.TreeMap;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TrafficAnalysis implements Runnable {
    // Constructor recieves path to traffic file
    // Should implement runnable
    // Should have a static sorted treemap
    // Duplicate keys not allowed
    // Throw exception if found
    // Run methods should:
    // Open file, create observations
    // and insert into the hashmap
    // Exposes a static method which returns
    // a string representation of the sortedMap

    private String filePath; // Path to traffic file.
    private final static SortedMap<String, Observation> observations = 
        Collections.synchronizedSortedMap(new TreeMap<String, Observation>());

    // Constructor receiving a filePath
    public TrafficAnalysis(String filePath) {
        this.filePath = filePath;
    }

    public void run() {
        // DateTime format matching the data
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String currentLine;
            currentLine = reader.readLine();
            while (currentLine != null) {
                String[] trafficData = currentLine.split(",");

                // Parse according to date pattern provided above
                LocalDateTime dt = LocalDateTime.parse(trafficData[0].trim(), format);
                String plate = trafficData[1].trim();
                String type = trafficData[2].trim();
                String color = trafficData[3].trim();
                String direction = trafficData[4].trim();

                Observation obs = new Observation(dt, plate, type, color, direction);

                // Check for a duplicate key
                if (observations.containsKey(plate)) {
                    throw new IllegalArgumentException("Duplicate key: " + plate);
                } else {
                    observations.put(plate, obs);
                }

                // Read the next line, to avoid an infinite loop
                currentLine = reader.readLine();
            }
        } catch (IllegalArgumentException | IOException e) {
            System.err.println("Error occurred: " + e.getMessage());
        }
            
    }

    // Static method to produce string representation of SortedMap
    // Exposes toString using a Static method
    public static String sortedMapToString() {
        String result = "";

        // Iterate over each entry in our SortedMap
        for (SortedMap.Entry<String, Observation> entry : observations.entrySet()) {
            result += entry.getKey() // Plate
                   + ": "
                   + entry.getValue().getFormattedDateTime()
                   + ", "
                   + entry.getValue().getPlate()
                   + ", "
                   + entry.getValue().getType()
                   + ", "
                   + entry.getValue().getColour()
                   + ", "
                   + entry.getValue().getDirection()
                   + "\n";
        }
        return result.trim();
    }
}
