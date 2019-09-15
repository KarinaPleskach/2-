    unit Unit1;

    interface

    uses
      Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, StdCtrls, mmsystem, Buttons, jpeg, ExtCtrls, ComCtrls, Grids;

    type
      TFunc = function (x:Real):Real;
      TFormMain = class(TForm)
    btnCalculate: TBitBtn;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    lblName: TLabel;
    tabl1: TStringGrid;
    tabl2: TStringGrid;
    imgGrafic: TImage;
    procedure btnCalculateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
      private
        { Private declarations }
      public
        { Public declarations }
      end;

    var
      FormMain: TFormMain;
      N: Integer;

    const
      Eps1:Real =  0.01;
      Eps2:Real = 0.001;
      a1:Real = 0.4;
      b1:Real = 1.2;
      a2:Real = 2.1;
      b2:Real = 3.6;
      a3:Real = 0.3;
      b3:Real = 0.9;
      a4:Real = 0.8;
      b4:Real = 1.2;

    implementation

    {$R *.dfm}


    procedure TFormMain.FormCreate(Sender: TObject);
    var myRect: TGridRect;
    begin
      with myRect do
      begin
        Left := -1;
        Top := -1;
        Right := -1;
        Bottom := -1;
      end;
      with FormMain.tabl1 do
      begin
      Selection := myRect;
      Cells[0,0] := 'Right Rectangle Method';
      cells[1,0] := 'Value';
      Cells[2,0] := 'N';
      cells[0,1] := 'Eps =  0.01';
      Cells[0,2] := 'Eps =  0.001';
      end;
      with FormMain.tabl2 do
      begin
      Selection := myRect;
      Cells[0,0] := 'Trapezoid Method';
      cells[1,0] := 'Value';
      Cells[2,0] := 'N';
      cells[0,1] := 'Eps =  0.01';
      Cells[0,2] := 'Eps =  0.001';
      end;

      ImgGrafic.Canvas.MoveTo(30, 20);
      ImgGrafic.Canvas.LineTo(30, 177);
      ImgGrafic.Canvas.LineTo(397, 177);

      ImgGrafic.Canvas.MoveTo(30-5, 20+5);
      ImgGrafic.Canvas.LineTo(30, 20);
      ImgGrafic.Canvas.LineTo(30+5, 20+5);

      ImgGrafic.Canvas.MoveTo(397-5, 177-5);
      ImgGrafic.Canvas.LineTo(397, 177);
      ImgGrafic.Canvas.LineTo(397-5, 177+5);


      ImgGrafic.Canvas.TextOut(30-10, 20-10, 'Y');
      ImgGrafic.Canvas.TextOut(397+10, 177-10, 'X');
      ImgGrafic.Canvas.TextOut(30-5, 177+5, '0');
    end;

    function  F_1(x:Real): Real; far;
    begin
      Result := Sqrt(2*sqr(x)+1)/(0.8*x+sqrt(0.5*x+2));
    end;

    function  F_2(x:Real): Real; far;
    begin
      Result := 1/sqrt(sqr(x)-3);
    end;

    function  F_3(x:Real): Real; far;
    begin
      Result := Sin(Sqr(x)+0.6)/(1.5+cos(0.8*x+1.2));
    end;

    function  F_4(x:Real): Real; far;
    begin
      Result := Sin(Sqr(x)-0.4)/(x+2);
    end;

    function  Right_Rectangle_Method(F:TFunc; const a, b, eps:Real): Real;
    var
      H, Pred, Now, x:Real;
      i:Integer;
    begin
      N := 1;
      Now := F(a)*(b-a);
      repeat
        Pred := Now;
        Now := 0;
        N := N * 2;
        h := (b-a)/n;
        for i := 1 to N do
        begin
          x := a + i*h;
          Now := Now + F(x);
        end;
        Now := Now * H;
      until Abs(Now-Pred) <= eps;
      result := Now;
    end;

    function  Trapezoid_Method(F:TFunc;const a, b, eps:Real): Real;
    var
      H, Pred, Now, x: Real;
      i: Integer;
    begin
      N := 1;
      Now := (b-a)/n*(F(a)+F(b))/2;
      repeat
        Pred := Now;
        Now := (F(a)+F(b))/2;
        N := N * 2;
        h := (b-a)/n;
        for i := 1 to N-1 do
        begin
          x := a + i*h;
          Now := Now + F(x);
        end;
        Now := Now * H;
      until Abs(Now-Pred) <= eps;
      result := Now;
    end;

    procedure Draw_Grafic(F:TFunc;const a, b:Real);
    const
      HReal:Real = 0.01;
      HInt = 1;
    var
      N, i:Integer;
      x, y, max, min:real;
    begin
      FormMain.imgGrafic.Picture := nil;
      with FormMain do
      begin
      ImgGrafic.Canvas.MoveTo(30, 20);
      ImgGrafic.Canvas.LineTo(30, 177);
      ImgGrafic.Canvas.LineTo(397, 177);

      ImgGrafic.Canvas.MoveTo(30-5, 20+5);
      ImgGrafic.Canvas.LineTo(30, 20);
      ImgGrafic.Canvas.LineTo(30+5, 20+5);

      ImgGrafic.Canvas.MoveTo(397-5, 177-5);
      ImgGrafic.Canvas.LineTo(397, 177);
      ImgGrafic.Canvas.LineTo(397-5, 177+5);


      ImgGrafic.Canvas.TextOut(30-10, 20-10, 'Y');
      ImgGrafic.Canvas.TextOut(397+10, 177-10, 'X');

      imgGrafic.Canvas.Pen.Width := 2;
      ImgGrafic.Canvas.Pen.Color := clMaroon;
      end;

        N := round(b*100);
        x := a;
        i := round(a*100);
        FormMain.ImgGrafic.Canvas.TextOut(30+i, 177+5, FloatToStr(a));
        FormMain.imgGrafic.Canvas.TextOut(30+N, 177+5, FloatToStr(b));
        y := f(x);
        min := y;
        max := y;
        FormMain.ImgGrafic.Canvas.MoveTo(30+i, 177-(Round(y*100)));
        while i <= N do
        begin
          x := x + HReal;
          y := f(x);
          i := i + HInt;
          FormMain.ImgGrafic.Canvas.LineTo(30+i, 177-(Round(y*100)));
          if min > y then
            min := y;
          if max < y then
            max := y;
        end;

      FormMain.ImgGrafic.Canvas.Pen.Color := clBlack;
      FormMain.ImgGrafic.Canvas.TextOut(0, 177-round(max*100)-10, FormatFloat('0.00', max));
      FormMain.ImgGrafic.Canvas.TextOut(0, 177-round(min*100), FormatFloat('0.00', min));
    end;

    procedure TFormMain.btnCalculateClick(Sender: TObject);
      begin
        PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        if  rb1.Checked then
        begin
          with FormMain.tabl1 do
          begin
          Cells[1,1] := FormatFloat('0.000000',Right_Rectangle_Method(F_1, a1, b1, eps1));
          cells[2,1] := IntToStr(N);
          Cells[1,2] := FormatFloat('0.000000',Right_Rectangle_Method(F_1, a1, b1, eps2));
          cells[2,2] := IntToStr(N);
          end;
          with FormMain.tabl2 do
          begin
          Cells[1,1] := FormatFloat('0.000000',Trapezoid_Method(F_1, a1, b1, eps1));
          cells[2,1] := IntToStr(N);
          Cells[1,2] := FormatFloat('0.000000',Trapezoid_Method(F_1, a1, b1, eps2));
          cells[2,2] := IntToStr(N);
          end;
          Draw_Grafic(F_1, a1, b1);
        end;
        if  rb2.Checked then
        begin
          with FormMain.tabl1 do
          begin
          Cells[1,1] := FormatFloat('0.000000',Right_Rectangle_Method(F_2, a2, b2, eps1));
          cells[2,1] := IntToStr(N);
          Cells[1,2] := FormatFloat('0.000000',Right_Rectangle_Method(F_2, a2, b2, eps2));
          cells[2,2] := IntToStr(N);
          end;
          with FormMain.tabl2 do
          begin
          Cells[1,1] := FormatFloat('0.000000',Trapezoid_Method(F_2, a2, b2, eps1));
          cells[2,1] := IntToStr(N);
          Cells[1,2] := FormatFloat('0.000000',Trapezoid_Method(F_2, a2, b2, eps2));
          cells[2,2] := IntToStr(N);
          end;
          Draw_Grafic(F_2, a2, b2);
        end;
        if  rb3.Checked then
        begin
          with FormMain.tabl1 do
          begin
          Cells[1,1] := FormatFloat('0.000000',Right_Rectangle_Method(F_3, a3, b3, eps1));
          cells[2,1] := IntToStr(N);
          Cells[1,2] := FormatFloat('0.000000',Right_Rectangle_Method(F_3, a3, b3, eps2));
          cells[2,2] := IntToStr(N);
          end;
          with FormMain.tabl2 do
          begin
          Cells[1,1] := FormatFloat('0.000000',Trapezoid_Method(F_3, a3, b3, eps1));
          cells[2,1] := IntToStr(N);
          Cells[1,2] := FormatFloat('0.000000',Trapezoid_Method(F_3, a3, b3, eps2));
          cells[2,2] := IntToStr(N);
          end;
          Draw_Grafic(F_3, a3, b3);
        end;
        if  rb4.Checked then
        begin
          with FormMain.tabl1 do
          begin
          Cells[1,1] := FormatFloat('0.000000',Right_Rectangle_Method(F_4, a4, b4, eps1));
          cells[2,1] := IntToStr(N);
          Cells[1,2] := FormatFloat('0.000000',Right_Rectangle_Method(F_4, a4, b4, eps2));
          cells[2,2] := IntToStr(N);
          end;
          with FormMain.tabl2 do
          begin
          Cells[1,1] := FormatFloat('0.000000',Trapezoid_Method(F_4, a4, b4, eps1));
          cells[2,1] := IntToStr(N);
          Cells[1,2] := FormatFloat('0.000000',Trapezoid_Method(F_4, a4, b4, eps2));
          cells[2,2] := IntToStr(N);
          end;
          Draw_Grafic(F_4, a4, b4);
        end;
      end;


end.
