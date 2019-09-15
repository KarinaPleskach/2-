unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MMSystem;

type
  TViForm = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    lblName: TLabel;
    lbl2: TLabel;
    edtPassword: TEdit;
    btnOk: TButton;
    btnDont: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnDontClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViForm: TViForm;

implementation

uses Unit2, Unit1, Unit7;

var k: Integer;

{$R *.dfm}

procedure TViForm.FormShow(Sender: TObject);
begin
  lblName.Caption := AdminNames.tablVibor.Cells[ACol,ARow];
  edtPassword.Text := '';
  edtPassword.SetFocus;
  k := 0;
end;

procedure TViForm.btnDontClick(Sender: TObject);
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  ViForm.Hide;
  AdminNames.Show;
end;

procedure TViForm.btnOkClick(Sender: TObject);
var i: Integer;
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  CurrentUser := FirstUser;
  for i := 1 to ARow do
    begin
      CurrentUser := CurrentUser^.Next;
    end;
  if edtPassword.Text <> CurrentUser^.Element.Password
  then
  begin
    ShowMessage('Неверный пароль.');
    edtPassword.Text := '';
    edtPassword.SetFocus;
    inc(k);
    if k > 2
    then
      ShowMessage('Если совсем не помнишь пароль, нажми на замок.');
  end
  else
  begin
    ViForm.Hide;
    Change.show;
  end;
end;

procedure TViForm.img1Click(Sender: TObject);
var i: Integer;
begin
CurrentUser := FirstUser;
  for i := 1 to ARow do
    begin
      CurrentUser := CurrentUser^.Next;
    end;
  ShowMessage(currentUser^.Element.Password);
end;

end.
