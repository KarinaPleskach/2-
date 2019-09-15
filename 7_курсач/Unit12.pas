unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, MMSystem;

type
  TnastroikaCategory = class(TForm)
    tablDohod: TStringGrid;
    tablRashod: TStringGrid;
    spl1: TSplitter;
    btnAddDohod: TButton;
    btnChangeDohod: TButton;
    btnDeleteDohod: TButton;
    btnAddRashod: TButton;
    btnChangeRashod: TButton;
    btnDeleteRashod: TButton;
    spl2: TSplitter;
    spl3: TSplitter;
    btnDont: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnDontClick(Sender: TObject);
    procedure btnAddDohodClick(Sender: TObject);
    procedure btnChangeDohodClick(Sender: TObject);
    procedure btnAddRashodClick(Sender: TObject);
    procedure btnChangeRashodClick(Sender: TObject);
    procedure tablDohodMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tablRashodMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDeleteDohodClick(Sender: TObject);
    procedure btnDeleteRashodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  nastroikaCategory: TnastroikaCategory;
  colDohod,RowDohod,ColRashod,RowRashod:Integer;

implementation
Uses Unit1,Unit4,Unit13,Unit14,Unit15,Unit16, Unit10, Unit9;

{$R *.dfm}

procedure TnastroikaCategory.FormShow(Sender: TObject);
var myRect: TGridRect;
var i, k, l, d, r , m: Integer;
begin
    with tablRashod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tabldohod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablDohod do
          begin
            Selection := myRect;
            Cells[0,0] := ' Категории доходов';
          end;
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoCategoryDohodov;
if vs <> 0
    then
      BEGIN
        tablDohod.RowCount := vs + 1;
        j := 0;

        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoCategoryDohodov;
          end;
        M:=0;
        CurrentCategoryDohodov := FirstCategoryDohodov ;
        for i := 1 to j do
          begin
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
          end;
        for I := 1 to vs do
          begin
            inc(m);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            tablDohod.Cells[0,m] := CurrentCategoryDohodov^.Element.Name;

          end;

      end
    else
    tablDohod.RowCount := 2;

    with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablRashod do
          begin
            Selection := myRect;
            Cells[0,0] := ' Категории расходов';
          end;
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoCategoryRashodov;
if vs <> 0
    then
      BEGIN
        tablRashod.RowCount := vs + 1;
        j := 0;

        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoCategoryRashodov;
          end;
        M:=0;
        CurrentCategoryRachodov := FirstCategoryRachodov ;
        for i := 1 to j do
          begin
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
          end;
        for I := 1 to vs do
          begin
            inc(m);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            tablRashod.Cells[0,m] := CurrentCategoryRachodov^.Element.Name;

          end;

      end
    else
    tablRashod.RowCount := 2;

end;

procedure TnastroikaCategory.btnDontClick(Sender: TObject);
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
 nastroikaCategory.Hide;
 MainForm.Show;
end;

procedure TnastroikaCategory.btnAddDohodClick(Sender: TObject);
 
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
AddDohod.Show;
nastroikaCategory.Hide;


end;

procedure TnastroikaCategory.btnChangeDohodClick(Sender: TObject);
var i,vs:Integer;
begin
 currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoCategoryDohodov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (rowDohod < 1) or (vs = 0)
then
ShowMessage('Выберите категорию.')
else
begin
ChangeDohod.Show;
nastroikaCategory.Hide;
end;

end;

procedure TnastroikaCategory.btnAddRashodClick(Sender: TObject);

begin
 PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
AddRashod.Show;
nastroikaCategory.Hide;


end;

procedure TnastroikaCategory.btnChangeRashodClick(Sender: TObject);
 var i, vs:Integer;
begin
 currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoCategoryRashodov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (rowrashod < 1) or (vs = 0)
then
ShowMessage('Выберите категорию.')
else
begin
ChangeRashod.Show;
nastroikaCategory.Hide;
end;

end;

procedure TnastroikaCategory.tablDohodMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  try
 tablDohod.MouseToCell(X, Y, ColDohod, Rowdohod);//Получаем индексы ячейки ACol и ARow
        //Перемещаем фокус в ячейку с этими индексами:
        tablDohod.Col:=Coldohod;
        tablDohod.Row:=Rowdohod;
  except
    end;
end;

procedure TnastroikaCategory.tablRashodMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  try
  tablRashod.MouseToCell(X, Y, Colrashod, Rowrashod);//Получаем индексы ячейки ACol и ARow
        //Перемещаем фокус в ячейку с этими индексами:
        tablRashod.Col:=Colrashod;
        tablRashod.Row:=Rowrashod;
  except
    end;
end;

