  {Решить задачу двумя способами – с применением рекурсии и без нее.
  Пусть x1= x2= x3=1, xi = xi-1 + xi-2, i = 4, 5 …. Найти: (от i=1 до 100)E(xi/2^i)}
  program recursion;

  {$APPTYPE CONSOLE}

  uses
    SysUtils;

  const
    n: Integer = 40;

  type
    fib_array = array [1..100] of Integer;

  var
    sum: Real;
    i: integer;

  function Power(n: integer): Real;
    begin
      if n = 1
        then
          result := 0.5
        else
          result := Power(n-1) * 0.5;
    end;

  function fib (k: integer): Integer;
    begin
      if (k = 1) or (k = 2) or (k = 3)
        then
          Result := 1
        else
          Result := fib(k-1) + fib(k-2)
    end;

  function Rec(n:integer): Real;
    begin
      if (n = 3)
        then
          Result := 7/8
        else
          Result := Rec(n-1) + fib(n) * Power(n)
    end;

///////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////

  begin
    // Подсчет суммы с помощью рекурсии
    Writeln ('Sum = ',Rec(n):5:4);
    // Подсчет суммы без рекурсии
   { Sum := 0;
    for i := 4 to n do

    for i := 1 to n do
      Sum := Sum + fib(n)/Vozvedenie_V_Stepen(n);
    Writeln ('Sum = ',Sum:3:4);  }
    Readln
  end.
