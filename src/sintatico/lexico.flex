package sintatico;

import java_cup.runtime.*;

%%
%cup

%public
%class Lexer
%line
%column

%{
	private Symbol symbol(int type){
		return new Symbol(type, yyline, yycolumn);
	}
	
	private Symbol symbol(int type, Object value){
		return new Symbol(type, yyline, yycolumn, value);
	}

%}

//declação das expressoes regulares

digito = [0-9]
letra = [a-zA-Z_]
inteiro = {digito}+
literal = \"[^\"]*\"
decimal = {inteiro}"."{inteiro}
variavel = {letra}+
IGNORE = [\n|\s|\t\r]
%%

//diretiva de estado inicial
<YYINITIAL>{
	"aplicacao" {return new Symbol(Sym.APLICACAO);}
	"inicioapp" {return new Symbol(Sym.INICIOAPP);}
	"fimapp" {return new Symbol(Sym.FIMAPP);}
	"int" {return new Symbol(Sym.TIPO_INTEIRO);}
	"caracter" {return new Symbol(Sym.TIPO_CARACTER);}
	":=" {return new Symbol(Sym.ATRIBUICAO);}
	";" {return new Symbol(Sym.PTVG);}
	{inteiro} {return new Symbol(Sym.INTEIRO);}
	{literal} {return new Symbol(Sym.CHAR);}
	{decimal} {return new Symbol(Sym.DECIMAL);}
	{variavel} {return new Symbol(Sym.VARIAVEL);}
	{IGNORE} {}
	
	
}
<<EOF>> {return new Symbol(Sym.EOF);}
[^] { throw new Error("caracter inválido: "+yytext()+" na linha "+(yyline+1)+", coluna "+(yycolumn+1) ); }
