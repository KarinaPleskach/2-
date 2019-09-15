unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls;

type
  Tvi = class(TForm)
    cbb1: TComboBox;
    lbl1: TLabel;
    btnOk: TButton;
    btnDont: TButton;
    img1: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnDontClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vi: Tvi;

implementation
Uses Unit1, Unit2;
{$R *.dfm}

procedure Tvi.FormShow(Sender: TObject);

var i,j:Integer;
Bool :Boolean;
begin



  cbb1.Text := '';
  cbb1.Items.Clear;
  for i :=1 to count do
  begin
    bool := true;
    for j:= 1 to (i-1) do
    begin
      if datazapis[i].ProjectName = datazapis[j].Projectname then
      bool := false;
    end;
    if bool then
  cbb1.Items.add(datazapis[i].ProjectName);

  end;

end;


procedure Tvi.btnOkClick(Sender: TObject);
var Bool: Boolean;
stroka: string;
i,j: Integer;
var myRect: TGridRect;
begin
  bool := True;
   stroka := cbb1.Items[cbb1.ItemIndex];
        if Length(stroka) = 0
          then
            begin
              ShowMessage('Выберите название проекта.');
               cbb1.SetFocus;
               bool := False;
               cbb1.Text :='';
            end;

  if Bool then
  begin
    Form1.tabl1.Visible := false;
    Form1.tablMain.Visible := false;
    Form1.tablVi.visible := true;
    Form1.tablSroki.Visible := False;
    Form1.tablNow.visible := False;
    Form1.btnAdd.Visible := false;
    form1.btnChange.Visible := false;
    Form1.btnDelete.Visible := false;
    Form1.tabl2.visible := true;
  Form1.tabl3.visible := False;
  Form1.tabl4.visible := False;
  Form1.tablvse.visible := False;
  Form1.tabl5.visible := False;

  with Form1.tabl2 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

         with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
          form1.tabl2.Selection := myRect;


  form1.tabl2.Cells[0,0] := 'Задания проекта '+stroka;
  j := 0;
  with Form1.tablvi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

         with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
          Form1.tablvi.Selection := myRect;
          Form1.tablvi.Cells[0,0] := 'Задание';
          Form1.tablvi.Cells[1,0] := 'Исполнитель';
          Form1.tablvi.Cells[2,0] := 'Руководитель';
          Form1.tablvi.Cells[3,0] := 'Дата';
          Form1.tablvi.Cells[4,0] := 'Дата сдачи';
  for i := 1 to count do
  begin
    if datazapis[i].ProjectName = stroka then
    begin
      inc(j);
      Form1.tablvi.Cells[0,j] := datazapis[i].Zadanie;
      Form1.tablvi.Cells[1,j] := datazapis[i].FIOispolnitel;
      Form1.tablvi.Cells[2,j] := datazapis[i].FiOrucovoditel;
      Form1.tablvi.Cells[3,j] := DateToStr(datazapis[i].Data);
      Form1.tablvi.Cells[4,j] := DateToStr(datazapis[i].lastData);
    end;

  end;
  Form1.tablvi.RowCount := j+1;
  if j = 0
  then Form1.tablvi.RowCount := 2;
    vi.Close;
  end;




end;

procedure Tvi.btnDontClick(Sender: TObject);
begin
  vi.Close;
end;

end.
