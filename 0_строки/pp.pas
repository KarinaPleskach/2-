{п.1. - Напечатать все слова, отличные от последнего слова,
в которые последняя буква входит еще раз.
п.2. - Напечатать все слова, отличные от последнего слова,
преобразовав их таким образом: после каждой буквы q добавить букву u.
Разработчик - Плескач К. С. 27.12.2017г.}
{Заголовок программы}
Program stroka;
   {Описания}
   {Раздел типов}   
   type
      MassivSlov = array[1..128] of string;
   {Раздел переменных}
   Var 
      Ishod: string; {Исходная строка}
      Slovo: MassivSlov; {Массив, отвечающий за отдельные слова строки}
      k: integer; {Вспомогательные переменные}
   {Раздел процедур и функций}  
   Procedure Vvod_Ishodnoi_Stroki (Var x: string);
      Begin
         Write('Введите строку: ');
         Readln(x);
      End;
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
         {Определение последнего слова}   
         If Length(x)> 0 
            Then
               Begin
                  k := k+1; 
                  a[k] := x 
               End
      End;    
    Procedure Zadanie1 (k: integer; var x: MassivSlov);
       Const
          st1 = ' ';
       Var
          i, m: integer;
       Function Poslednee_Slovo_Ne_Sovpadaet_s_Dannim (x: MassivSlov; a, b : integer): boolean;
          begin
             if (x[a] <> x[b])
                then
                   result:= true
                else
                   result:= false;
          end;
   Begin
      For i := 1 to (k-1) do
        if Poslednee_Slovo_Ne_Sovpadaet_s_Dannim(slovo, i, k) {Сравнение каждого слова с последним}
           then
              begin
              {Сравнение каждой буквы слова с его последней буквой}
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
       Function Poslednee_Slovo_Ne_Sovpadaet_s_Dannim (x: MassivSlov; a, b : integer): boolean;
          begin
             if (x[a] <> x[b])
                then
                   result:= true
                else
                   result:= false;
          end;
   Begin
   For i := 1 to (k-1) do
      If Poslednee_Slovo_Ne_Sovpadaet_s_Dannim(slovo, i, k) 
         Then  
            Begin 
            {Поиск в слове буквы q и постановка после нее буквы u}
            For m:=1 to length(x[i]) do
               If x[i][m] = q 
                  Then 
                     write(x[i][m]+u)
                  Else 
                     write(x[i][m]);
            write(' ');   
            End
   End;
   {Вычисления}   
   Begin 
   {Ввод исходной строки}
   Vvod_Ishodnoi_Stroki(Ishod);
   {Разделение строки на отдельные слова}
   Razdelenie_stroki_Na_Slova(Ishod, Slovo, k);
   {Нахождение и выводна экран строки, отвечающей 1 пункту задания}
   Write('Сторока 1: ');
   Zadanie1 (k, Slovo);
   Writeln;    
   {Нахождение и выводна экран строки, отвечающей 2 пункту задания}
   Write('Сторока 2: ');
   Zadanie2 (k, Slovo);
   Readln; 
   End.