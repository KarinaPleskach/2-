unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MMSystem;

type
  TChange = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    spl1: TSplitter;
    lblPassword: TLabel;
    lblPassword1: TLabel;
    edtPassword1: TEdit;
    lblPassword2: TLabel;
    edtPassword2: TEdit;
    spl2: TSplitter;
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
  Change: TChange;

implementation

Uses Unit2, Unit3, Unit1, Unit4;


var name1, pass: string;



{$R *.dfm}

procedure TChange.FormShow(Sender: TObject);
var i: Integer;
begin
  CurrentUser := FirstUser;
  for i := 1 to ARow do
    begin
      CurrentUser := CurrentUser^.Next;
    end;
  edtName.Text := CurrentUser^.Element.Name;
  edtPassword1.Text := CurrentUser^.Element.Password;
  edtPassword2.Text := CurrentUser^.Element.Password;
  Name1 := CurrentUser^.Element.Name;
  pass :=  CurrentUser^.Element.Password;
  CurrentUser^.Element.Name := '';
  CurrentUser^.Element.Password := '';
  edtName.SetFocus;
end;

procedure TChange.btnDontClick(Sender: TObject);
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  CurrentUser^.Element.Name := name1;
  CurrentUser^.Element.Password := pass;
  Change.Hide;
  AdminNames.Show;
end;

