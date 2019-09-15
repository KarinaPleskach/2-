unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    tabl1: TStringGrid;
    tablMain: TStringGrid;
    btnAdd: TButton;
    btnChange: TButton;
    btnDelete: TButton;
    btnmain: TButton;
    btnProject: TButton;
    btnSroki: TButton;
    btnNow: TButton;
    tabl2: TStringGrid;
    tablvi: TStringGrid;
    btnVse: TButton;
    tabl3: TStringGrid;
    tabl4: TStringGrid;
    tabl5: TStringGrid;
    tablsroki: TStringGrid;
    tablnow: TStringGrid;
    tablvse: TStringGrid;
    img1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnmainClick(Sender: TObject);
    procedure tablMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnProjectClick(Sender: TObject);
    procedure btnSrokiClick(Sender: TObject);
    procedure btnNowClick(Sender: TObject);
    procedure btnVseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  Zapis = record
    ProjectName: string[30];
    Zadanie: string[30];
    FIOispolnitel: string[40];
    FiOrucovoditel: string[40];
    Data: TDateTime;
    lastdata: TDateTime;
    end;

 ArrayZapis = array[1..50] of zapis;

var
  Form1: TForm1;

 fileWithUsers: file of zapis;
 datazapis: ArrayZapis;
 count: Integer;
 acol,arow : Integer;
implementation

uses Unit2, Unit3, Unit4;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var i:Integer;
var myRect: TGridRect;
begin
  tabl1.Visible := True;
  tablMain.Visible := True;
  tablVi.visible := False;
  tablSroki.Visible := False;
  tablNow.visible := False;
  btnAdd.Visible := True;
  btnChange.Visible := True;
  btnDelete.Visible := True;
  tabl2.visible := False;
  tabl3.visible := False;
  tabl4.visible := False;
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
          tablMain.Selection := myRect;
  tabl1.Cells[0,0] := 'Проекты нашей фирмы';
  tablMain.Cells[0,0] := 'Название';
  tablMain.Cells[1,0] := 'Задание';
  tablMain.Cells[2,0] := 'Исполнитель';
  tablMain.Cells[3,0] := 'Руководитель';
  tablMain.Cells[4,0] := 'Дата';
  tablMain.Cells[5,0] := 'Дата сдачи';
  AssignFile(fileWithUsers,'Users.txt');
  try
    count := 0;
    i := 0;
    Reset(filewithUsers);
    if FileSize(fileWithUsers)=0 then
    tablMain.RowCount := 2
    else
    begin
    while not Eof(fileWithUsers) do
      begin
        Inc(i);
        read(FilewithUsers,datazapis[i]);
        tablMain.Cells[0,i] := datazapis[i].ProjectName;
        tablMain.Cells[1,i] := datazapis[i].Zadanie;
        tablMain.Cells[2,i] := datazapis[i].FIOispolnitel;
        tablMain.Cells[3,i] := datazapis[i].FiOrucovoditel;
        tablMain.Cells[4,i] := DateToStr(datazapis[i].Data);
        tablMain.Cells[5,i] := DateToStr(datazapis[i].lastdata);
      end;
    count := i;
    tablMain.RowCount := count + 1;
    end;
  except
    Rewrite(fileWithUsers);
  end;
  CloseFile(fileWithUsers);
end;

procedure TForm1.btnAddClick(Sender: TObject);
begin
Add.ShowModal;
end;

procedure TForm1.btnmainClick(Sender: TObject);
var i:Integer;
var myRect: TGridRect;
begin
  tabl1.Visible := True;
  tablMain.Visible := True;
  tablVi.visible := False;
  tablSroki.Visible := False;
  tablNow.visible := False;
  btnAdd.Visible := True;
  btnChange.Visible := True;
  btnDelete.Visible := True;
  tabl2.visible := False;
  tabl3.visible := False;
  tabl4.visible := False;
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
          tablMain.Selection := myRect;
          tabl1.Cells[0,0] := 'Проекты нашей фирмы';
  tablMain.Cells[0,0] := 'Название';
  tablMain.Cells[1,0] := 'Задание';
  tablMain.Cells[2,0] := 'Исполнитель';
  tablMain.Cells[3,0] := 'Руководитель';
  tablMain.Cells[4,0] := 'Дата';
  tablMain.Cells[5,0] := 'Дата сдачи';
    count := 0;
    i := 0;
    Reset(filewithUsers);
    if FileSize(fileWithUsers)=0 then
    tablMain.RowCount := 2
    else
    begin
    while not Eof(fileWithUsers) do
      begin
        Inc(i);
        read(FilewithUsers,datazapis[i]);
        tablMain.Cells[0,i] := datazapis[i].ProjectName;
        tablMain.Cells[1,i] := datazapis[i].Zadanie;
        tablMain.Cells[2,i] := datazapis[i].FIOispolnitel;
        tablMain.Cells[3,i] := datazapis[i].FiOrucovoditel;
        tablMain.Cells[4,i] := DateToStr(datazapis[i].Data);
        tablMain.Cells[5,i] := DateToStr(datazapis[i].lastdata);
      end;
    count := i;
    tablMain.RowCount := count + 1;
    end;
    CloseFile(fileWithUsers);
