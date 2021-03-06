{koder: A^2P}{9 - 5 - 2007}
{PSN 2005 #33 "Editor"}
{$B-,I-,Q-,R-,S-}
const
  filein = 'd.in';
  fileout = 'd.out';
  MaxLen = 600000;
  stop = MaxLen;
type
  node = record
    ch : char;
    last,next : longint;
  end;{node}
var
  fin,fout        : text;
  op,spc          : char;
  N,S,i,j,cur     : longint;
  list            : array[-1..MaxLen] of node;

begin
  {fload}
  assign(fin,filein); reset(fin);
  assign(fout,fileout); rewrite(fout);

  {dread}
  while not seekeoln(fin) do
  begin
    inc(S);
    read(fin,list[S].ch);
    list[S].next := S + 1;
    list[S].last := S - 1;
  end;{while}
  list[0].last := -1;
  list[0].next := 1;
  list[S].next := -1;

  readln(fin);
  readln(fin,N);

  {edit}
  cur := S;
  for i:=1 to N do
  begin
    read(fin,op);
    case op of
      'L' : if list[cur].last <> -1 then cur := list[cur].last;
      'D' : if list[cur].next <> -1 then cur := list[cur].next;
      'B' : if list[cur].last <> -1 then
            begin
              j := list[cur].next;
              list[j].last := list[cur].last;
              list[list[cur].last].next := j;
              cur := list[cur].last;
            end;{then}
      'P' : begin
              inc(S);
              read(fin,spc,list[S].ch);
              j := list[cur].next;
              list[S].last := cur; list[S].next := j;
              list[j].last := S; list[cur].next := S;
              cur := S;
            end;{then}
    end;{case}
    readln(fin);
  end;{for}

  {dprint}
  cur := list[0].next;
  while cur <> -1 do
  begin
    write(fout,list[cur].ch);
    cur := list[cur].next;
  end;{while}

  {fclose}
  close(fin); close(fout);
end.{main}

{
33� Editor.                                               Polonia 2005
����������������������������������������������������������������������

A usted  se le  da un  texto que  es una  secuencia de  caracteres. El
cursor  puede  estar  posicionado  en  el  texto (entre  cualquier dos
caracteres consecutivos), al comienzo (izquierda del primer  caracter)
o al final (derecha del ultimo caracter) del texto.

A usted se le da una secuancia de operaciones que usted debe  ejecutar
en el texto.

Las posibles operaciones son:

L mover el  cursor un caracter  a la izquierda  (si el cursor  esta al
  inicio no hacer nada)

D mover  el cursor  un caracter  a la  derecha (si  el cursor  esta al
  final, no hacer nada)

B borrar un caracter a la  izquierda del cursor (si el cursor  esta al
  inico no hacer nada)

P $ adiciona el caracter  $ a la derecha  del cursor (el caracter $ es
cualquier letra minuscula en el alfabeto ingles)

Antes de  la ejecucion  de las  operaciones dadas,  el cursor  esta al
final del texto.

Escriba un programa que determine  cual seria la apariencia del  texto
despues de las operaciones dadas.

Entrada

En la primera  linea del fichero  de entrada EDITOR.IN  est� el texto.
Este consiste de solamente   letras minusculas del alfabeto   ingles y
su longitud maxima  es de 100,000 caracteres. En la proxima linea  hay
un entero N, 1  <= N  <= 500,000,  el numero de operaciones  dadas. En
las proximas  N lineas  estaran las  operaciones dadas  en el orden de
ejecuci�n.

Salida

En la  primera y  unica linea  del fichero  de salida EDITOR.OUT usted
debe  escribir  el  texto  despues  de  la   ejecucion  de  todas  las
instrucciones.

Ejemplos de Entrada y Salida

Ejemplo # 1

 ��������������Ŀ  ������������Ŀ
 � EDITOR.IN    �  � EDITOR.OUT �
 ��������������Ĵ  ������������Ĵ
 � abcd         �  � abcdyx     �
 � 3            �  ��������������
 � P x          �
 � L            �
 � P y          �
 ����������������

Ejemplo # 2

 �����������Ŀ  ������������Ŀ
 � EDITOR.IN �  � EDITOR.OUT �
 �����������Ĵ  ������������Ĵ
 � abc       �  � yxabc      �
 � 9         �  ��������������
 � L         �
 � L         �
 � L         �
 � L         �
 � L         �
 � P x       �
 � L         �
 � B         �
 � P y       �
 �������������

Ejemplo # 3

 �����������Ŀ  ������������Ŀ
 � EDITOR.IN �  � EDITOR.OUT �
 �����������Ĵ  ������������Ĵ
 � dmih      �  � yxz        �
 � 11        �  ��������������
 � B         �
 � B         �
 � P x       �
 � L         �
 � B         �
 � B         �
 � B         �
 � P y       �
 � D         �
 � D         �
 � P z       �
 �������������
}
