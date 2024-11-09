import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

public class App {
    public static void main(String[] args) {

        System.out.println (Task.getData()); // should be empty

        int [] i1 = {1, 2, 3}, i2 = {4, 5, 6}, i3 = {7, 8, 9};
        Task t1 = new Task (i1);
        Task t2 = new Task (i2);
        Task t3 = new Task (i3);

        ExecutorService exSvc = Executors.newCachedThreadPool();

        exSvc.execute(t2);
        exSvc.execute(t1);
        exSvc.execute(t3);

        exSvc.shutdown();

        try {
            boolean allEnded = exSvc.awaitTermination(2, TimeUnit.SECONDS);

            if (allEnded){
                System.out.println ("All Threads Ended: " + Task.getData());
            }
            else {
                System.out.println ("Timed out waiting for threads.");
            }
        }
        catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}