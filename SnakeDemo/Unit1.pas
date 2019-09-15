  unit Unit1;

  interface

  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls, Menus, Buttons;

  type
    TFormStart = class(TForm)
      lbl1: TLabel;
    mm1: TMainMenu;
    File1: TMenuItem;
    Create1: TMenuItem;
    Reference1: TMenuItem;
    Exit1: TMenuItem;
    Open1: TMenuItem;
    img1: TImage;
    btn4: TBitBtn;
    btn5: TBitBtn;
    btn6: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Create1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Reference1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
    FormStart: TFormStart;

  implementation

  uses Unit2, Unit3, Unit4, Unit5, unit6;

  {$R *.dfm}







  procedure TFormStart.FormCreate(Sender: TObject);
  var rgn: HRGN;
begin
  Randomize;
  rgn := CreateRoundRectRgn(0,0,ClientWidth,ClientHeight,20,20);
  SetWindowRgn(Handle, rgn, True);
end;

procedure TFormStart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;


procedure TFormStart.Create1Click(Sender: TObject);
begin
 form5.show;
 FormStart.Hide;
end;

procedure TFormStart.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormStart.Reference1Click(Sender: TObject);
begin
Form6.show;
FormStart.Hide;
end;

procedure TFormStart.Open1Click(Sender: TObject);
begin
 form5.show;
 FormStart.Hide;
end;

procedure TFormStart.btn4Click(Sender: TObject);
begin
  Form2.Show;
    FormStart.Hide;
end;

procedure TFormStart.btn5Click(Sender: TObject);
begin
  Form3.Show;
    FormStart.Hide;
end;

procedure TFormStart.btn6Click(Sender: TObject);
begin
  Form4.Show;
    FormStart.Hide;
end;

procedure TFormStart.btn4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
btn4.Font. Color := $00400000;
end;




procedure TFormStart.btn5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
btn5.Font. Color := $00400000;
end;

procedure TFormStart.btn6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
btn6.Font. Color := $00400000;
end;

procedure TFormStart.img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  btn4.Font.Color := $00400080;
btn5.Font.Color := $00400080;
btn6.Font.Color := $00400080;
end;



end.
