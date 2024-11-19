package client;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Scanner;

public class ScratchClient {

    private Socket connection;
    private ObjectInputStream input;
    private ObjectOutputStream output;
    public static void main(String[] args) {
        ScratchClient c = new ScratchClient();
        c.runClient("127.0.0.1"); // Local host
        // Every computer can refer to itself as this
    }

    private void runClient(String host) {
        try {
            connection = new Socket(InetAddress.getByName(host), 12345);
            System.out.println("Connected to " + connection.getInetAddress().getHostName());
            // Should say "Connected to 127.0.0.1"
            output = new ObjectOutputStream(connection.getOutputStream());
            output.flush();

            input = new ObjectInputStream(connection.getInputStream());

            Scanner keyboard = new Scanner(System.in);
            String buffer = "";
            do {
                System.out.print("> ");
                buffer = keyboard.nextLine();
                sendData("CLIENT> " + buffer);

                // expecting a reply
                try {
                    if (input.available() == 0); // wait until something comes avaialble
                    // but, this may wait forever 
                    // spinning its wheels waiting 
                    buffer = (String) input.readObject();
                } catch (ClassNotFoundException e) {
                    System.out.println("unknown object from server stream");
                }
            } while (!buffer.equals("Terminate"));
            keyboard.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void sendData(String message) throws IOException {
        output.writeObject("CLIENT>" + message);
        output.flush();
        System.out.println("CLIENT>" + message);
    }
}