end;

procedure TForm1.tablMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
tablMain.MouseToCell(X, Y, Acol, ARow);//Получаем индексы ячейки ACol и ARow
        //Перемещаем фокус в ячейку с этими индексами:
        tablMain.Col:=ACol;
        tablmain.Row:=ARow;
end;

procedure TForm1.btnChangeClick(Sender: TObject);
var i: integer;
begin
 if (arow>0) and (count<>0)
 then
Change.ShowModal
 else
 ShowMessage('Выберите проект.');
end;

procedure TForm1.btnDeleteClick(Sender: TObject);
var i : Integer;
var myRect: TGridRect;
begin
  if (arow>0) and (count<>0)
 then
  begin
  tabl1.Visible := True;
  tablMain.Visible := True;
  tablVi.visible := False;
  tablSroki.Visible := False;
  tablNow.visible := False;
  btnAdd.Visible := True;
  btnChange.Visible := True;
  btnDelete.Visible := True;
  tabl2.visible := False;
  tabl3.visible := False;
  tabl4.visible := False;
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
          tablMain.Selection := myRect;
          tabl1.Cells[0,0] := 'Проекты нашей фирмы';
  tablMain.Cells[0,0] := 'Название';
  tablMain.Cells[1,0] := 'Задание';
  tablMain.Cells[2,0] := 'Исполнитель';
  tablMain.Cells[3,0] := 'Руководитель';
  tablMain.Cells[4,0] := 'Дата';
  tablMain.Cells[5,0] := 'Дата сдачи';


for i := 1 to (arow -1) do
begin

  Form1.tablMain.Cells[0,i] := datazapis[i].ProjectName;
    Form1.tablMain.Cells[1,i] := datazapis[i].Zadanie;
    Form1.tablMain.Cells[2,i] := datazapis[i].FIOispolnitel;
    Form1.tablMain.Cells[3,i] := datazapis[i].FiOrucovoditel;
    Form1.tablMain.Cells[4,i] := DateToStr(datazapis[i].Data);
    Form1.tablMain.Cells[5,i] := DateToStr(datazapis[i].lastdata);

end;
for i := (arow + 1) to count do
begin
  Form1.tablMain.Cells[0,i-1] := datazapis[i].ProjectName;
    Form1.tablMain.Cells[1,i-1] := datazapis[i].Zadanie;
    Form1.tablMain.Cells[2,i-1] := datazapis[i].FIOispolnitel;
    Form1.tablMain.Cells[3,i-1] := datazapis[i].FiOrucovoditel;
    Form1.tablMain.Cells[4,i-1] := DateToStr(datazapis[i].Data);
    Form1.tablMain.Cells[5,i-1] := DateToStr(datazapis[i].lastdata);

end;
if count = 0
 then Form1.tablMain.RowCount := 2;
count := count -1;
form1.tablMain.RowCount := count +1;

Rewrite(fileWithUsers);
  for i := 1 to count do
  begin
    write(fileWithUsers,dataZapis[i]);

  end;
  CloseFile(fileWithUsers);
  end
  else
 ShowMessage('Выберите проект.');
end;

procedure TForm1.btnProjectClick(Sender: TObject);
begin
Vi.showmodal;
end;

procedure TForm1.btnSrokiClick(Sender: TObject);
var myRect: TGridRect;
data1: TDateTime;
myyear,myyear1,mymonth,mymonth1,myday,myday1:word;
var i,j: Integer;
begin

  tabl1.Visible := false;
  tablMain.Visible := false;
  tablVi.visible := False;
  tablSroki.Visible := true;
  tablNow.visible := False;
  btnAdd.Visible := false;
  btnChange.Visible := false;
  btnDelete.Visible := false;
  tabl2.visible := false;
  tabl3.visible := true;
  tabl4.visible := False;
  Form1.tablvse.visible := False;
  Form1.tabl5.visible := False;

  with Form1.tablsroki do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

         with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
          tablsroki.Selection := myRect;
          tabl3.Cells[0,0] := 'Закончить в следующем месяце';
  tablsroki.Cells[0,0] := 'Название';
  tablsroki.Cells[1,0] := 'Задание';
  tablsroki.Cells[2,0] := 'Исполнитель';
  tablsroki.Cells[3,0] := 'Руководитель';
  tablsroki.Cells[4,0] := 'Дата';
  tablsroki.Cells[5,0] := 'Дата сдачи';
  j := 0;
  data1 := Date;
  DecodeDate(data1,myyear,mymonth,myday);
  for i := 1 to count do
  begin
    DecodeDate(datazapis[i].lastdata,myyear1,mymonth1,myday1);
    if  mymonth1 = (mymonth+1) then
    begin
      Inc(j);
      Form1.tablsroki.Cells[0,j] := datazapis[i].ProjectName;
      Form1.tablsroki.Cells[1,j] := datazapis[i].Zadanie;
      Form1.tablsroki.Cells[2,j] := datazapis[i].FIOispolnitel;
      Form1.tablsroki.Cells[3,j] := datazapis[i].FiOrucovoditel;
      Form1.tablsroki.Cells[4,j] := DateToStr(datazapis[i].Data);
      Form1.tablsroki.Cells[5,j] := DateToStr(datazapis[i].lastData);
    end;

  end;
  tablsroki.RowCount := J +1;
  if j = 0
  then tablsroki.RowCount :=2;
