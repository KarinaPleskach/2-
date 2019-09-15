    unit Unit1;

    interface

    uses
      Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, StdCtrls, Buttons, ExtCtrls, mmsystem,Grids;

    type
      TPassword = class(TForm)
    lbVibor: TLabel;
    cbVibor: TComboBox;
    btnVibor: TBitBtn;
    spl1: TSplitter;
    btnOk: TButton;
    btnExit: TButton;
    btnNooo: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure btnViborClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNoooClick(Sender: TObject);
      private
        { Private declarations }
      public
        { Public declarations }
      end;

    var
      Password: TPassword;

    type
      Elements = record
        Name, Password: string[30];
        KolvoCategoryDohodov, KolvoCategoryRashodov, KolvoDolgnikov, KolvoZaemchikov, KolvoDohodov, KolvoRashodov, KolvoValut: integer;
        MoneyYouHave, AreYouNewOne: Integer;
        end;

      AdrUsers = ^TUsers;
      TUsers = record
        Element: Elements;
        Next: AdrUsers;
      end;

    var
     FileWithUsers: file of Elements;

     FirstUser, CurrentUser: AdrUsers;
     DataUser: Elements;


      i, j: Integer;
      s: string;





    implementation

    uses Unit2, Unit4, Unit6, Unit8, Unit3, Unit5, Unit7, Unit9, Unit10, Unit11,Unit12,Unit13,Unit14,Unit15, Unit16, Unit17,Unit26;

    {$R *.dfm}


    procedure TPassword.btnViborClick(Sender: TObject);
      begin
        PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        AdminNames.Show;
        Password.Hide;
      end;

    procedure TPassword.btnOkClick(Sender: TObject);
      begin
        PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        s := cbVibor.Items[cbVibor.ItemIndex];
        if Length(s) <> 0
          then
            begin
              ViFormMain.Show;
              Password.Hide;
            end
          else
            begin
            ShowMessage('Выберите пользователя.');
            cbVibor.Text := '';
            end;
      end;

    procedure TPassword.btnExitClick(Sender: TObject);
      var
        i: Integer;
      begin
        PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\1.wav', 0, SND_ASYNC);
        i := 0;
          while i<10 do
           begin
              sleep(45);
              Application.ProcessMessages;
              inc(i);
           end;
        Password.Close;
        AdminNames.Close;
        FormName.Close;
        Change.Close;
        Vi.Close;
        ViForm.Close;
        ViFormMain.Close;
        MainForm.Close;
        NastroikaValut.Close;
        AddValut.Close;
        Attantion.Close;
        NastroikaCategory.Close;
        AddDohod.Close;
        AddRashod.Close;
        ChangeDohod.Close;
        ChangeRashod.Close;
        Otchet.Close;
      end;

      procedure TPassword.FormShow(Sender: TObject);
        begin
          cbVibor.Text := '';
          cbVibor.Items.Clear;
          AssignFile(FileWithCategoryDohodov, 'CategoryDohodov.txt');
          try
            Reset(FileWithCategoryDohodov);
            New(FirstCategoryDohodov);
            CurrentCategoryDohodov := FirstCategoryDohodov;
            CurrentCategoryDohodov^.Next := nil;
            while not EOF(FileWithCategoryDohodov) do
              begin
                Read(FileWithCategoryDohodov, DataCategoryDohodov);
                New(CurrentCategoryDohodov^.Next);
                CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
                CurrentCategoryDohodov^.Element.Name := DataCategoryDohodov.Name;
                CurrentCategoryDohodov^.Element.User := DataCategoryDohodov.User;
                CurrentCategoryDohodov^.Next := nil;
              end;
          except
            Rewrite(FileWithCategoryDohodov);
          end;
            CloseFile(FileWithCategoryDohodov);
          AssignFile(FileWithCategoryRachodov, 'CategoryRashodov.txt');
          try
            Reset(FileWithCategoryRachodov);
            New(FirstCategoryRachodov);
            CurrentCategoryRachodov := FirstCategoryRachodov;
            CurrentCategoryRachodov^.Next := nil;
            while not EOF(FileWithCategoryRachodov) do
              begin
                Read(FileWithCategoryRachodov, DataCategoryRachodov);
                New(CurrentCategoryRachodov^.Next);
                CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
                CurrentCategoryRachodov^.Element.Name := DataCategoryRachodov.Name;
                CurrentCategoryRachodov^.Element.User := DataCategoryRachodov.User;
                CurrentCategoryRachodov^.Next := nil;
              end;
          except
            Rewrite(FileWithCategoryRachodov);
          end;
            CloseFile(FileWithCategoryRachodov);
          AssignFile(FileWithValuta,'Valuta.txt');
          try
            Reset(FileWithValuta);
            New(FirstValuta);
            CurrentValuta := FirstValuta;
            CurrentValuta^.Next := nil;
            while not EOF(FileWithValuta) do
              begin
                Read(FileWithValuta, DataValuta);
                New(CurrentValuta^.Next);
                CurrentValuta := CurrentValuta^.Next;
                CurrentValuta^.Element.Name := DataValuta.Name;
                CurrentValuta^.Element.User := DataValuta.User;
                CurrentValuta^.Next := nil;
              end;
          except
            Rewrite(FileWithValuta);
          end;
            CloseFile(FileWithValuta);
          AssignFile(FileWithRashod,'Rashod.txt');
          try
            Reset(FileWithRashod);
            New(FirstRashod);
            CurrentRashod := FirstRashod;
            CurrentRashod^.Next := nil;
            while not EOF(FileWithRashod) do
              begin
                Read(FileWithRashod, DataRashod);
                New(CurrentRashod^.Next);
                CurrentRashod := CurrentRashod^.Next;
                CurrentRashod^.Element.Money := DataRashod.Money;
                CurrentRashod^.Element.Valuta := DataRashod.Valuta;
                CurrentRashod^.Element.Category := DataRashod.Category;
                CurrentRashod^.Element.Day := DataRashod.Day;
                CurrentRashod^.Element.User := DataRashod.User;
                CurrentRashod^.Next := nil;
              end;
          except
            Rewrite(FileWithRashod);
          end;
            CloseFile(FileWithRashod);
          AssignFile(FileWithDohod,'Dohod.txt');
          try
            Reset(FileWithDohod);
            New(FirstDohod);
            CurrentDohod := FirstDohod;
            CurrentDohod^.Next := nil;
            while not EOF(FileWithDohod) do
              begin
                Read(FileWithDohod, DataDohod);
                New(CurrentDohod^.Next);
                CurrentDohod := CurrentDohod^.Next;
                CurrentDohod^.Element.Money := DataDohod.money;
                CurrentDohod^.Element.Valuta := DataDohod.Valuta;
                CurrentDohod^.Element.Category := DataDohod.Category;
                CurrentDohod^.Element.Day := DataDohod.Day;
                CurrentDohod^.Element.User := DataDohod.User;
                CurrentDohod^.Next := nil;
              end;
          except
            Rewrite(FileWithDohod);
          end;
            CloseFile(FileWithDohod);
          AssignFile(FileWithDolgi,'Dolgi.txt');
          try
            Reset(FileWithDolgi);
            New(FirstDolgi);
            CurrentDolgi := FirstDolgi;
            CurrentDolgi^.Next := nil;
            while not EOF(FileWithDolgi) do
              begin
                Read(FileWithDolgi, DataDolgi);
                New(CurrentDolgi^.Next);
                CurrentDolgi := CurrentDolgi^.Next;
                CurrentDolgi^.Element.Name := DataDolgi.Name;
                CurrentDolgi^.Element.Money := DataDolgi.Money;
                CurrentDolgi^.Element.Valuta := DataDolgi.Valuta;
                CurrentDolgi^.Element.Day := DataDolgi.Day;
                CurrentDolgi^.Element.User := DataDolgi.User;
                CurrentDolgi^.Next := nil;
              end;
          except
            Rewrite(FileWithDolgi);
          end;
            CloseFile(FileWithDolgi);
          AssignFile(FileWithZaemi,'Zaemi.txt');
          try
            Reset(FileWithZaemi);
            New(FirstZaemi);
            CurrentZaemi := FirstZaemi;
            CurrentZaemi^.Next := nil;
            while not EOF(FileWithZaemi) do
              begin
                Read(FileWithZaemi, DataZaemi);
                New(CurrentZaemi^.Next);
                CurrentZaemi := CurrentZaemi^.Next;
                CurrentZaemi^.Element.Name := DataZaemi.Name;
                CurrentZaemi^.Element.Money := DataZaemi.MOney;
                CurrentZaemi^.Element.Valuta := DataZaemi.Valuta;
                CurrentZaemi^.Element.Day := DataZaemi.Day;
                CurrentZaemi^.Element.User := DataZaemi.User;
                CurrentZaemi^.Next := nil;
              end;
          except
            Rewrite(FileWithZaemi);
          end;
            CloseFile(FileWithZaemi);
          AssignFile(FileWithUsers, 'MyUsers.txt');
          try
            Reset(FileWithUsers);
            New(FirstUser);
            CurrentUser := FirstUser;
            CurrentUser^.Next := nil;
            while not EOF(FileWithUsers) do
              begin
                Read(FileWithUsers, DataUser);
                New(CurrentUser^.Next);
                CurrentUser := CurrentUser^.Next;
                CurrentUser^.Element.Name := DataUser.Name;
                CurrentUser^.Element.Password := DataUser.Password;
                CurrentUser^.Element.KolvoCategoryDohodov := DataUser.KolvoCategoryDohodov;
                CurrentUser^.Element.KolvoCategoryRashodov := DataUser.KolvoCategoryRashodov;
                CurrentUser^.Element.KolvoDolgnikov := DataUser.KolvoDolgnikov;
                CurrentUser^.Element.KolvoZaemchikov := DataUser.KolvoZaemchikov;
                CurrentUser^.Element.KolvoDohodov := DataUser.KolvoDohodov;
                CurrentUser^.Element.KolvoRashodov := DataUser.KolvoRashodov;
                CurrentUser^.Element.KolvoValut := DataUser.KolvoValut;
                CurrentUser^.Element.MoneyYouHave := DataUser.MoneyYouHave;
                CurrentUser^.Element.AreYouNewOne := DataUser.AreYouNewOne;
                CurrentUser^.Next := nil;
                cbVibor.Items.Add(DataUser.Name);
              end;
          except
            Rewrite(FileWithUsers);
          end;
          CloseFile(FileWithUsers);
        end;

