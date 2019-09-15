  {–ешить задачу двум€ способами Ц с применением рекурсии и без нее.
  ѕусть x1= x2= x3=1, xi = xi-1 + xi-2, i = 4, 5 Е. Ќайти: (от i=1 до 100)E(xi/2^i)}
    program recur;

    {$APPTYPE CONSOLE}

    uses
      SysUtils;

    const
      MaxN = 100;

    var
      Sum1, sum2,  factor:Extended;

    function  GetSum(factor, x0, x1:extended; N:Integer):Real;
    var
      x:Real;
    begin
      {Writeln('pri n = ',n, '  factor = ' , factor, '  xo = ' ,x0);
      Writeln('  x1 = ' , x1); }
      if  N <= MaxN then
      begin
        x := x0+x1;
        Result := factor*x + GetSum(factor/2, x1, x0+x1, N+1);
        {Writeln('pri n = ',N,'   ',Result:1:10)}
      end;
    end;

    procedure calculateSum(var Sum:Extended);
    var
      N:Integer;
      next, x1, x2, factor:Extended;
    begin
      sum := 7/8;
      N := 4;
      x1 := 1;
      x2 := 1;
      factor := 1/8;
      while n <= 100 do
      begin
        next := x1 + x2;
        factor := factor / 2;
        sum := factor * next + Sum;
        x1 := x2;
        x2 := next;
        n := n + 1;
      end;
    end;

    begin
      factor := 1/16;
      Sum1 := GetSum(factor, 1, 1, 4);
      Sum1 := 7/8 + Sum1;
      Writeln(sum1:1:10);
      calculateSum(Sum2);
      Writeln(Sum2:1:10);
      Readln
    end.
 