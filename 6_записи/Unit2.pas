unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, grids, jpeg, ExtCtrls;

type
  TAdd = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtName: TEdit;
    edtZadanie: TEdit;
    edtFIOispolnitel: TEdit;
    edtFIOrucovoditel: TEdit;
    dtpData: TDateTimePicker;
    dtpLastdata: TDateTimePicker;
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
  Add: TAdd;

implementation
 uses Unit1;
{$R *.dfm}

procedure TAdd.FormShow(Sender: TObject);

begin
  dtpData.Date := Date;
  dtpLastdata.Date := Date;
  edtName.Text := '';
  edtZadanie.Text := '';
  edtFIOispolnitel.Text := '';
  edtFIOrucovoditel.Text := '';

end;

procedure TAdd.btnOkClick(Sender: TObject);
var i: Integer;
var bool:Boolean;
n: string;
var myRect: TGridRect;
begin

  bool := True;
        n := edtName.Text;
        while Pos(' ', n)<>0 do
          Delete (n, Pos(' ', n), 1);
        if Length(n) = 0
          then
            begin
              bool := False;
              ShowMessage('Введите название проекта.');
              edtName.SetFocus;
              edtName.Text := '';
            end;

        if bool
        then
        begin
          if Length(edtName.Text) > 30
            then
              begin
                n := edtName.Text;
                ShowMessage('Слишком длинное название проекта.');
                Delete(n, 30, Length(n));
                edtName.Text := n;
                edtName.SetFocus;
                bool := False;
              end;
        end;

        if bool
        then
        begin
          if Length(edtZadanie.Text) > 30
            then
              begin
                n := edtZadanie.Text;
                ShowMessage('Слишком длинное задание.');
                Delete(n, 30, Length(n));
                edtzadanie.Text := n;
                edtZadanie.SetFocus;
                bool := False;
              end;
        end;

        if bool
        then
        begin
          n := edtZadanie.Text;
          while Pos(' ', n)<>0 do
            Delete (n, Pos(' ', n), 1);
        if Length(n) = 0
          then
            begin
              bool := False;
              ShowMessage('Введите задание.');
              edtZadanie.SetFocus;
              edtZadanie.Text :='';
            end;
        end;

        if bool
        then
        begin
          if Length(edtFIOispolnitel.Text) > 40
            then
              begin
                n := edtFIOispolnitel.Text;
                ShowMessage('Слишком длинное имя исполнителя.');
                Delete(n, 30, Length(n));
                edtFIOispolnitel.Text := n;
                edtFIOispolnitel.SetFocus;
                bool := False;
              end;
        end;

        if bool
        then
        begin
          n := edtFIOispolnitel.Text;
          while Pos(' ', n)<>0 do
            Delete (n, Pos(' ', n), 1);
        if Length(n) = 0
          then
            begin
              bool := False;
              ShowMessage('Введите имя исполнителя.');
              edtFIOispolnitel.SetFocus;
              edtFIOispolnitel.Text :='';
            end;
        end;

        begin
          if Length(edtFIOrucovoditel.Text) > 40
            then
              begin
                n := edtFIOrucovoditel.Text;
                ShowMessage('Слишком длинное имя руководителя.');
                Delete(n, 30, Length(n));
                edtFIOrucovoditel.Text := n;
                edtFIOrucovoditel.SetFocus;
                bool := False;
              end;
        end;

        if bool
        then
        begin
          n := edtFIOrucovoditel.Text;
          while Pos(' ', n)<>0 do
            Delete (n, Pos(' ', n), 1);
        if Length(n) = 0
          then
            begin
              bool := False;
              ShowMessage('Введите имя руководителя.');
              edtFIOrucovoditel.SetFocus;
              edtFIOrucovoditel.Text :='';
            end;
        end;

        if bool
        then
        begin
          if dtpData.Date > dtpLastdata.Date
          then
          begin
            bool := False;
            ShowMessage('Некорректно введенные даты.');
            dtpData.Date := date;
            dtpLastdata.date := date;
          end;
        end;

        if bool
        then
        begin
          for i := 1 to count do
          begin
            if (datazapis[i].ProjectName=edtName.Text) and (datazapis[i].Zadanie=edtZadanie.Text) and (datazapis[i].FIOispolnitel=edtFIOispolnitel.Text) and (datazapis[i].FiOrucovoditel=edtFIOrucovoditel.Text) and (datazapis[i].Data=dtpData.date) and (datazapis[i].lastdata = dtpLastdata.date)
            then
            begin
              bool:= False;
              ShowMessage('Такой проект уже существует.');
            end;
          end;
        end;

  if Bool then
  begin
    Form1.tabl1.Visible := True;
  Form1.tablMain.Visible := True;
  Form1.tablVi.visible := False;
  Form1.tablSroki.Visible := False;
  Form1.tablNow.visible := False;
  Form1.btnAdd.Visible := True;
  form1.btnChange.Visible := True;
  Form1.btnDelete.Visible := True;
  Form1.tabl2.visible := False;
  Form1.tabl3.visible := False;
  Form1.tabl4.visible := False;
  Form1.tablvse.visible := False;
  Form1.tabl5.visible := False;
    with Form1.tablMain do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

         with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
          Form1.tablMain.Selection := myRect;
          Form1.tabl1.Cells[0,0] := 'Проекты нашей фирмы';
          Form1.tablMain.Cells[0,0] := 'Название';
          Form1.tablMain.Cells[1,0] := 'Задание';
          Form1.tablMain.Cells[2,0] := 'Исполнитель';
          Form1.tablMain.Cells[3,0] := 'Руководитель';
          Form1.tablMain.Cells[4,0] := 'Дата';
          Form1.tablMain.Cells[5,0] := 'Дата сдачи';
  count := Count + 1;
  datazapis[Count].ProjectName := edtName.Text;
  datazapis[count].Zadanie := edtZadanie.Text;
  datazapis[count].FIOispolnitel := edtFIOispolnitel.Text;
  datazapis[count].FiOrucovoditel := edtFIOrucovoditel.Text;
  datazapis[count].Data := dtpData.Date;
  datazapis[count].lastdata := dtpLastdata.Date;
  Rewrite(fileWithUsers);
  for i := 1 to count do
  begin
    write(fileWithUsers,dataZapis[i]);
    Form1.tablMain.Cells[0,i] := datazapis[i].ProjectName;
    Form1.tablMain.Cells[1,i] := datazapis[i].Zadanie;
    Form1.tablMain.Cells[2,i] := datazapis[i].FIOispolnitel;
    Form1.tablMain.Cells[3,i] := datazapis[i].FiOrucovoditel;
    Form1.tablMain.Cells[4,i] := DateToStr(datazapis[i].Data);
    Form1.tablMain.Cells[5,i] := DateToStr(datazapis[i].lastdata);

  end;
  CloseFile(fileWithUsers);
  form1.tablMain.RowCount := count +1;
  Add.Close;

  end;
end;

procedure TAdd.btnDontClick(Sender: TObject);
begin
Add.Close;
end;


end.