end;

procedure TForm1.btnNowClick(Sender: TObject);
var myRect: TGridRect;
data1: TDateTime;
myyear,myyear1,mymonth,mymonth1,myday,myday1:word;
var i,j: Integer;
begin

  tabl1.Visible := false;
  tablMain.Visible := false;
  tablVi.visible := False;
  tablSroki.Visible := false;
  tablNow.visible := true;
  btnAdd.Visible := false;
  btnChange.Visible := false;
  btnDelete.Visible := false;
  tabl2.visible := false;
  tabl3.visible := false;
  tabl4.visible := true;
  Form1.tablvse.visible := False;
  Form1.tabl5.visible := False;

  with Form1.tablnow do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

         with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
          tablnow.Selection := myRect;
          tabl4.Cells[0,0] := 'Закончить в этом месяце';
  tablnow.Cells[0,0] := 'Название';
  tablnow.Cells[1,0] := 'Задание';
  tablnow.Cells[2,0] := 'Исполнитель';
  tablnow.Cells[3,0] := 'Руководитель';
  tablnow.Cells[4,0] := 'Дата';
  tablnow.Cells[5,0] := 'Дата сдачи';
  j := 0;
  data1 := Date;
  DecodeDate(data1,myyear,mymonth,myday);
  for i := 1 to count do
  begin
    DecodeDate(datazapis[i].lastdata,myyear1,mymonth1,myday1);
    if  (mymonth1 = (mymonth)) and (myday1>=myday) then
    begin
      Inc(j);
      Form1.tablnow.Cells[0,j] := datazapis[i].ProjectName;
      Form1.tablnow.Cells[1,j] := datazapis[i].Zadanie;
      Form1.tablnow.Cells[2,j] := datazapis[i].FIOispolnitel;
      Form1.tablnow.Cells[3,j] := datazapis[i].FiOrucovoditel;
      Form1.tablnow.Cells[4,j] := DateToStr(datazapis[i].Data);
      Form1.tablnow.Cells[5,j] := DateToStr(datazapis[i].lastData);
    end;

  end;
  tablnow.RowCount := J +1;
  if j = 0
  then tablnow.RowCount := 2;
end;

procedure TForm1.btnVseClick(Sender: TObject);
var myRect: TGridRect;
data1: TDateTime;
myyear,myyear1,mymonth,mymonth1,myday,myday1:word;
var i,j: Integer;
begin

  tabl1.Visible := false;
  tablMain.Visible := false;
  tablVi.visible := False;
  tablSroki.Visible := false;
  tablNow.visible := false;
  btnAdd.Visible := false;
  btnChange.Visible := false;
  btnDelete.Visible := false;
  tabl2.visible := false;
  tabl3.visible := false;
  tabl4.visible := false;
  Form1.tablvse.visible := true;
  Form1.tabl5.visible := true;

  with Form1.tablvse do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

         with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
          tablvse.Selection := myRect;
          tabl5.Cells[0,0] := 'Завершенные проекты';
  tablvse.Cells[0,0] := 'Название';
  tablvse.Cells[1,0] := 'Задание';
  tablvse.Cells[2,0] := 'Исполнитель';
  tablvse.Cells[3,0] := 'Руководитель';
  tablvse.Cells[4,0] := 'Дата';
  tablvse.Cells[5,0] := 'Дата сдачи';
  j := 0;
  data1 := Date;
  DecodeDate(data1,myyear,mymonth,myday);
  for i := 1 to count do
  begin
    DecodeDate(datazapis[i].lastdata,myyear1,mymonth1,myday1);
    if (myyear1<myyear) or ((myyear1=myyear1)and (mymonth1<mymonth)) or ((myyear1=myyear)and(mymonth1=mymonth)and(myday1<myday)) then
    begin
      Inc(j);
      Form1.tablvse.Cells[0,j] := datazapis[i].ProjectName;
      Form1.tablvse.Cells[1,j] := datazapis[i].Zadanie;
      Form1.tablvse.Cells[2,j] := datazapis[i].FIOispolnitel;
      Form1.tablvse.Cells[3,j] := datazapis[i].FiOrucovoditel;
      Form1.tablvse.Cells[4,j] := DateToStr(datazapis[i].Data);
      Form1.tablvse.Cells[5,j] := DateToStr(datazapis[i].lastData);
    end;

  end;
  tablvse.RowCount := J +1;
  if j=0
  then tablvse.RowCount := 2;
end;

end.                                                  