procedure TnastroikaCategory.btnDeleteDohodClick(Sender: TObject);
Var k,i,vs: Integer;
bool:Boolean;
A: AdrCategoryDohodov;
var myRect: TGridRect;
var  l, d, m: Integer;
begin
currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoCategoryDohodov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (rowDohod < 1) or (vs = 0)
then
ShowMessage('Выберите категорию.')
 else
begin
        with tablDohod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tablRashod do
    for i := 0 to colcount-1 do
    Cols[i].Clear;
          k := 0;
  CurrentUser := FirstUser;
  for i := 1 to (ind -1 ) do
  begin
    CurrentUser := CurrentUser^.Next;
    k := k + CurrentUser^.Element.KolvoCategoryDohodov;
  end;
  CurrentUser := CurrentUser^.Next;




      CurrentCategoryDohodov := FirstCategoryDohodov;
      for i := 1 to (k + RowDohod) do
        begin
          CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
        end;
      if CurrentCategoryDohodov^.Next = nil
      then
      begin
      CurrentCategoryDohodov := FirstCategoryDohodov;
      for i := 1 to (k + rowdohod -1) do
        begin
          CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
        end;
      a := CurrentCategoryDohodov^.Next;
      CurrentCategoryDohodov^.Next := nil;
      Dispose(a);
      end
      else
      begin
      CurrentCategoryDohodov := FirstCategoryDohodov;
      for i := 1 to (k + rowdohod -1) do
        begin
          CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
        end;
      a := CurrentCategoryDohodov^.Next;
      CurrentCategoryDohodov^.Next := CurrentCategoryDohodov^.Next^.Next;
      Dispose(a);
      end;
      Rewrite(FileWithCategoryDohodov);
            CurrentCategoryDohodov := FirstCategoryDohodov;
              while CurrentCategoryDohodov^.Next <> nil do
                begin
                  CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
                  DataCategoryDohodov.Name := CurrentCategoryDohodov^.Element.Name;
                  DataCategoryDohodov.User := CurrentCategoryDohodov^.Element.User;
                  write(FileWithCategoryDohodov, DataCategoryDohodov);
                end;
            CloseFile(FileWithCategoryDohodov) ;

      CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoCategoryDohodov := CurrentUser^.Element.KolvoCategoryDohodov - 1;

            Rewrite(FileWithUsers);
          CurrentUser := FirstUser;
          while CurrentUser^.Next <> nil do
          begin
            CurrentUser := CurrentUser^.Next;
            DataUser.Name := CurrentUser^.Element.Name;
            DataUser.Password := CurrentUser^.Element.Password;
            DataUser.KolvoCategoryDohodov := CurrentUser^.Element.KolvoCategoryDohodov;
            DataUser.KolvoCategoryRashodov := CurrentUser^.Element.KolvoCategoryRashodov;
            DataUser.KolvoDolgnikov := CurrentUser^.Element.KolvoDolgnikov;
            DataUser.KolvoZaemchikov := CurrentUser^.Element.KolvoZaemchikov;
            DataUser.KolvoDohodov := CurrentUser^.Element.KolvoDohodov;
            DataUser.KolvoRashodov := CurrentUser^.Element.KolvoRashodov;
            DataUser.KolvoValut := CurrentUser^.Element.KolvoValut;
            DataUser.MoneyYouHave := CurrentUser^.Element.MoneyYouHave;
            DataUser.AreYouNewOne := CurrentUser^.Element.AreYouNewOne;
            write(FileWithUsers, DataUser);
          end;
          CloseFile(FileWithUsers);




   with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablDohod do
          begin
            Selection := myRect;
            Cells[0,0] := ' Категории доходов';
          end;
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoCategoryDohodov;
if vs <> 0
    then
      BEGIN
        tablDohod.RowCount := vs + 1;
        j := 0;

        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoCategoryDohodov;
          end;
        M:=0;
        CurrentCategoryDohodov := FirstCategoryDohodov ;
        for i := 1 to j do
          begin
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
          end;
        for I := 1 to vs do
          begin
            inc(m);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            tablDohod.Cells[0,m] := CurrentCategoryDohodov^.Element.Name;

          end;

      end
    else
    tablDohod.RowCount := 2;

    with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablRashod do
          begin
            Selection := myRect;
            Cells[0,0] := ' Категории расходов';
          end;
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoCategoryRashodov;
if vs <> 0
    then
      BEGIN
        tablRashod.RowCount := vs + 1;
        j := 0;

        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoCategoryRashodov;
          end;
        M:=0;
        CurrentCategoryRachodov := FirstCategoryRachodov ;
        for i := 1 to j do
          begin
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
          end;
        for I := 1 to vs do
          begin
            inc(m);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            tablRashod.Cells[0,m] := CurrentCategoryRachodov^.Element.Name;

          end;

      end
    else
    tablRashod.RowCount := 2;
 end;
end;

