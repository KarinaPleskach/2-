unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,MMSystem;

type
  TChangeRashod = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    spl1: TSplitter;
    btnOk: TButton;
    btnDont: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnDontClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangeRashod: TChangeRashod;

implementation
Uses Unit1,Unit4,Unit12;
{$R *.dfm}
var kolvodo:Integer;
name1: string;

procedure TChangeRashod.FormShow(Sender: TObject);
var i: Integer;
begin
  kolvodo := 0;
  CurrentUser := FirstUser;
  for i := 1 to (ind-1) do
    begin
      CurrentUser := CurrentUser^.Next;
      kolvodo := kolvodo + CurrentUser^.Element.KolvoCategoryRashodov;
    end;
  CurrentCategoryRachodov := FirstCategoryRachodov;
  for i:= 1 to (kolvodo+rowRashod) do
  begin
    CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
  end;
  edtName.Text := CurrentCategoryRachodov^.Element.Name;
  Name1 := CurrentcategoryRachodov^.Element.Name;
  CurrentCategoryRachodov^.Element.Name := '';
  edtName.SetFocus;
end;

procedure TChangeRashod.btnOkClick(Sender: TObject);
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
              k := k + CurrentUser^.Element.KolvoCategoryRashodov;
            end;
            CurrentUser := CurrentUser^.Next;
            d := CurrentUser^.Element.KolvoCategoryRashodov;



            CurrentCategoryRachodov := FirstCategoryRachodov;
        for i := 1 to k do
          begin
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
          end;
        for I := 1 to d do
          begin

            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            if CurrentCategoryRachodov^.Element.Name = edtName.Text
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


            CurrentCategoryRachodov := FirstCategoryRachodov;
            for i := 1 to (kolvodo+rowRashod) do
              begin
                CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
              end;
            CurrentCategoryRachodov^.Element.Name := edtName.Text;

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


            nastroikaCategory.Show;
            ChangeRashod.Hide;
          end;
end;

procedure TChangeRashod.btnDontClick(Sender: TObject);
var i:Integer;
begin
  kolvodo := 0;
  CurrentUser := FirstUser;
  for i := 1 to (ind-1) do
    begin
      CurrentUser := CurrentUser^.Next;
      kolvodo := kolvodo + CurrentUser^.Element.KolvoCategoryRashodov;
    end;
  CurrentCategoryRachodov := FirstCategoryRachodov;
  for i:= 1 to (kolvodo+rowRashod) do
  begin
    CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
  end;
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  CurrentCategoryRachodov^.Element.Name := name1;
  ChangeRashod.Hide;
  nastroikaCategory.Show;
end;

end.
