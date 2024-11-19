    // Private fields for all vehicle data
    // Constructor accepts all data necessary to initialize an instance
    // Exposes getter and setter methods for that that data
    // Exposes a toString method that returns a string representation of the observation.

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Observation {
    private LocalDateTime dateTime;
    private String licencePlate;
    private String vehicleType;
    private String vehicleColour;
    private String vehicleDirection;

    // Constructor
    public Observation(LocalDateTime time, String licence, String type, String colour, String direction) {
        this.dateTime = time;
        this.licencePlate = licence;
        this.vehicleType = type;
        this.vehicleColour = colour;
        this.vehicleDirection = direction;
    }

    // Getter Setter Methods
    public LocalDateTime getTime() {
        return dateTime;
    }
    public void setTime(LocalDateTime newTime) {
        this.dateTime = newTime;
    }
    public String getPlate() {
        return licencePlate;
    }
    public void setPlate(String newPlate) {
        this.licencePlate = newPlate;
    }
    public String getType() {
        return vehicleType;
    }
    public void setType(String newType) {
        this.vehicleType = newType;
    }
    public String getColour() {
        return vehicleColour;
    }
    public void setColour(String newColour) {
        this.vehicleColour = newColour;
    }
    public String getDirection() {
        return vehicleDirection;
    }
    public void setDirection(String newDirection) {
        this.vehicleDirection = newDirection;
    }

    // Get a formatted DateTime String
    public String getFormattedDateTime() {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return dateTime.format(format);
    }

    // String Method
    public String toString() {
        return "Observation: " + dateTime + ", " + licencePlate + ", " + vehicleType + ", " + vehicleColour + ", " + vehicleDirection;
    }

}