package javaIO;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class Read {
//	public static void main(String[] args) throws Exception {
//		ServerSocket ss = new ServerSocket(2000);
//		Socket sock = ss.accept();
//		BufferedReader in = new BufferedReader(
//			new InputStreamReader(sock.getInputStream()));
//		String input;
//
//		while ((input = in.readLine()) != null) {
//			System.out.println(input);
//		}
//		in.close();
//		sock.close();
//		ss.close();
//	}

	public static void main(String[] args) throws Exception {
		Socket sock = new Socket("localhost", 2000);
		PrintWriter out = new PrintWriter(sock.getOutputStream());
		out.println("It worked.");
		out.println("At least,");
		out.println("we think it did.");
		out.close();
		sock.close();
	}
}