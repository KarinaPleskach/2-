unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,MMSystem;

type
  TAddDohod = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    spl1: TSplitter;
    btnOk: TButton;
    btnDont: TButton;
    procedure btnDontClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddDohod: TAddDohod;

implementation
Uses Unit1,Unit4,Unit12;
{$R *.dfm}

Var stroka :string[30];

procedure TAddDohod.btnDontClick(Sender: TObject);
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  AddDohod.Hide;
  nastroikaCategory.Show;
end;

procedure TAddDohod.btnOkClick(Sender: TObject);

var  n: string;
bool:Boolean;
i,j, vs, thelast, k, d:Integer;
Q:AdrCategoryDohodov;
begin
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
                  ShowMessage('Зачем вам две одинаковые категории?');
                  edtName.Text := '';
                  edtName.SetFocus;
                  Break;
                end;
          end;


        end;







  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);

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
      for i := 1 to (k + d) do
        begin
          CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
        end;
      if CurrentCategoryDohodov^.Next = nil
      then
      begin
      New(CurrentCategoryDohodov^.next);
      CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
      CurrentCategoryDohodov^.Element.Name := edtName.Text;
      CurrentCategoryDohodov^.Element.User := GlobalName;
      CurrentCategoryDohodov^.Next := nil;
      end
      else
      begin
      New(Q);
      Q^.Element.Name := edtName.Text;
      Q^.Element.User := GlobalName;
      Q^.Next := CurrentCategoryDohodov^.Next;
      CurrentCategoryDohodov^.Next := Q;
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
        CurrentUser^.Element.KolvoCategoryDohodov := CurrentUser^.Element.KolvoCategoryDohodov + 1;

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
           AddDohod.Hide;
           nastroikaCategory.Show;
      end


end;

procedure TAddDohod.FormShow(Sender: TObject);
begin

edtName.Text := '';
edtName.SetFocus;
end;

end.
