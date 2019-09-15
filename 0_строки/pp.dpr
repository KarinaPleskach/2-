{�.1. - ���������� ��� �����, �������� �� ���������� �����,
� ������� ��������� ����� ������ ��� ���.
�.2. - ���������� ��� �����, �������� �� ���������� �����,
������������ �� ����� �������: ����� ������ ����� q �������� ����� u.
����������� - ������� �. �. 27.12.2017�.}
{��������� ���������}
program pp;

{$APPTYPE CONSOLE}

uses
  SysUtils;

{��������}
   {������ �����}
   type
      MassivSlov = array[1..128] of string;
   {������ ����������}
   Var
      Ishod: string; {�������� ������}
      Slovo: MassivSlov; {������, ���������� �� ��������� ����� ������}
      k, i: integer; {��������������� ����������}
      flag: Boolean;
   {������ �������� � �������}
   Procedure Vvod_Ishodnoi_Stroki (Var x: string);
      Begin
         Write('Vvedite stroky: ');
         Readln(x);
      End;
   function NePodhodit ( x:Integer; var a: string): boolean;
   begin
     if not (a[x] in ['a'..'z', 'A'..'Z',' '])
         then
           Result := true
            else
           result:= false
   end;
   Procedure Razdelenie_stroki_Na_Slova(x: string; var a: MassivSlov; var k: integer);
      Const
         st1 = ' ';
      Begin
         k := 0;
         While pos(st1,x) <> 0 do
            if pos(st1,x)=1
               Then Delete(x,1,1)
               Else
                  Begin
                     k := k+1;
                     a[k] := Copy(x,1,pos(st1,x)-1);
                     Delete(x,1,pos(st1,x));
                  End;
         {����������� ���������� �����}
         If Length(x)> 0
            Then
               Begin
                  k := k+1;
                  a[k] := x
               End
      End;
   Function Poslednee_Slovo_Ne_Sovpadaet_s_Dannim (x: MassivSlov; a, b : integer): boolean;
          begin
             if (x[a] <> x[b])
                then
                   result:= true
                else
                   result:= false;
          end;
    Procedure Zadanie1 (k: integer; var x: MassivSlov);
       Const
          st1 = ' ';
       Var
          i, m: integer;
   Begin
      For i := 1 to (k-1) do
        if Poslednee_Slovo_Ne_Sovpadaet_s_Dannim(slovo, i, k) {��������� ������� ����� � ���������}
           then
              begin
              {��������� ������ ����� ����� � ��� ��������� ������}
              for m:=1 to length(x[i])-1 do
                 if x[i][length(x[i])] = x[i][m]
                    then
                       Begin
                          write(x[i]+st1);
                          Break
                       End
              end;
   End;
   Procedure Zadanie2 (k: integer; var x: MassivSlov);
       Const
         st1 = ' ';
         q = 'q';
         u = 'u';
       Var
          i, m: integer;
   Begin
   For i := 1 to (k-1) do
      If Poslednee_Slovo_Ne_Sovpadaet_s_Dannim(slovo, i, k)
         Then
            Begin
            {����� � ����� ����� q � ���������� ����� ��� ����� u}
            For m:=1 to length(x[i]) do
               If x[i][m] = q
                  Then
                     write(x[i][m]+u)
                  Else
                     write(x[i][m]);
            write(' ');
            End
   End;
{����������}
begin
   {���� �������� ������ � ��������}
   repeat
     flag := True;
     Vvod_Ishodnoi_Stroki(Ishod);
     for i:=1 to Length(Ishod) do
       begin
         if NePodhodit(i, Ishod)
         then
         begin
           flag:= false;
           Break;
         end;
       end;
     if Length(ishod)=0
     then
       flag := False;
     if flag
      then
        begin
          flag := False;
          for i := 1 to Length(Ishod) do
            begin
              if (not (Ishod[i] in ['a'..'z', 'A'..'Z']))
                then
                  flag := false
                else
                begin
                  flag := True;
                  break
                end
            end;
        end;
     if (flag = False)
     then
        Writeln('Nekorektni symvol, poprobuite escho raz');
   until flag = True;
   {���������� ������ �� ��������� �����}
   Razdelenie_stroki_Na_Slova(Ishod, Slovo, k);
   {���������� � ����� �� ����� ������, ���������� 1 ������ �������}
   Write('Stroka 1: ');
   Zadanie1 (k, Slovo);
   Writeln;
   {���������� � ����� �� ����� ������, ���������� 2 ������ �������}
   Write('Stroka 2: ');
   Zadanie2 (k, Slovo);
   Readln;
end.
