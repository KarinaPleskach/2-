program LabaMnojestvo;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Type
  mnojestvo = set of 0..9;


Var
  tuzik : mnojestvo;
  t, u, z, i, k, a, r : 0..9;
  chislo1, chislo2, n : Integer;

begin
  n:= 0;
  tuzik := [ ];
  for t := 5 to 9 do
    begin
      tuzik := tuzik + [t];
      for u := 0 to 9 do
        if not (u in tuzik)
          then
            begin
              tuzik := tuzik + [u];
              for z := 0 to 9 do
                if not (z in tuzik)
                  then
                    begin
                      tuzik := tuzik + [z];
                      for i := 0 to 9 do
                        if not (i in tuzik)
                          then
                            begin
                              tuzik := tuzik + [i];
                              for k := 0 to 9 do
                                if not (k in tuzik)
                                  then
                                    begin
                                      tuzik := tuzik + [k];
                                      chislo1 := t*10000 + u*1000 + z*100 + i*10 + k;
                                      chislo2 := chislo1*2;
                                      a := chislo2 div 10000;
                                      a := a mod 10;
                                      r := chislo2 div 1000;
                                      r := r mod 10;
                                      if (chislo2 = k*100000 + a*10000 + r*1000 + t*100 + u*10 + z) and (not (a in tuzik)) and (not (r in tuzik))
                                        then
                                        begin
                                          Writeln (chislo1,' + ',chislo1,' = ',chislo2);
                                          inc(n);
                                          Writeln ('Vsego:  ', n);
                                          end;
                                          Exclude(tuzik, k)
                                    end;
                              tuzik := tuzik - [i]
                            end;
                      tuzik := tuzik - [z]
                    end;
              tuzik := tuzik - [u]
            end;
      tuzik := tuzik - [t]
    end;
  Readln
end.
 