procedure TPassword.btnNoooClick(Sender: TObject);
begin
  ShowMessage('Все данные удалены.');
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\1.wav', 0, SND_ASYNC);
Rewrite(FileWithUsers);
CloseFile(FileWithUsers);
Rewrite(FileWithCategoryDohodov);
CloseFile(FileWithCategoryDohodov);
Rewrite(FileWithCategoryRachodov);
CloseFile(FileWithCategoryRachodov);
Rewrite(FileWithValuta);
CloseFile(FileWithValuta);
Rewrite(FileWithRashod);
CloseFile(FileWithRashod);
Rewrite(FileWithDohod);
CloseFile(FileWithDohod);
Rewrite(FileWithDolgi);
CloseFile(FileWithDolgi);
Rewrite(FileWithZaemi);
CloseFile(FileWithZaemi);
cbVibor.Text := '';
          cbVibor.Items.Clear;
          AssignFile(FileWithCategoryDohodov, 'CategoryDohodov.txt');
          try
            Reset(FileWithCategoryDohodov);
            New(FirstCategoryDohodov);
            CurrentCategoryDohodov := FirstCategoryDohodov;
            CurrentCategoryDohodov^.Next := nil;
            while not EOF(FileWithCategoryDohodov) do
              begin
                Read(FileWithCategoryDohodov, DataCategoryDohodov);
                New(CurrentCategoryDohodov^.Next);
                CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
                CurrentCategoryDohodov^.Element.Name := DataCategoryDohodov.Name;
                CurrentCategoryDohodov^.Element.User := DataCategoryDohodov.User;
                CurrentCategoryDohodov^.Next := nil;
              end;
          except
            Rewrite(FileWithCategoryDohodov);
          end;
            CloseFile(FileWithCategoryDohodov);
          AssignFile(FileWithCategoryRachodov, 'CategoryRashodov.txt');
          try
            Reset(FileWithCategoryRachodov);
            New(FirstCategoryRachodov);
            CurrentCategoryRachodov := FirstCategoryRachodov;
            CurrentCategoryRachodov^.Next := nil;
            while not EOF(FileWithCategoryRachodov) do
              begin
                Read(FileWithCategoryRachodov, DataCategoryRachodov);
                New(CurrentCategoryRachodov^.Next);
                CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
                CurrentCategoryRachodov^.Element.Name := DataCategoryRachodov.Name;
                CurrentCategoryRachodov^.Element.User := DataCategoryRachodov.User;
                CurrentCategoryRachodov^.Next := nil;
              end;
          except
            Rewrite(FileWithCategoryRachodov);
          end;
            CloseFile(FileWithCategoryRachodov);
          AssignFile(FileWithValuta,'Valuta.txt');
          try
            Reset(FileWithValuta);
            New(FirstValuta);
            CurrentValuta := FirstValuta;
            CurrentValuta^.Next := nil;
            while not EOF(FileWithValuta) do
              begin
                Read(FileWithValuta, DataValuta);
                New(CurrentValuta^.Next);
                CurrentValuta := CurrentValuta^.Next;
                CurrentValuta^.Element.Name := DataValuta.Name;
                CurrentValuta^.Element.User := DataValuta.User;
                CurrentValuta^.Next := nil;
              end;
          except
            Rewrite(FileWithValuta);
          end;
            CloseFile(FileWithValuta);
          AssignFile(FileWithRashod,'Rashod.txt');
          try
            Reset(FileWithRashod);
            New(FirstRashod);
            CurrentRashod := FirstRashod;
            CurrentRashod^.Next := nil;
            while not EOF(FileWithRashod) do
              begin
                Read(FileWithRashod, DataRashod);
                New(CurrentRashod^.Next);
                CurrentRashod := CurrentRashod^.Next;
                CurrentRashod^.Element.Money := DataRashod.Money;
                CurrentRashod^.Element.Valuta := DataRashod.Valuta;
                CurrentRashod^.Element.Category := DataRashod.Category;
                CurrentRashod^.Element.Day := DataRashod.Day;
                CurrentRashod^.Element.User := DataRashod.User;
                CurrentRashod^.Next := nil;
              end;
          except
            Rewrite(FileWithRashod);
          end;
            CloseFile(FileWithRashod);
          AssignFile(FileWithDohod,'Dohod.txt');
          try
            Reset(FileWithDohod);
            New(FirstDohod);
            CurrentDohod := FirstDohod;
            CurrentDohod^.Next := nil;
            while not EOF(FileWithDohod) do
              begin
                Read(FileWithDohod, DataDohod);
                New(CurrentDohod^.Next);
                CurrentDohod := CurrentDohod^.Next;
                CurrentDohod^.Element.Money := DataDohod.money;
                CurrentDohod^.Element.Valuta := DataDohod.Valuta;
                CurrentDohod^.Element.Category := DataDohod.Category;
                CurrentDohod^.Element.Day := DataDohod.Day;
                CurrentDohod^.Element.User := DataDohod.User;
                CurrentDohod^.Next := nil;
              end;
          except
            Rewrite(FileWithDohod);
          end;
            CloseFile(FileWithDohod);
          AssignFile(FileWithDolgi,'Dolgi.txt');
          try
            Reset(FileWithDolgi);
            New(FirstDolgi);
            CurrentDolgi := FirstDolgi;
            CurrentDolgi^.Next := nil;
            while not EOF(FileWithDolgi) do
              begin
                Read(FileWithDolgi, DataDolgi);
                New(CurrentDolgi^.Next);
                CurrentDolgi := CurrentDolgi^.Next;
                CurrentDolgi^.Element.Name := DataDolgi.Name;
                CurrentDolgi^.Element.Money := DataDolgi.Money;
                CurrentDolgi^.Element.Valuta := DataDolgi.Valuta;
                CurrentDolgi^.Element.Day := DataDolgi.Day;
                CurrentDolgi^.Element.User := DataDolgi.User;
                CurrentDolgi^.Next := nil;
              end;
          except
            Rewrite(FileWithDolgi);
          end;
            CloseFile(FileWithDolgi);
          AssignFile(FileWithZaemi,'Zaemi.txt');
          try
            Reset(FileWithZaemi);
            New(FirstZaemi);
            CurrentZaemi := FirstZaemi;
            CurrentZaemi^.Next := nil;
            while not EOF(FileWithZaemi) do
              begin
                Read(FileWithZaemi, DataZaemi);
                New(CurrentZaemi^.Next);
                CurrentZaemi := CurrentZaemi^.Next;
                CurrentZaemi^.Element.Name := DataZaemi.Name;
                CurrentZaemi^.Element.Money := DataZaemi.MOney;
                CurrentZaemi^.Element.Valuta := DataZaemi.Valuta;
                CurrentZaemi^.Element.Day := DataZaemi.Day;
                CurrentZaemi^.Element.User := DataZaemi.User;
                CurrentZaemi^.Next := nil;
              end;
          except
            Rewrite(FileWithZaemi);
          end;
            CloseFile(FileWithZaemi);
          AssignFile(FileWithUsers, 'MyUsers.txt');
          try
            Reset(FileWithUsers);
            New(FirstUser);
            CurrentUser := FirstUser;
            CurrentUser^.Next := nil;
            while not EOF(FileWithUsers) do
              begin
                Read(FileWithUsers, DataUser);
                New(CurrentUser^.Next);
                CurrentUser := CurrentUser^.Next;
                CurrentUser^.Element.Name := DataUser.Name;
                CurrentUser^.Element.Password := DataUser.Password;
                CurrentUser^.Element.KolvoCategoryDohodov := DataUser.KolvoCategoryDohodov;
                CurrentUser^.Element.KolvoCategoryRashodov := DataUser.KolvoCategoryRashodov;
                CurrentUser^.Element.KolvoDolgnikov := DataUser.KolvoDolgnikov;
                CurrentUser^.Element.KolvoZaemchikov := DataUser.KolvoZaemchikov;
                CurrentUser^.Element.KolvoDohodov := DataUser.KolvoDohodov;
                CurrentUser^.Element.KolvoRashodov := DataUser.KolvoRashodov;
                CurrentUser^.Element.KolvoValut := DataUser.KolvoValut;
                CurrentUser^.Element.MoneyYouHave := DataUser.MoneyYouHave;
                CurrentUser^.Element.AreYouNewOne := DataUser.AreYouNewOne;
                CurrentUser^.Next := nil;
                cbVibor.Items.Add(DataUser.Name);
              end;
          except
            Rewrite(FileWithUsers);
          end;
          CloseFile(FileWithUsers);
end;

end.
