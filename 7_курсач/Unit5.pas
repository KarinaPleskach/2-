unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MMSystem;

type
  TVi = class(TForm)
    lblName: TLabel;
    img1: TImage;
    lbl1: TLabel;
    edtPassword: TEdit;
    btn1: TButton;
    btn2: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Vi: TVi;

implementation

uses Unit2, Unit1, Unit4;

var k: Integer;

{$R *.dfm}


procedure TVi.FormShow(Sender: TObject);
begin
  lblName.Caption := AdminNames.tablVibor.Cells[ACol,ARow];
  edtPassword.Text := '';
  edtPassword.SetFocus;
  k := 0;
end;

procedure TVi.btn1Click(Sender: TObject);
var A: AdrUsers; B:AdrCategoryDohodov; C:AdrCategoryRachodov; D: AdrValuta;
E: AdrRashod; F:AdrDohod; H:AdrDolgi; G:AdrZaemi;
i, j, v, m: Integer;
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
    if (indeks = ARow) or (ARow = 1)
    then
    begin
      if ARow = 1
      then
        begin
          CurrentUser := FirstUser;
          CurrentUser := CurrentUser^.Next;
          j := CurrentUser^.Element.KolvoCategoryDohodov;
          for i := 1 to j do
          begin
            CurrentCategoryDohodov := FirstCategoryDohodov;
            B := CurrentCategoryDohodov^.Next;
            CurrentCategoryDohodov^.Next := CurrentCategoryDohodov^.Next^.Next;
            Dispose(B);
          end;

          CurrentUser := FirstUser;
          CurrentUser := CurrentUser^.Next;
          j := CurrentUser^.Element.KolvoCategoryRashodov;
          for i := 1 to j do
          begin
            CurrentCategoryRachodov := FirstCategoryRachodov;
            C := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Next := CurrentCategoryRachodov^.Next^.Next;
            Dispose(C);
          end;

          CurrentUser := FirstUser;
          CurrentUser := CurrentUser^.Next;
          j := CurrentUser^.Element.KolvoValut;
          for i := 1 to j do
          begin
            CurrentValuta := FirstValuta;
            D := CurrentValuta^.Next;
            CurrentValuta^.Next := CurrentValuta^.Next^.Next;
            Dispose(D);
          end;

          CurrentUser := FirstUser;
          CurrentUser := CurrentUser^.Next;
          j := CurrentUser^.Element.KolvoRashodov;
          for i := 1 to j do
          begin
            CurrentRashod := FirstRashod;
            E := CurrentRashod^.Next;
            CurrentRashod^.Next := CurrentRashod^.Next^.Next;
            Dispose(E);
          end;

          CurrentUser := FirstUser;
          CurrentUser := CurrentUser^.Next;
          j := CurrentUser^.Element.KolvoDohodov;
          for i := 1 to j do
          begin
            CurrentDohod := FirstDohod;
            F := CurrentDohod^.Next;
            CurrentDohod^.Next := CurrentDohod^.Next^.Next;
            Dispose(F);
          end;

          CurrentUser := FirstUser;
          CurrentUser := CurrentUser^.Next;
          j := CurrentUser^.Element.KolvoDolgnikov;
          for i := 1 to j do
          begin
            CurrentDolgi := FirstDolgi;
            H := CurrentDolgi^.Next;
            CurrentDolgi^.Next := CurrentDolgi^.Next^.Next;
            Dispose(H);
          end;

          CurrentUser := FirstUser;
          CurrentUser := CurrentUser^.Next;
          j := CurrentUser^.Element.KolvoZaemchikov;
          for i := 1 to j do
          begin
            CurrentZaemi := FirstZaemi;
            G := CurrentZaemi^.Next;
            CurrentZaemi^.Next := CurrentZaemi^.Next^.Next;
            Dispose(G);
          end;

          CurrentUser := FirstUser;
          A := CurrentUser^.Next;
          CurrentUser^.Next := CurrentUser^.Next^.Next;
          Dispose(A);
        end
      else
        begin
            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoCategoryDohodov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoCategoryDohodov;
            j := J + v;
            for i := 1 to v do
            begin
              CurrentCategoryDohodov := FirstCategoryDohodov;
              for m := 1 to (j-1) do
                begin
                  CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
                end;
              B := CurrentCategoryDohodov^.Next;
              CurrentCategoryDohodov^.Next := nil;
              Dispose(B);
            end;

            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoCategoryRashodov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoCategoryRashodov;
            j := J + v;
            for i := 1 to v do
            begin
              CurrentCategoryRachodov := FirstCategoryRachodov;
              for m := 1 to (j-1) do
                begin
                  CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
                end;
              C := CurrentCategoryRachodov^.Next;
              CurrentCategoryRachodov^.Next := nil;
              Dispose(C);
            end;

             j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoValut;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoValut;
            j := J + v;
            for i := 1 to v do
            begin
              CurrentValuta := FirstValuta;
              for m := 1 to (j-1) do
                begin
                  CurrentValuta := CurrentValuta^.Next;
                end;
              D := CurrentValuta^.Next;
              CurrentValuta^.Next := nil;
              Dispose(D);
            end;

            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoRashodov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoRashodov;
            j := J + v;
            for i := 1 to v do
            begin
              CurrentRashod := FirstRashod;
              for m := 1 to (j-1) do
                begin
                  CurrentRashod := CurrentRashod^.Next;
                end;
              E := CurrentRashod^.Next;
              CurrentRashod^.Next := nil;
              Dispose(E);
            end;

             j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoDohodov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoDohodov;
            j := J + v;
            for i := 1 to v do
            begin
              CurrentDohod := FirstDohod;
              for m := 1 to (j-1) do
                begin
                  CurrentDohod := CurrentDohod^.Next;
                end;
              F := CurrentDohod^.Next;
              CurrentDohod^.Next := nil;
              Dispose(F);
            end;

             j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoDolgnikov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoDolgnikov;
            j := J + v;
            for i := 1 to v do
            begin
              CurrentDolgi := FirstDolgi;
              for m := 1 to (j-1) do
                begin
                  CurrentDolgi := CurrentDolgi^.Next;
                end;
              H := CurrentDolgi^.Next;
              CurrentDolgi^.Next := nil;
              Dispose(H);
            end;

             j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoZaemchikov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoZaemchikov;
            j := J + v;
            for i := 1 to v do
            begin
              CurrentZaemi := FirstZaemi;
              for m := 1 to (j-1) do
                begin
                  CurrentZaemi := CurrentZaemi^.Next;
                end;
              G := CurrentZaemi^.Next;
              CurrentZaemi^.Next := nil;
              Dispose(G);
            end;

          CurrentUser := FirstUser;
          for i := 1 to (Arow-1) do
          begin
            CurrentUser := CurrentUser^.Next;
          end;
          A := CurrentUser^.Next;
          CurrentUser^.Next := nil;
          Dispose(A);
        end;
    end
    else
    begin
            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoCategoryDohodov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoCategoryDohodov;
            CurrentCategoryDohodov := FirstCategoryDohodov;
            for i := 1 to j do
            begin
              CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            end;
            for i := 1 to v do
            begin
              B := CurrentCategoryDohodov^.next;
              CurrentCategoryDohodov^.Next := CurrentCategoryDohodov^.Next^.Next;
              Dispose(B);
            end;

            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoCategoryRashodov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoCategoryRashodov;
            CurrentCategoryRachodov := FirstCategoryRachodov;
            for i := 1 to j do
            begin
              CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            end;
            for i := 1 to v do
            begin
              C := CurrentCategoryRachodov^.next;
              CurrentCategoryRachodov^.Next := CurrentCategoryRachodov^.Next^.Next;
              Dispose(c);
            end;

            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoValut;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoValut;
            CurrentValuta := FirstValuta;
            for i := 1 to j do
            begin
              CurrentValuta := CurrentValuta^.Next;
            end;
            for i := 1 to v do
            begin
              D := CurrentValuta^.next;
              CurrentValuta^.Next := CurrentValuta^.Next^.Next;
              Dispose(D);
            end;

            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoRashodov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoRashodov;
            CurrentRashod := FirstRashod;
            for i := 1 to j do
            begin
              CurrentRashod := CurrentRashod^.Next;
            end;
            for i := 1 to v do
            begin
              E := CurrentRashod^.next;
              CurrentRashod^.Next := CurrentRashod^.Next^.Next;
              Dispose(E);
            end;

            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoDohodov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoDohodov;
            CurrentDohod := FirstDohod;
            for i := 1 to j do
            begin
              CurrentDohod := CurrentDohod^.Next;
            end;
            for i := 1 to v do
            begin
              F := CurrentDohod^.next;
              CurrentDohod^.Next := CurrentDohod^.Next^.Next;
              Dispose(F);
            end;


            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoDolgnikov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoDolgnikov;
            CurrentDolgi := FirstDolgi;
            for i := 1 to j do
            begin
              CurrentDolgi := CurrentDolgi^.Next;
            end;
            for i := 1 to v do
            begin
              H := CurrentDolgi^.next;
              CurrentDolgi^.Next := CurrentDolgi^.Next^.Next;
              Dispose(H);
            end;


            j := 0;
            CurrentUser := FirstUser;
            For i := 1 to (ARow - 1) do
              begin
                CurrentUser := CurrentUser^.Next;
                j := j + CurrentUser^.Element.KolvoZaemchikov;
              end;
            CurrentUser := CurrentUser^.Next;
            v := CurrentUser^.Element.KolvoZaemchikov;
            CurrentZaemi := FirstZaemi;
            for i := 1 to j do
            begin
              CurrentZaemi := CurrentZaemi^.Next;
            end;
            for i := 1 to v do
            begin
              G := CurrentZaemi^.next;
              CurrentZaemi^.Next := CurrentZaemi^.Next^.Next;
              Dispose(G);
            end;


      CurrentUser := FirstUser;
      for i := 1 to (ARow-1) do
      begin
        CurrentUser := CurrentUser^.Next;
      end;
      A := CurrentUser^.next;
      CurrentUser^.Next := CurrentUser^.Next^.Next;
      Dispose(A);
    end;

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
    Rewrite(FileWithDohod);
            CurrentDohod := FirstDohod;
              while CurrentDohod^.Next <> nil do
                begin
                  CurrentDohod := CurrentDohod^.Next;
                  DataDohod.Money := CurrentDohod^.Element.Money;
                  DataDohod.User := CurrentDohod^.Element.User;
                  DataDohod.Valuta := CurrentDohod^.Element.Valuta;
                  DataDohod.Category := CurrentDohod^.Element.Category;
                  DataDohod.Day := CurrentDohod^.Element.Day;
                  write(FileWithDohod, DataDohod);
                end;
            CloseFile(FileWithDohod);
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
    Vi.Hide;
    AdminNames.Show;
  end;
end;

procedure TVi.btn2Click(Sender: TObject);
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  Vi.Hide;
  AdminNames.Show;
end;

procedure TVi.img1Click(Sender: TObject);
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
