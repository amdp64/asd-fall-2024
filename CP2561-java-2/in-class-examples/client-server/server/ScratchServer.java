package server;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class ScratchServer {
    
    private ServerSocket server;
    private Socket connection;
    private ObjectInputStream input;
    private ObjectOutputStream output;
    private int counter = 0;
    public static void main(String[] args) {
        ScratchServer s = new ScratchServer();
        s.runServer();
    }

    public void runServer() {
        try {
            server = new ServerSocket(12345, 100);

            while (true) {
                System.out.println("Waiting for connection...");
                server.accept(); // wait for connection
                                // will block until a connection is established
                ++counter;
                System.out.printf("Connection #%d recieved from %s\n", counter, connection.getInetAddress().getHostName());

                // At this point we are connected to a client
                // Now we get the input and output streams
                output = new ObjectOutputStream(connection.getOutputStream());
                output.flush(); // flush to send header information
                                // forcing any accumulated information to be sent
                                // now have a clean area of memory
                
                input = new ObjectInputStream(connection.getInputStream());

                sendData("Hello, world!");

                String message = "";
                int msgs = 0;

                do {
                    try { // read message and display it
                        message = (String) input.readObject(); // read new message
                        System.out.println("SERVER> Recieved '" + message + "' from Client");
                        // Here we can perform some server 'Action' based on the input recieved
                        // There may be a response/results that should be sent back to the client
                        sendData("Oh! hello there. "+ ++msgs + "");
                    } catch (ClassNotFoundException e) {
                        System.out.println("SERVER> Unknown object type recieved.");
                        e.printStackTrace();
                    }
                } while (!message.equals("CLIENT> Terminate"));
                sendData("Goodbye!");
                // while it isn't exactly like this, keep trying to get a message
                output.flush();
                output.close();
                input.close();
                connection.close();
                ++counter;
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void sendData(String message) throws IOException {
        output.writeObject("SERVER>" + message);
        output.flush();
        System.out.println("SERVER>" + message);
    }
}