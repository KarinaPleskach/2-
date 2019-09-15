      unit Unit8;

      interface

      uses
        Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
        Dialogs, MMSystem, StdCtrls, ExtCtrls;

      type
        TViFormMain = class(TForm)
          img1: TImage;
          lbl1: TLabel;
          lblName: TLabel;
          lbl2: TLabel;
          edtPassword: TEdit;
          btnOk: TButton;
          btnDont: TButton;
          procedure FormShow(Sender: TObject);
          procedure img1Click(Sender: TObject);
          procedure btnOkClick(Sender: TObject);
          procedure btnDontClick(Sender: TObject);
        private
          { Private declarations }
        public
          { Public declarations }
        end;

      var
        ViFormMain: TViFormMain;

      implementation

      uses Unit2, Unit4, Unit1;

      var k: Integer;

      {$R *.dfm}

      procedure TViFormMain.FormShow(Sender: TObject);
      begin
        lblName.Caption := Password.cbVibor.Items[Password.cbVibor.ItemIndex];;
        edtPassword.Text := '';
        edtPassword.SetFocus;
        k := 0;
      end;

      procedure TViFormMain.img1Click(Sender: TObject);
      begin
        CurrentUser := FirstUser;
        repeat
          CurrentUser := CurrentUser^.Next;
        until CurrentUser^.Element.Name = Password.cbVibor.Items[Password.cbVibor.ItemIndex];
        ShowMessage(currentUser^.Element.Password);
      end;

      procedure TViFormMain.btnOkClick(Sender: TObject);
      begin
        PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        CurrentUser := FirstUser;
        repeat
          CurrentUser := CurrentUser^.Next;
        until CurrentUser^.Element.Name = Password.cbVibor.Items[Password.cbVibor.ItemIndex];

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
          ViFormMain.Hide;
          MainForm.show;
          New(FirstSpisokValut);
          CurrentSpisokValut := FirstSpisokValut;
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Австрийский шиллинг';
          CurrentSpisokValut^.Element.Kod := 'ATS';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Азербайджанский манат';
          CurrentSpisokValut^.Element.Kod := 'AZN';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Алжирский динар';
          CurrentSpisokValut^.Element.Kod := 'DZD';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Английский фунт стерлингов';
          CurrentSpisokValut^.Element.Kod := 'GBP';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Белорусский рубль';
          CurrentSpisokValut^.Element.Kod := 'BYN';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Венгерский форинт';
          CurrentSpisokValut^.Element.Kod := 'HUF';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Датская крона';
          CurrentSpisokValut^.Element.Kod := 'DKK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Динар';
          CurrentSpisokValut^.Element.Kod := 'MKD';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Дирхам ОАЭ';
          CurrentSpisokValut^.Element.Kod := 'AED';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Доллар США';
          CurrentSpisokValut^.Element.Kod := 'USD';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Евро';
          CurrentSpisokValut^.Element.Kod := 'EUR';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Египетский фунт';
          CurrentSpisokValut^.Element.Kod := 'EGP';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Израильский шекель';
          CurrentSpisokValut^.Element.Kod := 'ILS';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Индийская рупия';
          CurrentSpisokValut^.Element.Kod := 'INR';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Иракский динар';
          CurrentSpisokValut^.Element.Kod := 'IQD';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Иранский риал';
          CurrentSpisokValut^.Element.Kod := 'IRR';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Ирландский фунт';
          CurrentSpisokValut^.Element.Kod := 'IEP';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Исландская крона';
          CurrentSpisokValut^.Element.Kod := 'ISK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Испанская песета';
          CurrentSpisokValut^.Element.Kod := 'ESP';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Итальянская лира';
          CurrentSpisokValut^.Element.Kod := 'ITL';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Китайский юань';
          CurrentSpisokValut^.Element.Kod := 'CNY';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Латвийский лат';
          CurrentSpisokValut^.Element.Kod := 'LVL';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Литовский лит';
          CurrentSpisokValut^.Element.Kod := 'LTL';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Немецкая марка';
          CurrentSpisokValut^.Element.Kod := 'DEM';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Нидерландский гульден';
          CurrentSpisokValut^.Element.Kod := 'NLG';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Норвежская крона';
          CurrentSpisokValut^.Element.Kod := 'NOK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Польский злотый';
          CurrentSpisokValut^.Element.Kod := 'PLN';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Португальский эскудо';
          CurrentSpisokValut^.Element.Kod := 'PTE';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Российский рубль';
          CurrentSpisokValut^.Element.Kod := 'RUR';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Румынский лей';
          CurrentSpisokValut^.Element.Kod := 'RON';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Рупия';
          CurrentSpisokValut^.Element.Kod := 'IDR';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Турецкая лира';
          CurrentSpisokValut^.Element.Kod := 'TRL';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Украинская гривна';
          CurrentSpisokValut^.Element.Kod := 'UAH';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Финляндская марка';
          CurrentSpisokValut^.Element.Kod := 'FIM';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Французский франк';
          CurrentSpisokValut^.Element.Kod := 'FRF';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Чешская крона';
          CurrentSpisokValut^.Element.Kod := 'CZK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Чилийское песо';
          CurrentSpisokValut^.Element.Kod := 'CLP';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Шведская крона';
          CurrentSpisokValut^.Element.Kod := 'SEK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Швейцарский франк';
          CurrentSpisokValut^.Element.Kod := 'CHF';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Эстонская крона';
          CurrentSpisokValut^.Element.Kod := 'EEK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Эфиопский быр';
          CurrentSpisokValut^.Element.Kod := 'ETB';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Югославский динар';
          CurrentSpisokValut^.Element.Kod := 'YUM';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := 'Японская иена';
          CurrentSpisokValut^.Element.Kod := 'JPY';
          CurrentSpisokValut^.Next := nil;
        end;
      end;

      procedure TViFormMain.btnDontClick(Sender: TObject);
      begin
        PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        ViFormMain.Hide;
        Password.Show;
      end;

end.