procedure TChange.btnOkClick(Sender: TObject);
var n: string;
bool: Boolean;
i, j, k: Integer;
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
              ShowMessage('Введите имя.');
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
                ShowMessage('Слишком длинное имя.');
                Delete(n, 30, Length(n));
                edtName.Text := n;
                edtName.SetFocus;
                bool := False;
              end;
        end;

        if bool
        then
        begin
          if Length(edtPassword1.Text) > 30
            then
              begin
                n := edtPassword1.Text;
                ShowMessage('Слишком длинный пароль.');
                Delete(n, 30, Length(n));
                edtPassword1.Text := n;
                edtPassword1.SetFocus;
                bool := False;
              end;
        end;

        if bool
        then
        begin
          n := edtPassword1.Text;
          while Pos(' ', n)<>0 do
            Delete (n, Pos(' ', n), 1);
        if Length(n) = 0
          then
            begin
              bool := False;
              ShowMessage('Введите пароль.');
              edtPassword1.SetFocus;
              edtPassword1.Text := '';
            end;
        end;

        if bool
        then
        begin
          n := edtPassword2.Text;
          while Pos(' ', n)<>0 do
            Delete (n, Pos(' ', n), 1);
        if Length(n) = 0
          then
            begin
              bool := False;
              ShowMessage('Повторите пароль.');
              edtPassword2.SetFocus;
              edtPassword2.Text := '';
            end;
        end;

        if bool
        then
        begin
        if edtPassword1.Text <> edtPassword2.Text
          then
            begin
              bool := False;
              ShowMessage('Повторный пароль введен неверно.');
              edtPassword2.SetFocus;
            end;
        end;

        if bool
        then
        begin
        CurrentUser := FirstUser;
        while CurrentUser^.Next <> nil do
          begin
            CurrentUser := CurrentUser^.Next;
            if edtName.Text = CurrentUser^.Element.Name
              then
                begin
                  bool := False;
                  ShowMessage('Такой пользователь уже есть.');
                  edtName.Text := '';
                  edtName.SetFocus;
                  Break;
                end;
          end;
        end;

        if bool
          then
          begin
            CurrentUser := FirstUser;
            for i := 1 to ARow do
              begin
                CurrentUser := CurrentUser^.Next;
              end;
            CurrentUser^.Element.Name := edtName.Text;
            CurrentUser^.Element.Password := edtPassword1.Text;

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


            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoCategoryDohodov;
              end;
            CurrentUser := CurrentUser^.Next;
            k := CurrentUser^.Element.KolvoCategoryDohodov;
            CurrentCategoryDohodov := FirstCategoryDohodov;
            for i := 1 to j do
            begin
              CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            end;
            for i := 1 to k do
            begin
              CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
              CurrentCategoryDohodov^.Element.User := edtName.Text;
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
            CloseFile(FileWithCategoryDohodov);


            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoCategoryRashodov;
              end;
            CurrentUser := CurrentUser^.Next;
            k := CurrentUser^.Element.KolvoCategoryRashodov;
            CurrentCategoryRachodov := FirstCategoryRachodov;
            for i := 1 to j do
            begin
              CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            end;
            for i := 1 to k do
            begin
              CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
              CurrentCategoryRachodov^.Element.User := edtName.Text;
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
            CloseFile(FileWithCategoryRachodov);


            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoValut;
              end;
            CurrentUser := CurrentUser^.Next;
            k := CurrentUser^.Element.KolvoValut;
            CurrentValuta := FirstValuta;
            for i := 1 to j do
            begin
              CurrentValuta := CurrentValuta^.Next;
            end;
            for i := 1 to k do
            begin
              CurrentValuta := CurrentValuta^.Next;
              CurrentValuta^.Element.User := edtName.Text;
            end;
            Rewrite(FileWithValuta);
            CurrentValuta := FirstValuta;
              while CurrentValuta^.Next <> nil do
                begin
                  CurrentValuta := CurrentValuta^.Next;
                  DataValuta.Name := CurrentValuta^.Element.Name;
                  DataValuta.User := CurrentValuta^.Element.User;
                  write(FileWithValuta, DataValuta);
                end;
            CloseFile(FileWithValuta);


            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoDohodov;
              end;
            CurrentUser := CurrentUser^.Next;
            k := CurrentUser^.Element.KolvoDohodov;
            CurrentDohod := FirstDohod;
            for i := 1 to j do
            begin
              CurrentDohod := CurrentDohod^.Next;
            end;
            for i := 1 to k do
            begin
              CurrentDohod := CurrentDohod^.Next;
              CurrentDohod^.Element.User := edtName.Text;
            end;
            Rewrite(FileWithDohod);
            CurrentDohod := FirstDohod;
              while CurrentDohod^.Next <> nil do
                begin
                  CurrentDohod := CurrentDohod^.Next;
                  DataDohod.Money := CurrentDohod^.Element.money;
                  DataDohod.User := CurrentDohod^.Element.User;
                  DataDohod.Valuta := CurrentDohod^.Element.Valuta;
                  DataDohod.Category := CurrentDohod^.Element.Category;
                  DataDohod.Day := CurrentDohod^.Element.Day;
                  write(FileWithDohod, DataDohod);
                end;
            CloseFile(FileWithDohod);


            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoRashodov;
              end;
            CurrentUser := CurrentUser^.Next;
            k := CurrentUser^.Element.KolvoRashodov;
            CurrentRashod := FirstRashod;
            for i := 1 to j do
            begin
              CurrentRashod := CurrentRashod^.Next;
            end;
            for i := 1 to k do
            begin
              CurrentRashod := CurrentRashod^.Next;
              CurrentRashod^.Element.User := edtName.Text;
            end;
            Rewrite(FileWithRashod);
            CurrentRashod := FirstRashod;
              while CurrentRashod^.Next <> nil do
                begin
                  CurrentRashod := CurrentRashod^.Next;
                  DataRashod.Money := CurrentRashod^.Element.Money;
                  DataRashod.User := CurrentRashod^.Element.User;
                  DataRashod.Valuta := CurrentRashod^.Element.Valuta;
                  DataRashod.Category := CurrentRashod^.Element.Category;
                  DataRashod.Day := CurrentRashod^.Element.Day;
                  write(FileWithRashod, DataRashod);
                end;
            CloseFile(FileWithRashod);

            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoDolgnikov;
              end;
            CurrentUser := CurrentUser^.Next;
            k := CurrentUser^.Element.KolvoDolgnikov;
            CurrentDolgi := FirstDolgi;
            for i := 1 to j do
            begin
              CurrentDolgi := CurrentDolgi^.Next;
            end;
            for i := 1 to k do
            begin
              CurrentDolgi := CurrentDolgi^.Next;
              CurrentDolgi^.Element.User := edtName.Text;
            end;
            Rewrite(FileWithDolgi);
            CurrentDolgi := FirstDolgi;
              while CurrentDolgi^.Next <> nil do
                begin
                  CurrentDolgi := CurrentDolgi^.Next;
                  DataDolgi.Name := CurrentDolgi^.Element.Name;
                  DataDolgi.Money := CurrentDolgi^.Element.Money;
                  DataDolgi.User := CurrentDolgi^.Element.User;
                  DataDolgi.Valuta := CurrentDolgi^.Element.Valuta;
                  DataDolgi.Day := CurrentDolgi^.Element.Day;
                  write(FileWithDolgi, DataDolgi);
                end;
            CloseFile(FileWithDolgi);


            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoZaemchikov;
              end;
            CurrentUser := CurrentUser^.Next;
            k := CurrentUser^.Element.KolvoZaemchikov;
            CurrentZaemi := FirstZaemi;
            for i := 1 to j do
            begin
              CurrentZaemi := CurrentZaemi^.Next;
            end;
            for i := 1 to k do
            begin
              CurrentZaemi := CurrentZaemi^.Next;
              CurrentZaemi^.Element.User := edtName.Text;
            end;
            Rewrite(FileWithZaemi);
            CurrentZaemi := FirstZaemi;
              while CurrentZaemi^.Next <> nil do
                begin
                  CurrentZaemi := CurrentZaemi^.Next;
                  DataZaemi.Name := CurrentZaemi^.Element.Name;
                  DataZaemi.Money := CurrentZaemi^.Element.Money;
                  DataZaemi.User := CurrentZaemi^.Element.User;
                  DataZaemi.Valuta := CurrentZaemi^.Element.Valuta;
                  DataZaemi.Day := CurrentZaemi^.Element.Day;
                  write(FileWithZaemi, DataZaemi);
                end;
            CloseFile(FileWithZaemi);

            AdminNames.Show;
            Change.Hide;
          end;
end;

end.
