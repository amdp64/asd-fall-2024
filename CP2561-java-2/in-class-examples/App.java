import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class App {
    
    public static void main(String[] args) {
        System.out.println(Task.getData()); // should be null

        Task t1 = new Task("[abc]");
        Task t2 = new Task("[def]");
        Task t3 = new Task("[ghi]");
    
        ExecutorService exSvc = Executors.newCachedThreadPool();
        
        exSvc.execute(t1);
        exSvc.execute(t2);
        exSvc.execute(t3);
    
        exSvc.shutdown();

        try {
            boolean allEnded = exSvc.awaitTermination(2, TimeUnit.SECONDS);

            if (allEnded) {
                System.out.println(Task.getData());            
            }
            else {
                System.out.println("Timed out waiting for threads.");
            }
            
            
        }
        catch (InterruptedException e) {
            e.printStackTrace(); // Something else, not timed out waiting.
        }
    }
}
