    {Задание № 14
    В некоторой библиотеке последний четверг каждого месяца - санитарный день.
    Дано натуральное число n, означающее номер года. Получить по порядку все числа,
    на которые в январе, феврале, ...., декабре указанного года приходится санитарный день.
    ИСПОЛЬЗОВАТЬ ТИП "ПЕРЕЧИСЛЕНИЕ".
    Разработчик - Плескач К. С. 08.03.2018г.}
    {Заголовок программы}
    program laba2;

    {$APPTYPE CONSOLE}

    uses
      SysUtils;

    {Описания}
    {Раздел типов}
    type
      Ned = (Vs, Pn, Vt, Sr, Ch, Pt, Sb);
      Mesyc = (Yan, Fev, Mar, Apr, Mai, Iun, Iul, Avg, Sen, Okt, Noy, Dek);
    {Раздел переменных}
    var
      nstr: string;
      flag: Boolean;
      Kodgoda, KodMes, i, a, n, cod: Integer;
      Mes: Mesyc;
      Day: Ned;
    {Раздел процедур и функций}
    {Определение високосного года}
    function Ne_Visocosni_God (x: integer): boolean;
      begin
        if (x mod 4 <> 0) or (x mod 100 = 0) and (x mod 400 <> 0)
          then
            Result := True
          else
            Result := False
      end;
    {Вычисление кода года}
    procedure Kod_Goda (x: Integer; var Kod: integer);
      var v: Integer;
      begin
        v := x - 1800;
        while v >= 100 do
          v := v - 100;
        Kod := v;
        v := v div 4;
        Kod := Kod + v;
          if (x >= 1800) and (x <= 1899)
            then
              Kod := Kod + 3;
          if (x >= 1900) and (x <= 1999)
            then
              Kod := Kod + 1;
          if (x >= 2100) and (x <= 2199)
            then
              Kod := Kod + 5;
          while Kod >= 7 do
            begin
              Kod := Kod - 7
            end
      end;
    {Нахождение последнего четверга кадого месяца}
    procedure Vivod (var n, KodM, KodG: integer; var D: Ned);
      var i, v: Integer;
      Begin
        for i := n downto (n-6) do
          begin
            v := i + KodM + KodG;
            while v >= 7 do
              begin
                v := v - 7
              end;
              if v = ord(D)
                then
                  begin
                     case Mes of
                     Yan: Writeln('In January: ',i);
                     Fev: Writeln('In February: ',i);
                     Mar: Writeln('In March: ',i);
                     Apr: Writeln('In April: ',i);
                     Mai: Writeln('In May: ',i);
                     Iun: Writeln('In June: ',i);
                     Iul: Writeln('In July: ',i);
                     Avg: Writeln('In August: ',i);
                     Sen: Writeln('In September: ',i);
                     Okt: Writeln('In October: ',i);
                     Noy: Writeln('In November: ',i);
                     Dek: Writeln('In December: ',i)
                     end
                  end
          end
      end;
    function Ne_Podhodit (x: Integer; var a: string): Boolean;
      begin
        if  not (a[x] in ['0'..'9'])
          then
            Result := True
          else
            Result := False
      end;
    procedure Delete_Probeli (var n: string);
      const
          probel = ' ';
      begin
        while Pos(probel, n)<>0 do
          Delete (n, Pos(probel, n), 1)
      end;
    {Вычисления}
    begin
      {Ввод года с клавиатуры}
      repeat
        Write('Enter year: ');
        readln(nstr);
        Delete_Probeli (nstr);
        flag := True;
        {for i := 1 to Length(nstr) do
           begin
             if Ne_Podhodit(k, nstr)
             then
             begin
               flag:= false;
               Break;
             end;
           end;
         if Length(nstr)=0
          then
           flag := False;  }
         for i := 1 to Length(nstr) do
          begin
            if nstr[i] = '-'
              then
                begin
                  flag := False;
                  break
                end
          end;
         Val(nstr, n, cod);
         if cod <> 0
          then
            flag := False;
         if (flag = False)
         then
            Writeln('Nekorektni symvol, poprobuite escho raz');
       until flag = True;
      Day := Ch;
      {Так как григорианский календарь повторяется каждые 400 лет}
      while n < 1800 do
        begin
          n := n + 400
        end;
      while n >= 2200 do
        begin
          n := n - 400
        end;
      {Вычисления для невисокосного года}
      if Ne_Visocosni_God (n)
        then
        begin
          {Вычисления кода года}
          Kod_Goda (n, Kodgoda);
          {Цикл нахождения последнего четверга каждого месяца}
          Mes := Yan;
          for i := 1 to 12 do
            begin
              {Значение последнего дня каждого месяца}
              case Mes of
               Yan, Mar, Mai, Iul, Avg, Okt, Dek: a := 31;
               Apr, Iun, Sen, Noy: a := 30;
               Fev: a := 28
              end;
              {Присваивание кода каждого месяца для невисокосного года}
              case Mes of
               Yan: KodMes := 6;
               Fev: KodMes := 2;
               Mar: KodMes := 2;
               Apr: KodMes := 5;
               Mai: KodMes := 0;
               Iun: KodMes := 3;
               Iul: KodMes := 5;
               Avg: KodMes := 1;
               Sen: KodMes := 4;
               Okt: KodMes := 6;
               Noy: KodMes := 2;
               Dek: KodMes := 4
              end;
              {Нахождение и вывод на экран итоговыого дня}
              Vivod (a, KodMes, Kodgoda, Day);
              Mes := Succ(Mes)
            end
        end
        {Вычисления для високосных годов}
        else
        begin
          {Вычисления кода года}
          Kod_Goda (n, Kodgoda);
          {Цикл нахождения последнего четверга каждого месяца}
          Mes := Yan;
          for i := 1 to 12 do
            begin
              {Значение последнего дня каждого месяца}
              case Mes of
               Yan, Mar, Mai, Iul, Avg, Okt, Dek: a := 31;
               Apr, Iun, Sen, Noy: a := 30;
               Fev: a := 29
              end;
              {Присваивание кода каждого месяца для високосного года}
              case Mes of
               Yan: KodMes := 5;
               Fev: KodMes := 1;
               Mar: KodMes := 2;
               Apr: KodMes := 5;
               Mai: KodMes := 0;
               Iun: KodMes := 3;
               Iul: KodMes := 5;
               Avg: KodMes := 1;
               Sen: KodMes := 4;
               Okt: KodMes := 6;
               Noy: KodMes := 2;
               Dek: KodMes := 4
              end;
              {Нахождение и вывод на экран итоговыого дня}
              Vivod (a, KodMes, Kodgoda, Day);
              Mes := Succ(Mes)
            end
        end;
      readln
    end.
