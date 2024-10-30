public class Task implements Runnable {
    private static String data;
    private String part;

    public Task (String myPart) {
        this.part = myPart;
        System.out.println(this.part);
    }

    @Override
    public synchronized void run() {
        // Task work goes here.
        // Strings are immutable, but should be able to add a bit on
        // and create a new string.
        // but because I changed reference, this doesn't appear to work.
        data = data + this.part + " ";
    }

    public static String getData() {
        return data;
    }
}