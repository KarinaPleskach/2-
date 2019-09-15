    unit Unit3;

    interface

    uses
      Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, ExtCtrls, StdCtrls, MMSystem;

    type
      TFormName = class(TForm)
        lblName: TLabel;
        edtName: TEdit;
        lblPassword: TLabel;
        edtPassword1: TEdit;
        lblPassword1: TLabel;
        lblPassword2: TLabel;
        edtPassword2: TEdit;
        btnOk: TButton;
        btnDont: TButton;
        spl1: TSplitter;
        spl2: TSplitter;
        procedure btnDontClick(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
      private
        { Private declarations }
      public
        { Public declarations }
      end;

    var
      FormName: TFormName;

      bool: Boolean;

    implementation

    uses Unit1, Unit2, Unit4;

    {$R *.dfm}


    procedure TFormName.btnDontClick(Sender: TObject);
      begin
        PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        FormName.Close;
        AdminNames.Show;
      end;

    procedure TFormName.btnOkClick(Sender: TObject);
    var n: string;
    bool : boolean;
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
              edtPassword1.Text :='';
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
        
            New(CurrentUser^.Next);
            CurrentUser := CurrentUser^.Next;
            CurrentUser^.Element.Name := edtName.Text;
            CurrentUser^.Element.Password := edtPassword1.Text;
            CurrentUser^.Element.KolvoCategoryDohodov := 9;
            CurrentUser^.Element.KolvoCategoryRashodov := 12;
            CurrentUser^.Element.KolvoDolgnikov := 0;
            CurrentUser^.Element.KolvoZaemchikov := 0;
            CurrentUser^.Element.KolvoDohodov := 0;
            CurrentUser^.Element.KolvoRashodov := 0;
            CurrentUser^.Element.KolvoValut := 0;
            CurrentUser^.Element.MoneyYouHave := 0;
            CurrentUser^.Element.AreYouNewOne := 1;
            CurrentUser^.Next := nil;
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

            CurrentCategoryDohodov := FirstCategoryDohodov;
            while CurrentCategoryDohodov^.Next <> nil do
              CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;

            New(CurrentCategoryDohodov^.Next);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            CurrentCategoryDohodov^.Element.User := edtName.Text;
            CurrentCategoryDohodov^.Element.Name := 'Зарплата';
            CurrentCategoryDohodov^.Next := nil;
            New(CurrentCategoryDohodov^.Next);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            CurrentCategoryDohodov^.Element.User := edtName.Text;
            CurrentCategoryDohodov^.Element.Name := 'Сдача недвижимости';
            CurrentCategoryDohodov^.Next := nil;
            New(CurrentCategoryDohodov^.Next);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            CurrentCategoryDohodov^.Element.User := edtName.Text;
            CurrentCategoryDohodov^.Element.Name := 'Гонорар';
            CurrentCategoryDohodov^.Next := nil;
            New(CurrentCategoryDohodov^.Next);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            CurrentCategoryDohodov^.Element.User := edtName.Text;
            CurrentCategoryDohodov^.Element.Name := 'Лотерея';
            CurrentCategoryDohodov^.Next := nil;
            New(CurrentCategoryDohodov^.Next);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            CurrentCategoryDohodov^.Element.User := edtName.Text;
            CurrentCategoryDohodov^.Element.Name := 'Наследство';
            CurrentCategoryDohodov^.Next := nil;
            New(CurrentCategoryDohodov^.Next);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            CurrentCategoryDohodov^.Element.User := edtName.Text;
            CurrentCategoryDohodov^.Element.Name := 'Пенсия';
            CurrentCategoryDohodov^.Next := nil;
            New(CurrentCategoryDohodov^.Next);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            CurrentCategoryDohodov^.Element.User := edtName.Text;
            CurrentCategoryDohodov^.Element.Name := 'Подарок';
            CurrentCategoryDohodov^.Next := nil;
            New(CurrentCategoryDohodov^.Next);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            CurrentCategoryDohodov^.Element.User := edtName.Text;
            CurrentCategoryDohodov^.Element.Name := 'Стипендия';
            CurrentCategoryDohodov^.Next := nil;
            New(CurrentCategoryDohodov^.Next);
            CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
            CurrentCategoryDohodov^.Element.User := edtName.Text;
            CurrentCategoryDohodov^.Element.Name := 'Остальное';
            CurrentCategoryDohodov^.Next := nil;
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


            CurrentCategoryRachodov := FirstCategoryRachodov;
            while CurrentCategoryRachodov^.Next <> nil do
              CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;

            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Продукты питания';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Жильё';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Обслуживание машины';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Спорт';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Развлечения';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Общественный транспорт';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Здоровье';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Одежда';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Образование';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Телефон';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Праздники';
            CurrentCategoryRachodov^.Next := nil;
            New(CurrentCategoryRachodov^.Next);
            CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
            CurrentCategoryRachodov^.Element.User := edtName.Text;
            CurrentCategoryRachodov^.Element.Name := 'Остальное';
            CurrentCategoryRachodov^.Next := nil;
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
            AdminNames.Show;
            FormName.Hide;
          end;
      end;

    procedure TFormName.FormShow(Sender: TObject);
      begin
        edtName.Text := '';
        edtPassword1.Text := '';
        edtPassword2.Text := '';
        edtName.SetFocus;
      end;

end.
