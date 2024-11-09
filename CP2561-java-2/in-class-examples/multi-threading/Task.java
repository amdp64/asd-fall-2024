public class Task implements Runnable{

    private final static int [] idata = {0, 0, 0, 0, 0, 0, 0, 0, 0};
    private int [] part;

    public Task (int [] myPart) {
        this.part = myPart;
        System.out.println ("Constructor: ["+this.part[0] + this.part[1] + this.part[2]+"]");
    }

    @Override
    public synchronized void run () {
        // Task work goes here.
        int i = 0;
        while (idata[i]!=0) ++i;

        for (int j = 0; j < 3; ++j, ++i)
            idata[i] = this.part[j];
    }

    public synchronized static String getData () {
        String out = "";

        for (int i = 0; i<9; ++i)
            out = out + idata[i];
        return out;
    }
}
