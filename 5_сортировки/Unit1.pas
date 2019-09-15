    unit Unit1;

    interface

    uses
      Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, Grids, StdCtrls, Buttons, mmsystem;

    type
      TForm1 = class(TForm)
        tablMain: TStringGrid;
        tablShapka: TStringGrid;
        btnPlay: TBitBtn;
        btnGraf: TBitBtn;
        btnExit: TBitBtn;
        procedure FormCreate(Sender: TObject);
        procedure tablMainDrawCell(Sender: TObject; ACol, ARow: Integer;
          Rect: TRect; State: TGridDrawState);
        procedure btnPlayClick(Sender: TObject);
        procedure btnGrafClick(Sender: TObject);
        procedure btnExitClick(Sender: TObject);
      private
        { Private declarations }
      public
        { Public declarations }
      end;

    var
      Form1: TForm1;

    const
      N1 = 10;
      N2 = 100;
      N3 = 2000;

    type
      massive = array[1..N3] of Integer;
      TProc = procedure (var a, b:integer);
      bin = array[1..18] of Integer;
      shak = array[1..18] of Integer;
      quick = array[1..18] of Integer;

    var
      b: bin;
      s: shak;
      q: quick;  

    implementation

    uses Unit2;

    {$R *.dfm}

    procedure TForm1.FormCreate(Sender: TObject);
    var myRect: TGridRect;
    begin
     with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
     with Form1.tablShapka do
          begin
            Selection := myRect;
            cells[1,0] := ' Бинарные вставки (1)';
            cells[2,0] := ' Шейкерная сортировка (2)';
            cells[3,0] := ' Быстрая сортировка (3)';
            cells[0,0] := ' Сортировки';
          end;
      with Form1.tablMain do
          begin
            Selection := myRect;
            end;
    end;

    procedure TForm1.tablMainDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    begin

      with Form1.tablMain do
      begin
      if ((ACol=1) and (ARow=0)) or ((ACol=3) and (ARow=0)) or ((ACol=5) and (ARow=0)) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' Число');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' сравнений');
      end;

      if ((ACol=2) and (ARow=0)) or ((ACol=4) and (ARow=0)) or ((ACol=6) and (ARow=0)) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' Число');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' перестановок');
      end;

      if (ACol=0) and (ARow=0) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' Тип');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' массива');
      end;

      if (ACol=0) and (ARow=1) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' 10 элементов');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' неотсорт.');
      end;
      if (ACol=0) and (ARow=2) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' 10 элементов');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' отсорт.');
      end;
      if (ACol=0) and (ARow=3) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' 10 элементов');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' обратный');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')*2+Rect.Top+2, ' порядок');
      end;
      if (ACol=0) and (ARow=4) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' 100 элементов');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' неотсорт.');
      end;
      if (ACol=0) and (ARow=5) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' 100 элементов');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' отсорт.');
      end;
      if (ACol=0) and (ARow=6) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' 100 элементов');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' обратный');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')*2+Rect.Top+2, ' порядок');
      end;
      if (ACol=0) and (ARow=7) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' 2000 элементов');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' неотсорт.');
      end;
      if (ACol=0) and (ARow=8) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' 2000 элементов');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' отсорт.');
      end;
      if (ACol=0) and (ARow=9) then
      begin
        Canvas.TextOut(Rect.Left+2, Rect.Top+2, ' 2000 элементов');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')+Rect.Top+2, ' обратный');
        Canvas.TextOut(Rect.Left+2, Canvas.TextHeight('A')*2+Rect.Top+2, ' порядок');
      end;
      end;
    end;

              procedure chan(var a, b:integer);
              var
                temp:integer;
              begin
                temp := a;
                a := b;
                b := temp;
              end;

              //Бинарная вставка
              procedure bininsert(a: massive; const N: integer; var cmp, swap: integer);
              var
                i, j, x, L, R, m:integer;
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
              procedure shaker(change: TProc; a:massive; const N: Integer; var cmp, swap: integer);
              var
                j, L, R, k: integer;
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
                          change(a[j-1], a[j]);
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
                          change(a[j-1], a[j]);
                          K := j;
                        end;
                    end;
                  R := K-1;
                until L>R;
              end;


              procedure QuickSort( Arr:massive; count:integer;  var compares, swappes: integer);
                procedure QSort(L,R:integer);
                var
                  i,j,x,tmp:integer;
                begin
                  i:=L;
                  j:=R;
                  x:=arr[(L+R) div 2];
                  repeat
                    while arr[i]<x do
                    begin
                      Inc(i);
                      Inc(Compares);
                    end;
                    while arr[j]>x do
                    begin
                      Dec(j);
                      Inc(Compares);
                    end;
                    Inc(Compares, 2);
                    if i<=j then
                    begin
                      Inc(Swappes,3);
                        tmp := arr[i];
                        Arr[i] := arr[j];
                        Arr[j] := tmp;
                      Inc(i);
                      Dec(j);
                    end;
                  until i>j;
                  if j>L then QSort(L,J);
                  if i<R then QSort(I,R);
                end;
              var L, R: Integer;
              begin
                Compares := 0;
                Swappes := 0;
                L := 1;
                R := count;
                QSort(L,R);
              end;


    procedure TForm1.btnPlayClick(Sender: TObject);
    var ten, hun, two: massive;
    i,j: Integer;
    begin
      btnGraf.Visible := True;
      PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
      for i := 1 to N1 do
        ten[i] := Random(1000);
      for i := 1 to N2 do
        hun[i] := Random(1000);
      for i := 1 to N3 do
        two[i] := Random(1000);

      bininsert(ten, N1, b[1], b[2]);
      Form1.tablMain.Cells [1,1] := IntToStr(b[1]);
      Form1.tablMain.Cells [2,1] := IntToStr(b[2]);
      bininsert(hun, N2, b[3], b[4]);
      Form1.tablMain.Cells [1,4] := IntToStr(b[3]);
      Form1.tablMain.Cells [2,4] := IntToStr(b[4]);
      bininsert(two, N3, b[5], b[6]);
      Form1.tablMain.Cells [1,7] := IntToStr(b[5]);
      Form1.tablMain.Cells [2,7] := IntToStr(b[6]);

      shaker(chan, ten, N1, s[1], s[2]);
      Form1.tablMain.Cells [3,1] := IntToStr(s[1]);
      Form1.tablMain.Cells [4,1] := IntToStr(s[2]);
      shaker(chan, hun, N2, s[3], s[4]);
      Form1.tablMain.Cells [3,4] := IntToStr(s[3]);
      Form1.tablMain.Cells [4,4] := IntToStr(s[4]);
      shaker(chan, two, N3, s[5], s[6]);
      Form1.tablMain.Cells [3,7] := IntToStr(s[5]);
      Form1.tablMain.Cells [4,7] := IntToStr(s[6]);


      QuickSort(ten, N1, q[1], q[2]);
      Form1.tablMain.Cells [5,1] := IntToStr(q[1]);
      Form1.tablMain.Cells [6,1] := IntToStr(q[2]);
      QuickSort(hun, N2, q[3], q[4]);
      Form1.tablMain.Cells [5,4] := IntToStr(q[3]);
      Form1.tablMain.Cells [6,4] := IntToStr(q[4]);
      QuickSort(two, N3, q[5], q[6]);
      Form1.tablMain.Cells [5,7] := IntToStr(q[5]);
      Form1.tablMain.Cells [6,7] := IntToStr(q[6]);

      for i := 1 to N1 do
        ten[i] := i;
      for i := 1 to N2 do
        hun[i] := i;
      for i := 1 to N3 do
        two[i] := i;

      bininsert(ten, N1, b[7], b[8]);
      Form1.tablMain.Cells [1,2] := IntToStr(b[7]);
      Form1.tablMain.Cells [2,2] := IntToStr(b[8]);
      bininsert(hun, N2, b[9], b[10]);
      Form1.tablMain.Cells [1,5] := IntToStr(b[9]);
      Form1.tablMain.Cells [2,5] := IntToStr(b[10]);
      bininsert(two, N3, b[11], b[12]);
      Form1.tablMain.Cells [1,8] := IntToStr(b[11]);
      Form1.tablMain.Cells [2,8] := IntToStr(b[12]);

      shaker(chan, ten, N1, s[7], s[8]);
      Form1.tablMain.Cells [3,2] := IntToStr(s[7]);
      Form1.tablMain.Cells [4,2] := IntToStr(s[8]);
      shaker(chan, hun, N2, s[9], s[10]);
      Form1.tablMain.Cells [3,5] := IntToStr(s[9]);
      Form1.tablMain.Cells [4,5] := IntToStr(s[10]);
      shaker(chan, two, N3, s[11], s[12]);
      Form1.tablMain.Cells [3,8] := IntToStr(s[11]);
      Form1.tablMain.Cells [4,8] := IntToStr(s[12]);

      QuickSort(ten, N1, q[7], q[8]);
      Form1.tablMain.Cells [5,2] := IntToStr(q[7]);
      Form1.tablMain.Cells [6,2] := IntToStr(q[8]);
      QuickSort(hun, N2, q[9], q[10]);
      Form1.tablMain.Cells [5,5] := IntToStr(q[9]);
      Form1.tablMain.Cells [6,5] := IntToStr(q[10]);
      QuickSort(two, N3, q[11], q[12]);
      Form1.tablMain.Cells [5,8] := IntToStr(q[11]);
      Form1.tablMain.Cells [6,8] := IntToStr(q[12]);

      j := 1;
      for i := N1 downto 1 do
        begin
          ten[i] := j;
          Inc(j);
        end;
      j := 1;
      for i := N2 downto 1 do
        begin
          hun[i] := j;
          Inc(j);
        end;
      j := 1;
      for i := N3 downto 1 do
        begin
          two[i] := j;
          Inc(j);
        end;

      bininsert(ten, N1, b[13], b[14]);
      Form1.tablMain.Cells [1,3] := IntToStr(b[13]);
      Form1.tablMain.Cells [2,3] := IntToStr(b[14]);
      bininsert(hun, N2, b[15], b[16]);
      Form1.tablMain.Cells [1,6] := IntToStr(b[15]);
      Form1.tablMain.Cells [2,6] := IntToStr(b[16]);
      bininsert(two, N3, b[17], b[18]);
      Form1.tablMain.Cells [1,9] := IntToStr(b[17]);
      Form1.tablMain.Cells [2,9] := IntToStr(b[18]);

      shaker(chan, ten, N1, s[13], s[14]);
      Form1.tablMain.Cells [3,3] := IntToStr(s[13]);
      Form1.tablMain.Cells [4,3] := IntToStr(s[14]);
      shaker(chan, hun, N2, s[15], s[16]);
      Form1.tablMain.Cells [3,6] := IntToStr(s[15]);
      Form1.tablMain.Cells [4,6] := IntToStr(s[16]);
      shaker(chan, two, N3, s[17], s[18]);
      Form1.tablMain.Cells [3,9] := IntToStr(s[17]);
      Form1.tablMain.Cells [4,9] := IntToStr(s[18]);

      QuickSort(ten, N1, q[13], q[14]);
      Form1.tablMain.Cells [5,3] := IntToStr(q[13]);
      Form1.tablMain.Cells [6,3] := IntToStr(q[14]);
      QuickSort(hun, N2, q[15], q[16]);
      Form1.tablMain.Cells [5,6] := IntToStr(q[15]);
      Form1.tablMain.Cells [6,6] := IntToStr(q[16]);
      QuickSort(two, N3, q[17], q[18]);
      Form1.tablMain.Cells [5,9] := IntToStr(q[17]);
      Form1.tablMain.Cells [6,9] := IntToStr(q[18]);
    end;

    procedure TForm1.btnGrafClick(Sender: TObject);
    begin
    PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
    Form2.Show;
    end;

    procedure TForm1.btnExitClick(Sender: TObject);
    var i: Integer;
    begin
    PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\1.wav', 0, SND_ASYNC);
    i := 0;
    while i<10 do
     begin
        sleep(45); // 100 раз по 100 мс = 10 сек.
        Application.ProcessMessages;
        inc(i);
     end;
    Close;
    end;

    end.
