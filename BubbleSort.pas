PROGRAM BubbleSort;
##August 2023
USES crt;

type
  intarray = array of integer;



function randomList(anzahl: integer): intarray;
var
  count: integer;
  liste: intarray;
begin
  SetLength(liste, anzahl); 
  count := 0;
  while count < anzahl do
  begin
    
    liste[count] := Random(100);
    count := count + 1;
  end;
  randomList := liste;
end;



function BubbleSort(liste: intarray): intarray;
var
  i, j, k, container: integer;
begin
  k := Length(liste) - 1; 
  for i := 0 to Length(liste)  do  
  begin
    for j := 0 to k  do 
    begin
      if liste[j] > liste[j + 1] then
      begin
        container := liste[j + 1];
        liste[j + 1] := liste[j];
        liste[j] := container;
      end;
    end;
    k := k - 1;
  end;
  BubbleSort := liste;
end;



procedure writeArr(arr: intarray; len: integer); 
var
  i: integer;
begin
  for i := 0 to len - 1 do  
  begin
    write(arr[i]);
    write(' ');
  end;
end;

var
  anzahl: integer;
  a, b: intarray;



begin
  write('Bitte Anzahl der Elemente der Liste angeben: ');
  readln(anzahl);
  a := randomList(anzahl);
  b := BubbleSort(a);
  writearr(b, Length(b));  
  readln();
end.
