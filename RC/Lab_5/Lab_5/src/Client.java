import java.net.*;
import java.io.*;
import java.util.Arrays;


public class Client {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("172.30.116.223", 3456);

            BufferedReader consola = new BufferedReader(new InputStreamReader(System.in));
            int i, lungime;

            String mesaj = "Ivancu Andrei" ;



            DataInputStream socketIn = new DataInputStream(socket.getInputStream());
            DataOutputStream socketOut = new DataOutputStream(socket.getOutputStream());

            socketOut.writeBytes(mesaj);
            socketOut.flush();

            String rev = socketIn.readLine();

            System.out.println("Sirul este: " + rev);

            consola.close();
            socket.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}