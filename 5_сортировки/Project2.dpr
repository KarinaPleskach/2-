program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

  type
    massive=array[0..188] of Integer;
var
  cmp, i,j: Integer;
  arr: massive;

  procedure bininsert(var a: massive; const N: integer );
              var
                i, j, x, L, R, m,cmp, swap:integer;
              begin
                swap := 0;
                cmp := 0;
                for i := 2 to N do
                begin
                  x := a[i];
                  L := 1;
                  R := i;
                  while L<R do
                    begin
                      m := (L+R) div 2;
                      Inc(cmp);
                        if a[m] <= x then
                          L := M+1
                        else
                          R := M;
                    end;
                  for j := i downto (R+1) do
                    begin
                      Inc(swap);
                      a[j] := a[j-1];
                    end;
                  inc(swap);
                  a[R] := x;
                end;
              end;





              //Сортировка шейкером
              procedure shaker(var a:massive; const N: Integer);
              var
                j, L, R, k, cmp, swap,tmp: integer;
              begin
                cmp := 0;
                swap := 0;
                L := 2;
                R := N;
                K := N;
                repeat
                  for j := R downto L do
                    begin
                      inc(cmp);
                      if a[j] < a[j-1] then
                        begin
                          inc(swap, 3);
                        tmp := a[j-1];
                        Arr[j-1] := arr[j];
                        Arr[j] := tmp;
                          K := j;
                        end;
                    end;
                  L := K+1;
                  for j := L to R do
                    begin
                      inc(cmp);
                      if a[j] < a[j-1] then
                        begin
                          inc(swap, 3);
                          tmp := a[j-1];
                        Arr[j-1] := arr[j];
                        Arr[j] := tmp;
                          K := j;
                        end;
                    end;
                  R := K-1;
                until L>R;
              end;




              procedure QuickSort(var Arr:massive; count:integer);
                procedure QSort(L,R:integer);
                var
                  i,j,x,tmp,k:integer;
                begin
                  i:=L;
                  j:=R;
                  x:=arr[(L+R) div 2];
                  repeat
                    while arr[i]<x do
                    begin
                      Inc(i);

                    end;
                    while arr[j]>x do
                    begin
                      Dec(j);

                    end;

                    if i<=j then
                    begin

                        tmp := arr[i];
                        Arr[i] := arr[j];
                        Arr[j] := tmp;
                      Inc(i);
                      Dec(j);

                      for k:= 1 to 5 do
                       Writeln(arr[k]);
                       Readln;
                    end;
                  until i>j;
                  if j>L then QSort(L,J);
                  if i<R then QSort(I,R);
                end;
              var L, R: Integer;
              begin

                L := 1;
                R := count;
                QSort(L,R);
              end;

begin


   arr[1]:=0;
   arr[2]:=0;
   arr[3]:=0;
   arr[4]:=0;
   arr[5]:=0;


    QuickSort(arr,5);
   for i:= 1 to 5 do
                       Writeln(arr[i]);

   Readln;
end.
