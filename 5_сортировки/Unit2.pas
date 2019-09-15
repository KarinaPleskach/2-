    unit Unit2;

    interface

    uses
      Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, StdCtrls, Buttons, mmsystem, ExtCtrls;

    type
      TForm2 = class(TForm)
        btnReturn: TBitBtn;
        lbCmp: TLabel;
        lbSwap: TLabel;
        btn10: TButton;
        btn100: TButton;
        btn2000: TButton;
        imgCmp: TImage;
        imgSwap: TImage;
    lbl1: TLabel;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
        procedure btnReturnClick(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn100Click(Sender: TObject);
    procedure btn2000Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
      private
        { Private declarations }
      public
        { Public declarations }
      end;

    var
      Form2: TForm2;

    implementation

    uses Unit1;

    {$R *.dfm}



    procedure TForm2.btnReturnClick(Sender: TObject);
    var i:Integer;
    begin
      PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        i := 0;
        while i<10 do
         begin
            sleep(45); // 100 раз по 100 мс = 10 сек.
            Application.ProcessMessages;
            inc(i);
         end;
      Form2.Close;
    end;


  procedure TForm2.btn10Click(Sender: TObject);
    begin
      PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
      Form2.imgCmp.Canvas.Brush.Color := clWhite;
      Form2.imgSwap.Canvas.Brush.Color := clWhite;
      Form2.imgCmp.Picture := nil;
      Form2.imgSwap.Picture := nil;
      Form2.imgCmp.Canvas.MoveTo(30, 20);
      Form2.imgCmp.Canvas.LineTo(30, 203);
      Form2.imgCmp.Canvas.LineTo(509, 203);
      Form2.imgSwap.Canvas.MoveTo(30, 20);
      Form2.imgSwap.Canvas.LineTo(30, 203);
      Form2.imgSwap.Canvas.LineTo(509, 203);
      Form2.ImgCmp.Canvas.TextOut(30+41+35+15,203+5,'1*');
      Form2.ImgCmp.Canvas.TextOut(30+41*2+35*4+15,203+5,'2*');
      Form2.ImgCmp.Canvas.TextOut(30+41*3+35*7+15,203+5,'3*');
      Form2.ImgSwap.Canvas.TextOut(30+41+35+15,203+5,'1*');
      Form2.imgSwap.Canvas.TextOut(30+41*2+35*4+15,203+5,'2*');
      Form2.imgSwap.Canvas.TextOut(30+41*3+35*7+15,203+5,'3*');

      Form2.imgCmp.Canvas.MoveTo(26,203-10*3);
      Form2.imgCmp.Canvas.LineTo(34,203-10*3);
      Form2.imgCmp.Canvas.TextOut(30-20,203-10*3-7,'10');
      Form2.imgCmp.Canvas.MoveTo(26,203-20*3);
      Form2.imgCmp.Canvas.LineTo(34,203-20*3);
      Form2.imgCmp.Canvas.TextOut(30-20,203-20*3-7,'20');
      Form2.imgCmp.Canvas.MoveTo(26,203-30*3);
      Form2.imgCmp.Canvas.LineTo(34,203-30*3);
      Form2.imgCmp.Canvas.TextOut(30-20,203-30*3-7,'30');
      Form2.imgCmp.Canvas.MoveTo(26,203-40*3);
      Form2.imgCmp.Canvas.LineTo(34,203-40*3);
      Form2.imgCmp.Canvas.TextOut(30-20,203-40*3-7,'40');
      Form2.imgCmp.Canvas.MoveTo(26,203-50*3);
      Form2.imgCmp.Canvas.LineTo(34,203-50*3);
      Form2.imgCmp.Canvas.TextOut(30-20,203-50*3-7,'50');
      Form2.imgCmp.Canvas.MoveTo(26,203-60*3);
      Form2.imgCmp.Canvas.LineTo(34,203-60*3);
      Form2.imgCmp.Canvas.TextOut(30-20,203-60*3-7,'60');

      Form2.imgSwap.Canvas.MoveTo(26,203-Round(10*1.4));
      Form2.imgSwap.Canvas.LineTo(34,203-Round(10*1.4));
      Form2.imgSwap.Canvas.TextOut(30-20,203-Round(10*1.4)-7,'10');
      Form2.imgSwap.Canvas.MoveTo(26,203-Round(50*1.4));
      Form2.imgSwap.Canvas.LineTo(34,203-Round(50*1.4));
      Form2.imgSwap.Canvas.TextOut(30-20,203-Round(50*1.4)-7,'50');
      Form2.imgSwap.Canvas.MoveTo(26,203-Round(135*1.4));
      Form2.imgSwap.Canvas.LineTo(34,203-Round(135*1.4));
      Form2.imgSwap.Canvas.TextOut(30-20,203-Round(135*1.4)-7,'135');

      Form2.imgCmp.Canvas.Brush.Color := clNavy;
      Form2.imgCmp.Canvas.Rectangle(71,203-b[1]*3,106,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*2+41,203-s[1]*3,106+35*3+41,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*5+41*2,203-q[1]*3,106+35*6+41*2,203);

      Form2.imgCmp.Canvas.Brush.Color := clPurple;
      Form2.imgCmp.Canvas.Rectangle(106,203-b[7]*3,106+35,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*3+41,203-s[7]*3,106+35*4+41,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*6+41*2,203-q[7]*3,106+35*7+41*2,203);

      Form2.imgCmp.Canvas.Brush.Color := clTeal;
      Form2.imgCmp.Canvas.Rectangle(106+35,203-b[13]*3,106+35*2,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*4+41,203-s[13]*3,106+35*5+41,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*7+41*2,203-q[13]*3,106+35*8+41*2,203);

      Form2.imgSwap.Canvas.Brush.Color := clNavy;
      Form2.imgSwap.Canvas.Rectangle(71,203-Round(b[2]*1.4),106,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*2+41,203-Round(s[2]*1.4),106+35*3+41,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*5+41*2,203-Round(q[2]*1.4),106+35*6+41*2,203);

      Form2.imgSwap.Canvas.Brush.Color := clPurple;
      Form2.imgSwap.Canvas.Rectangle(106,203-Round(b[8]*1.4),106+35,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*3+41,203-Round(s[8]*1.4),106+35*4+41,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*6+41*2,203-Round(q[8]*1.4),106+35*7+41*2,203);

      Form2.imgSwap.Canvas.Brush.Color := clTeal;
      Form2.imgSwap.Canvas.Rectangle(106+35,203-Round(b[14]*1.4),106+35*2,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*4+41,203-Round(s[14]*1.4),106+35*5+41,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*7+41*2,203-Round(q[14]*1.4),106+35*8+41*2,203);
    end;

    procedure TForm2.btn100Click(Sender: TObject);
    begin
      PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
      Form2.imgCmp.Canvas.Brush.Color := clWhite;
      Form2.imgSwap.Canvas.Brush.Color := clWhite;
      Form2.imgCmp.Picture := nil;
      Form2.imgSwap.Picture := nil;
      Form2.imgCmp.Canvas.MoveTo(30, 20);
      Form2.imgCmp.Canvas.LineTo(30, 203);
      Form2.imgCmp.Canvas.LineTo(509, 203);
      Form2.imgSwap.Canvas.MoveTo(30, 20);
      Form2.imgSwap.Canvas.LineTo(30, 203);
      Form2.imgSwap.Canvas.LineTo(509, 203);
      Form2.ImgCmp.Canvas.TextOut(30+41+35+15,203+5,'1*');
      Form2.ImgCmp.Canvas.TextOut(30+41*2+35*4+15,203+5,'2*');
      Form2.ImgCmp.Canvas.TextOut(30+41*3+35*7+15,203+5,'3*');
      Form2.ImgSwap.Canvas.TextOut(30+41+35+15,203+5,'1*');
      Form2.imgSwap.Canvas.TextOut(30+41*2+35*4+15,203+5,'2*');
      Form2.imgSwap.Canvas.TextOut(30+41*3+35*7+15,203+5,'3*');

      Form2.imgCmp.Canvas.MoveTo(26,203-Round(1000/28));
      Form2.imgCmp.Canvas.LineTo(34,203-Round(1000/28));
      Form2.imgCmp.Canvas.TextOut(30-28,203-Round(1000/28)-7,'1000');
      Form2.imgCmp.Canvas.MoveTo(26,203-Round(2000/28));
      Form2.imgCmp.Canvas.LineTo(34,203-Round(2000/28));
      Form2.imgCmp.Canvas.TextOut(30-28,203-Round(2000/28)-7,'2000');
      Form2.imgCmp.Canvas.MoveTo(26,203-Round(3000/28));
      Form2.imgCmp.Canvas.LineTo(34,203-Round(3000/28));
      Form2.imgCmp.Canvas.TextOut(30-28,203-Round(3000/28)-7,'3000');
      Form2.imgCmp.Canvas.MoveTo(26,203-Round(4000/28));
      Form2.imgCmp.Canvas.LineTo(34,203-Round(4000/28));
      Form2.imgCmp.Canvas.TextOut(30-28,203-Round(4000/28)-7,'4000');
      Form2.imgCmp.Canvas.MoveTo(26,203-Round(5000/28));
      Form2.imgCmp.Canvas.LineTo(34,203-Round(5000/28));
      Form2.imgCmp.Canvas.TextOut(30-28,203-Round(5000/28)-7,'5000');

      Form2.imgSwap.Canvas.MoveTo(26,203-Round(1000/82));
      Form2.imgSwap.Canvas.LineTo(34,203-Round(1000/82));
      Form2.imgSwap.Canvas.TextOut(30-28,203-Round(1000/82)-7,'1000');
      Form2.imgSwap.Canvas.MoveTo(26,203-Round(7000/82));
      Form2.imgSwap.Canvas.LineTo(34,203-Round(7000/82));
      Form2.imgSwap.Canvas.TextOut(30-28,203-Round(7000/82)-7,'7000');
      Form2.imgSwap.Canvas.MoveTo(26,203-Round(15000/82));
      Form2.imgSwap.Canvas.LineTo(34,203-Round(15000/82));
      Form2.imgSwap.Canvas.TextOut(30-28,203-Round(15000/82)-7,'15000');

      Form2.imgCmp.Canvas.Brush.Color := clNavy;
      Form2.imgCmp.Canvas.Rectangle(71,203-Round(b[3]/28),106,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*2+41,203-Round(s[3]/28),106+35*3+41,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*5+41*2,203-Round(q[3]/28),106+35*6+41*2,203);

      Form2.imgCmp.Canvas.Brush.Color := clPurple;
      Form2.imgCmp.Canvas.Rectangle(106,203-Round(b[9]/28),106+35,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*3+41,203-Round(s[9]/28),106+35*4+41,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*6+41*2,203-Round(q[9]/28),106+35*7+41*2,203);

      Form2.imgCmp.Canvas.Brush.Color := clTeal;
      Form2.imgCmp.Canvas.Rectangle(106+35,203-Round(b[15]/28),106+35*2,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*4+41,203-Round(s[15]/28),106+35*5+41,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*7+41*2,203-Round(q[15]/28),106+35*8+41*2,203);

      Form2.imgSwap.Canvas.Brush.Color := clNavy;
      Form2.imgSwap.Canvas.Rectangle(71,203-Round(b[4]/82),106,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*2+41,203-Round(s[4]/82),106+35*3+41,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*5+41*2,203-Round(q[4]/82),106+35*6+41*2,203);

      Form2.imgSwap.Canvas.Brush.Color := clPurple;
      Form2.imgSwap.Canvas.Rectangle(106,203-Round(b[10]/82),106+35,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*3+41,203-Round(s[10]/82),106+35*4+41,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*6+41*2,203-Round(q[10]/82),106+35*7+41*2,203);

      Form2.imgSwap.Canvas.Brush.Color := clTeal;
      Form2.imgSwap.Canvas.Rectangle(106+35,203-Round(b[16]/82),106+35*2,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*4+41,203-Round(s[16]/82),106+35*5+41,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*7+41*2,203-Round(q[16]/82),106+35*8+41*2,203);
    end;

procedure TForm2.btn2000Click(Sender: TObject);
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
      Form2.imgCmp.Canvas.Brush.Color := clWhite;
      Form2.imgSwap.Canvas.Brush.Color := clWhite;
      Form2.imgCmp.Picture := nil;
      Form2.imgSwap.Picture := nil;
      Form2.imgCmp.Canvas.MoveTo(30, 20);
      Form2.imgCmp.Canvas.LineTo(30, 203);
      Form2.imgCmp.Canvas.LineTo(509, 203);
      Form2.imgSwap.Canvas.MoveTo(30, 20);
      Form2.imgSwap.Canvas.LineTo(30, 203);
      Form2.imgSwap.Canvas.LineTo(509, 203);
      Form2.ImgCmp.Canvas.TextOut(30+41+35+15,203+5,'1*');
      Form2.ImgCmp.Canvas.TextOut(30+41*2+35*4+15,203+5,'2*');
      Form2.ImgCmp.Canvas.TextOut(30+41*3+35*7+15,203+5,'3*');
      Form2.ImgSwap.Canvas.TextOut(30+41+35+15,203+5,'1*');
      Form2.imgSwap.Canvas.TextOut(30+41*2+35*4+15,203+5,'2*');
      Form2.imgSwap.Canvas.TextOut(30+41*3+35*7+15,203+5,'3*');

      Form2.imgCmp.Canvas.MoveTo(26,203-Round(1000000/10800));
      Form2.imgCmp.Canvas.LineTo(34,203-Round(1000000/10800));
      Form2.imgCmp.Canvas.TextOut(30-28,203-Round(1000000/10800)-7,'10^6');
      Form2.imgCmp.Canvas.MoveTo(26,203-Round(2000000/10800));
      Form2.imgCmp.Canvas.LineTo(34,203-Round(2000000/10800));
      Form2.imgCmp.Canvas.TextOut(30-28,203-Round(2000000/10800)-7,'2*10^6');

      Form2.imgSwap.Canvas.MoveTo(26,203-Round(1000000/33000));
      Form2.imgSwap.Canvas.LineTo(34,203-Round(1000000/33000));
      Form2.imgSwap.Canvas.TextOut(30-28,203-Round(1000000/33000)-7,'10^6');
      Form2.imgSwap.Canvas.MoveTo(26,203-Round(6000000/33000));
      Form2.imgSwap.Canvas.LineTo(34,203-Round(6000000/33000));
      Form2.imgSwap.Canvas.TextOut(30-28,203-Round(6000000/33000)-7,'6*10^6');

      Form2.imgCmp.Canvas.Brush.Color := clNavy;
      Form2.imgCmp.Canvas.Rectangle(71,203-Round(b[5]/10800),106,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*2+41,203-Round(s[5]/10800),106+35*3+41,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*5+41*2,203-Round(q[5]/10800),106+35*6+41*2,203);

      Form2.imgCmp.Canvas.Brush.Color := clPurple;
      Form2.imgCmp.Canvas.Rectangle(106,203-Round(b[11]/10800),106+35,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*3+41,203-Round(s[11]/10800),106+35*4+41,203);  //!
      Form2.imgCmp.Canvas.Rectangle(106+35*6+41*2,203-Round(q[11]/10800),106+35*7+41*2,203);

      Form2.imgCmp.Canvas.Brush.Color := clTeal;
      Form2.imgCmp.Canvas.Rectangle(106+35,203-Round(b[17]/10800),106+35*2,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*4+41,203-Round(s[17]/10800),106+35*5+41,203);
      Form2.imgCmp.Canvas.Rectangle(106+35*7+41*2,203-Round(q[17]/10800),106+35*8+41*2,203);

      Form2.imgSwap.Canvas.Brush.Color := clNavy;
      Form2.imgSwap.Canvas.Rectangle(71,203-Round(b[6]/33000),106,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*2+41,203-Round(s[6]/33000),106+35*3+41,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*5+41*2,203-Round(q[6]/33000),106+35*6+41*2,203);

      Form2.imgSwap.Canvas.Brush.Color := clPurple;
      Form2.imgSwap.Canvas.Rectangle(106,203-Round(b[12]/33000),106+35,203);    //!
      Form2.imgSwap.Canvas.Rectangle(106+35*3+41,203-Round(s[12]/33000),106+35*4+41,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*6+41*2,203-Round(q[12]/33000),106+35*7+41*2,203);   //!

      Form2.imgSwap.Canvas.Brush.Color := clTeal;
      Form2.imgSwap.Canvas.Rectangle(106+35,203-Round(b[18]/33000),106+35*2,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*4+41,203-Round(s[18]/33000),106+35*5+41,203);
      Form2.imgSwap.Canvas.Rectangle(106+35*7+41*2,203-Round(q[18]/33000),106+35*8+41*2,203);  //!
end;

procedure TForm2.FormShow(Sender: TObject);
begin
    Form2.imgCmp.Picture := nil;
    Form2.imgSwap.Picture := nil;

    Form2.img1.Canvas.Brush.Color := clNavy;
    Form2.img1.Canvas.Rectangle(0,0,41,41);
    Form2.img2.Canvas.Brush.Color := clPurple;
    Form2.img2.Canvas.Rectangle(0,0,41,41);
    Form2.img3.Canvas.Brush.Color := clTeal;
    Form2.img3.Canvas.Rectangle(0,0,41,41);

    Form2.imgCmp.Canvas.MoveTo(30, 20);
    Form2.imgCmp.Canvas.LineTo(30, 203);
    Form2.imgCmp.Canvas.LineTo(509, 203);

    Form2.imgSwap.Canvas.MoveTo(30, 20);
    Form2.imgSwap.Canvas.LineTo(30, 203);
    Form2.imgSwap.Canvas.LineTo(509, 203);

    Form2.ImgCmp.Canvas.TextOut(30+41+35+15,203+5,'1*');
    Form2.ImgCmp.Canvas.TextOut(30+41*2+35*4+15,203+5,'2*');
    Form2.ImgCmp.Canvas.TextOut(30+41*3+35*7+15,203+5,'3*');
    Form2.ImgSwap.Canvas.TextOut(30+41+35+15,203+5,'1*');
    Form2.imgSwap.Canvas.TextOut(30+41*2+35*4+15,203+5,'2*');
    Form2.imgSwap.Canvas.TextOut(30+41*3+35*7+15,203+5,'3*');
end;

end.