procedure TnastroikaCategory.btnDeleteRashodClick(Sender: TObject);
Var k,i,vs: Integer;
bool:Boolean;
A: AdrCategoryRachodov;
var myRect: TGridRect;
var  l, r , m: Integer;
begin
currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoCategoryRashodov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (rowrashod < 1) or (vs = 0)
then
ShowMessage('Выберите категорию.') 
else
begin
     with tablRashod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

          k := 0;
  CurrentUser := FirstUser;
  for i := 1 to (ind -1 ) do
  begin
    CurrentUser := CurrentUser^.Next;
    k := k + CurrentUser^.Element.KolvoCategoryRashodov;
  end;
  CurrentUser := CurrentUser^.Next;




      CurrentCategoryRachodov := FirstCategoryRachodov;
      for i := 1 to (k + RowRashod) do
        begin
          CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
        end;
      if CurrentCategoryRachodov^.Next = nil
      then
      begin
      CurrentCategoryRachodov := FirstCategoryRachodov;
      for i := 1 to (k + RowRashod -1) do
        begin
          CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
        end;
      a := CurrentCategoryRachodov^.Next;
      CurrentCategoryRachodov^.Next := nil;
      Dispose(a);
      end
      else
      begin
      CurrentCategoryRachodov := FirstCategoryRachodov;
      for i := 1 to (k + RowRashod -1) do
        begin
          CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
        end;
      a := CurrentCategoryRachodov^.Next;
      CurrentCategoryRachodov^.Next := CurrentCategoryRachodov^.Next^.Next;
      Dispose(a);
      end;
      Rewrite(FileWithCategoryRachodov);
            CurrentCategoryRachodov := FirstCategoryRachodov;
              while CurrentCategoryRachodov^.Next <> nil do
                begin
                  CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
                  DataCategoryRachodov.Name := CurrentCategoryRachodov^.Element.Name;
                  DataCategoryRachodov.User := CurrentCategoryRachodov^.Element.User;
                  write(FileWithCategoryRachodov, DataCategoryRachodov);
                end;
            CloseFile(FileWithCategoryRachodov) ;

      CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoCategoryRashodov := CurrentUser^.Element.KolvoCategoryRashodov - 1;

            Rewrite(FileWithUsers);
          CurrentUser := FirstUser;
          while CurrentUser^.Next <> nil do
          begin
            CurrentUser := CurrentUser^.Next;
            DataUser.Name := CurrentUser^.Element.Name;
            DataUser.Password := CurrentUser^.Element.Password;
            DataUser.KolvoCategoryDohodov := CurrentUser^.Element.KolvoCategoryDohodov;
            DataUser.KolvoCategoryRashodov := CurrentUser^.Element.KolvoCategoryRashodov;
            DataUser.KolvoDolgnikov := CurrentUser^.Element.KolvoDolgnikov;
            DataUser.KolvoZaemchikov := CurrentUser^.Element.KolvoZaemchikov;
            DataUser.KolvoDohodov := CurrentUser^.Element.KolvoDohodov;
            DataUser.KolvoRashodov := CurrentUser^.Element.KolvoRashodov;
            DataUser.KolvoValut := CurrentUser^.Element.KolvoValut;
            DataUser.MoneyYouHave := CurrentUser^.Element.MoneyYouHave;
            DataUser.AreYouNewOne := CurrentUser^.Element.AreYouNewOne;
            write(FileWithUsers, DataUser);
          end;
          CloseFile(FileWithUsers);



   with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablDohod do
          begin
            Selection := myRect;
            Cells[0,0] := ' Категории доходов';
          end;
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoCategoryDohodov;
if vs <> 0
    then
      BEGIN
        tablDohod.RowCount := vs + 1;
        j := 0;

        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoCategoryDohodov;
          end;
        M:=0;
        CurrentCategoryDohodov := FirstCategoryDohodov ;
        for i := 1 to j do
          begin
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
          end;
        for I := 1 to vs do
          begin
            inc(m);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            tablDohod.Cells[0,m] := CurrentCategoryDohodov^.Element.Name;

          end;

      end
    else
    tablDohod.RowCount := 2;

    with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablRashod do
          begin
            Selection := myRect;
            Cells[0,0] := ' Категории расходов';
          end;
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoCategoryRashodov;
if vs <> 0
    then
      BEGIN
        tablRashod.RowCount := vs + 1;
        j := 0;

        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoCategoryRashodov;
          end;
        M:=0;
        CurrentCategoryRachodov := FirstCategoryRachodov ;
        for i := 1 to j do
          begin
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
          end;
        for I := 1 to vs do
          begin
            inc(m);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            tablRashod.Cells[0,m] := CurrentCategoryRachodov^.Element.Name;

          end;

      end
    else
    tablRashod.RowCount := 2;
end;
end;

end.
