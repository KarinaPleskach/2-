unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MMSystem, StdCtrls, ExtCtrls,grids;

type
  TAttantion = class(TForm)
    img1: TImage;
    mmo1: TMemo;
    lblName: TLabel;
    lbl1: TLabel;
    spl1: TSplitter;
    btnYes: TButton;
    btnNo: TButton;
    procedure btnNoClick(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Attantion: TAttantion;

implementation

Uses Unit1, Unit4, Unit9;

{$R *.dfm}

procedure TAttantion.btnNoClick(Sender: TObject);
begin
 PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
Attantion.HIde;
NastroikaValut.Show;
end;

procedure TAttantion.btnYesClick(Sender: TObject);
var i, j,k,vs,m,count: Integer;
val:string;
AdValuta : AdrValuta;
addohod:AdrDohod;
adRashod:AdrRashod;
adDolgi:AdrDolgi;
adZaemi:AdrZaemi;
var myRect: TGridRect;
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
k := 0;
CurrentUser := FirstUser;
  for i := 1 to (ind -1 ) do
  begin
    CurrentUser := CurrentUser^.Next;
    k := k + CurrentUser^.Element.KolvoValut;
  end;


    CurrentValuta := FirstValuta;
      for i := 1 to (k + row) do
        begin
          CurrentValuta := CurrentValuta^.Next;
        end;
        val := CurrentValuta^.Element.Name;


      CurrentValuta := FirstValuta;
      for i := 1 to (k + Row) do
        begin
          CurrentValuta := CurrentValuta^.Next;
        end;

      if CurrentValuta^.Next = nil
      then
      begin
      CurrentValuta := FirstValuta;
      for i := 1 to (k + row -1) do
        begin
          CurrentValuta := CurrentValuta^.Next;
        end;
      AdValuta := CurrentValuta^.Next;
      CurrentValuta^.Next := nil;
      Dispose(AdValuta);
      end
      else
      begin
      CurrentValuta := FirstValuta;
      for i := 1 to (k + row -1) do
        begin
          CurrentValuta := CurrentValuta^.Next;
        end;
      AdValuta := CurrentValuta^.Next;
      CurrentValuta^.Next := CurrentValuta^.Next^.Next;
      Dispose(advaluta);
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

      CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoValut := CurrentUser^.Element.KolvoValut - 1;

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

          with NastroikaValut.tablVibor do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with NastroikaValut.tablVibor do
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
        NastroikaValut.tablVibor.RowCount := vs + 1;
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
            NastroikaValut.tablVibor.Cells[0,m] := CurrentValuta^.Element.Name;

          end;

      end
    else
    NastroikaValut.tablVibor.RowCount := 2;





    k := 0;
CurrentUser := FirstUser;
  for i := 1 to (ind -1 ) do
  begin
    CurrentUser := CurrentUser^.Next;
    k := k + CurrentUser^.Element.KolvoDohodov;
  end;
  CurrentUser := CurrentUser^.Next;
    vs := CurrentUser^.Element.KolvoDohodov;

   CurrentDohod := FirstDohod;
      for i := 1 to k  do
        begin
          CurrentDohod := CurrentDohod^.Next;
        end;
   count := 0;
   M := 1 ;
   for i := 1 to vs do
   begin
     CurrentDohod := CurrentDohod^.Next;
     if CurrentDohod^.Element.Valuta = val
     then
      begin
         if Currentdohod^.Next = nil
            then
            begin
            Currentdohod := Firstdohod;
            for j := 1 to (k + m -1) do
              begin
                Currentdohod := Currentdohod^.Next;
              end;
            Addohod := Currentdohod^.Next;
            Currentdohod^.Next := nil;
            Dispose(Addohod);
            inc(count);
            end
            else
            begin
            CurrentDohod := FirstDohod;
              for j := 1 to (k +m -1) do
                begin
                  Currentdohod := Currentdohod^.Next;
                end;
            Addohod := Currentdohod^.Next;
            CurrentDohod^.Next := CurrentDohod^.Next^.Next;
            Dispose(adDohod);

            inc(count);
            end;
      end
      else
      Inc(m);
   end;
   CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoDohodov := CurrentUser^.Element.KolvoDohodov - count;
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

   k := 0;
CurrentUser := FirstUser;
  for i := 1 to (ind -1 ) do
  begin
    CurrentUser := CurrentUser^.Next;
    k := k + CurrentUser^.Element.KolvoRashodov;
  end;
  CurrentUser := CurrentUser^.Next;
    vs := CurrentUser^.Element.KolvoRashodov;

   CurrentRashod:= Firstrashod;
      for i := 1 to k  do
        begin
          Currentrashod := Currentrashod^.Next;
        end;
   count := 0;
   M := 1 ;
   for i := 1 to vs do
   begin
     Currentrashod := CurrentRashod^.Next;
     if Currentrashod^.Element.Valuta = val
     then
      begin
         if Currentrashod^.Next = nil
            then
            begin
            Currentrashod := FirstRashod;
            for j := 1 to (k + m -1) do
              begin
                Currentrashod := CurrentRashod^.Next;
              end;
            Adrashod := CurrentRashod^.Next;
            Currentrashod^.Next := nil;
            Dispose(Adrashod);
            inc(count);
            end
            else
            begin
            Currentrashod := Firstrashod;
              for j := 1 to (k +m -1) do
                begin
                  Currentrashod := Currentrashod^.Next;
                end;
            Adrashod := Currentrashod^.Next;
            Currentrashod^.Next := Currentrashod^.Next^.Next;
            Dispose(adrashod);

            inc(count);
            end;
      end
      else inc(m);
   end;
   CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoRashodov := CurrentUser^.Element.KolvoRashodov - count;
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


         k := 0;
CurrentUser := FirstUser;
  for i := 1 to (ind -1 ) do
  begin
    CurrentUser := CurrentUser^.Next;
    k := k + CurrentUser^.Element.KolvoDolgnikov;
  end;
  CurrentUser := CurrentUser^.Next;
    vs := CurrentUser^.Element.KolvoDolgnikov;

   Currentdolgi:= Firstdolgi;
      for i := 1 to k  do
        begin
          Currentdolgi := Currentdolgi^.Next;
        end;
   count := 0;
   M := 1 ;
   for i := 1 to vs do
   begin
     Currentdolgi := Currentdolgi^.Next;
     if Currentdolgi^.Element.Valuta = val
     then
      begin
         if Currentdolgi^.Next = nil
            then
            begin
            Currentdolgi := Firstdolgi;
            for j := 1 to (k + m -1) do
              begin
                Currentdolgi := Currentdolgi^.Next;
              end;
            Addolgi := Currentdolgi^.Next;
            Currentdolgi^.Next := nil;
            Dispose(Addolgi);
            inc(count);
            end
            else
            begin
            Currentdolgi := Firstdolgi;
              for j := 1 to (k +m -1) do
                begin
                  Currentdolgi := Currentdolgi^.Next;
                end;
            Addolgi := Currentdolgi^.Next;
            Currentdolgi^.Next := Currentdolgi^.Next^.Next;
            Dispose(addolgi);

            inc(count);
            end;
      end
      else inc(m)
   end;
   CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoDolgnikov := CurrentUser^.Element.KolvoDolgnikov - count;
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

  
         k := 0;
CurrentUser := FirstUser;
  for i := 1 to (ind -1 ) do
  begin
    CurrentUser := CurrentUser^.Next;
    k := k + CurrentUser^.Element.KolvoZaemchikov;
  end;
  CurrentUser := CurrentUser^.Next;
    vs := CurrentUser^.Element.KolvoZaemchikov;

   CurrentZaemi:= FirstZaemi;
      for i := 1 to k  do
        begin
          CurrentZaemi := CurrentZaemi^.Next;
        end;
   count := 0;
   M := 1 ;
   for i := 1 to vs do
   begin
     CurrentZaemi := CurrentZaemi^.Next;
     if CurrentZaemi^.Element.Valuta = val
     then
      begin
         if CurrentZaemi^.Next = nil
            then
            begin
            CurrentZaemi := FirstZaemi;
            for j := 1 to (k + m -1) do
              begin
                CurrentZaemi := CurrentZaemi^.Next;
              end;
            Adzaemi := CurrentZaemi^.Next;
            CurrentZaemi^.Next := nil;
            Dispose(AdZaemi);
            inc(count);
            end
            else
            begin
            CurrentZaemi := FirstZaemi;
              for j := 1 to (k +m -1) do
                begin
                  CurrentZaemi := CurrentZaemi^.Next;
                end;
            AdZaemi := CurrentZaemi^.Next;
            CurrentZaemi^.Next := CurrentZaemi^.Next^.Next;
            Dispose(adZaemi);

            inc(count);
            end;
      end
      else inc(m)
   end;
   CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoZaemchikov := CurrentUser^.Element.KolvoZaemchikov - count;
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

Attantion.Hide;
NastroikaValut.Show;
end;

procedure TAttantion.FormShow(Sender: TObject);
var i, j, kolValutUser: Integer;
begin
  j := 0;
  CurrentUser := FirstUser;
  for i := 1 to (ind-1) do
    begin
      CurrentUser := CurrentUser^.Next;
      j := j + CurrentUser^.Element.KolvoValut;
    end;

  CurrentValuta := FirstValuta;
  for I := 1 to (j + row) do
    begin
      CurrentValuta := CurrentValuta^.Next;
    end;
  lblName.Caption := CurrentValuta^.Element.Name;



end;



end.
