package sintatico;
import java.io.*;
public class geraLexer {
	
	public static void main(String args[]) throws IOException{
		String arq = "C:/ProjetosJavaEclipse/compilador_parte2/src/sintatico/lexico.flex";
		gerarLexer(arq);
	}
	
	public static void gerarLexer(String arq) {
		
		File in = new File(arq);
		jflex.Main.generate(in);
	}

}
