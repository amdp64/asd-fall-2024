import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

public class TrafficStudy {

    public static void main(String[] args) {
        TrafficAnalysis file1Analysis = new TrafficAnalysis("OOR202411030320.csv");
        TrafficAnalysis file2Analysis = new TrafficAnalysis("PMH202411030320.csv");
        TrafficAnalysis file3Analysis = new TrafficAnalysis("PPD202411030320.csv");

        ExecutorService exSvc = Executors.newCachedThreadPool();

        exSvc.execute(file1Analysis);
        exSvc.execute(file2Analysis);
        exSvc.execute(file3Analysis);
    
        exSvc.shutdown();

        try {
            boolean allDone = exSvc.awaitTermination(2, TimeUnit.SECONDS);
            
            // if all threads ended
            if (allDone) {
                System.out.println(TrafficAnalysis.sortedMapToString());
            }
        } catch (InterruptedException e) {
            System.err.println("Error occurred during thread execution: " + e.getMessage());
        }
    }
}
