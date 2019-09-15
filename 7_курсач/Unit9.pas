unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, MMSystem;

type
  TNastroikaValut = class(TForm)
    lbl1: TLabel;
    spl1: TSplitter;
    btnAdd: TButton;
    btnDelete: TButton;
    tablVibor: TStringGrid;
    btnClose: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure tablViborMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NastroikaValut: TNastroikaValut;
  col, row:Integer;

implementation
uses Unit4, Unit1, Unit10, Unit11;

{$R *.dfm}

procedure TNastroikaValut.FormShow(Sender: TObject);
var myRect: TGridRect;
i,m,j: Integer;
begin
  with tablVibor do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablVibor do
          begin
            Selection := myRect;
            Cells[0,0] := ' Название валюты';
          end;
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoValut;
if vs <> 0
    then
      BEGIN
        tablVibor.RowCount := vs + 1;
        j := 0;

        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoValut;
          end;
        M:=0;
        CurrentValuta := FirstValuta;
        for i := 1 to j do
          begin
            CurrentValuta := CurrentValuta^.Next;
          end;
        for I := 1 to vs do
          begin
            inc(m);
            CurrentValuta := CurrentValuta^.Next;
            tablVibor.Cells[0,m] := CurrentValuta^.Element.Name;

          end;

      end
    else
    tablVibor.RowCount := 2;

end;

procedure TNastroikaValut.btnCloseClick(Sender: TObject);
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
NastroikaValut.Hide;
MainForm.Show;
end;

procedure TNastroikaValut.btnAddClick(Sender: TObject);
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
NastroikaValut.Hide;
AddValut.Show;
end;

procedure TNastroikaValut.tablViborMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
try
tablVibor.MouseToCell(X, Y, Col, Row);//Получаем индексы ячейки ACol и ARow
        //Перемещаем фокус в ячейку с этими индексами:
        tablVibor.Col:=Col;
        tablVibor.Row:=Row;
        except
        end;
end;

procedure TNastroikaValut.btnDeleteClick(Sender: TObject);
var vs,i:Integer;
begin
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoValut;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (row < 1) or (vs = 0)
then
ShowMessage('Выберите валюту.')
else
begin
Attantion.Show;
NastroikaValut.Hide;
end;
end;

end.
