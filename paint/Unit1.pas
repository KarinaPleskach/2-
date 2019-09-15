unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    p: TPaintBox;
    procedure pMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   bool: Boolean;
implementation

{$R *.dfm}


procedure TForm1.pMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   p.Canvas.Pen.Color := clPurple;
  
   if ssLeft in Shift
   then
   begin

   P.Canvas.LineTo(X,Y);
   end;
end;


procedure TForm1.pMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
p.Canvas.MoveTo(x,y);
end;

end.
