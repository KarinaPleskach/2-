unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,MMSystem;

type
  TChangeDohod = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    spl1: TSplitter;
    btnOk: TButton;
    btnDont: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnDontClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangeDohod: TChangeDohod;

implementation
Uses Unit1,Unit4,Unit12;
{$R *.dfm}
var kolvodo:Integer;
name1: string;


procedure TChangeDohod.FormShow(Sender: TObject);
var i: Integer;
begin
  kolvodo := 0;
  CurrentUser := FirstUser;
  for i := 1 to (ind-1) do
    begin
      CurrentUser := CurrentUser^.Next;
      kolvodo := kolvodo + CurrentUser^.Element.KolvoCategoryDohodov;
    end;
  CurrentCategoryDohodov := FirstCategoryDohodov;
  for i:= 1 to (kolvodo+rowDohod) do
  begin
    CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
  end;
  edtName.Text := CurrentCategoryDohodov^.Element.Name;
  Name1 := CurrentcategoryDohodov^.Element.Name;
  CurrentCategoryDohodov^.Element.Name := '';
  edtName.SetFocus;
end;

procedure TChangeDohod.btnDontClick(Sender: TObject);
var i :Integer;
begin
   PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);

   kolvodo := 0;
  CurrentUser := FirstUser;
  for i := 1 to (ind-1) do
    begin
      CurrentUser := CurrentUser^.Next;
      kolvodo := kolvodo + CurrentUser^.Element.KolvoCategoryDohodov;
    end;
  CurrentCategoryDohodov := FirstCategoryDohodov;
  for i:= 1 to (kolvodo+rowDohod) do
  begin
    CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
  end;

  CurrentCategoryDohodov^.Element.Name := name1;
  ChangeDohod.Hide;
  nastroikaCategory.Show;
end;

procedure TChangeDohod.btnOkClick(Sender: TObject);
 var n: string;
bool: Boolean;
i, j, k,d: Integer;


begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        bool := True;
        n := edtName.Text;
        while Pos(' ', n)<>0 do
          Delete (n, Pos(' ', n), 1);
        if Length(n) = 0
          then
            begin
              bool := False;
              ShowMessage('Введите категорию.');
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
                ShowMessage('Слишком длинная категория.');
                Delete(n, 30, Length(n));
                edtName.Text := n;
                edtName.SetFocus;
                bool := False;
              end;
        end;

        if bool
        then
        begin
         k := 0;
            CurrentUser := FirstUser;
            for i := 1 to (ind -1 ) do
            begin
              CurrentUser := CurrentUser^.Next;
              k := k + CurrentUser^.Element.KolvoCategoryDohodov;
            end;
            CurrentUser := CurrentUser^.Next;
            d := CurrentUser^.Element.KolvoCategoryDohodov;



            CurrentCategoryDohodov := FirstCategoryDohodov;
        for i := 1 to k do
          begin
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
          end;
        for I := 1 to d do
          begin

            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            if CurrentCategoryDohodov^.Element.Name = edtName.Text
            then
            begin
                  bool := False;
                  ShowMessage('Такая категория уже есть.');
                  edtName.Text := '';
                  edtName.SetFocus;
                  Break;
                end;
          end;
        end;

        if bool
          then
          begin


            CurrentCategoryDohodov := FirstCategoryDohodov;
            for i := 1 to (kolvodo+rowDohod) do
              begin
                CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
              end;
            CurrentCategoryDohodov^.Element.Name := edtName.Text;

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


            nastroikaCategory.Show;
            ChangeDohod.Hide;
          end;
end;


end.
