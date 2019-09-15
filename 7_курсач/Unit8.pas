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
        PlaySound('D:\�����\����\����\4_����������� ���\button.wav', 0, SND_ASYNC);
        CurrentUser := FirstUser;
        repeat
          CurrentUser := CurrentUser^.Next;
        until CurrentUser^.Element.Name = Password.cbVibor.Items[Password.cbVibor.ItemIndex];

        if edtPassword.Text <> CurrentUser^.Element.Password
        then
        begin
          ShowMessage('�������� ������.');
          edtPassword.Text := '';
          edtPassword.SetFocus;
          inc(k);
          if k > 2
          then
            ShowMessage('���� ������ �� ������� ������, ����� �� �����.');
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
          CurrentSpisokValut^.Element.Name := '����������� �������';
          CurrentSpisokValut^.Element.Kod := 'ATS';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '��������������� �����';
          CurrentSpisokValut^.Element.Kod := 'AZN';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '��������� �����';
          CurrentSpisokValut^.Element.Kod := 'DZD';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '���������� ���� ����������';
          CurrentSpisokValut^.Element.Kod := 'GBP';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '����������� �����';
          CurrentSpisokValut^.Element.Kod := 'BYN';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '���������� ������';
          CurrentSpisokValut^.Element.Kod := 'HUF';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '������� �����';
          CurrentSpisokValut^.Element.Kod := 'DKK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '�����';
          CurrentSpisokValut^.Element.Kod := 'MKD';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '������ ���';
          CurrentSpisokValut^.Element.Kod := 'AED';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '������ ���';
          CurrentSpisokValut^.Element.Kod := 'USD';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '����';
          CurrentSpisokValut^.Element.Kod := 'EUR';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '���������� ����';
          CurrentSpisokValut^.Element.Kod := 'EGP';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '����������� ������';
          CurrentSpisokValut^.Element.Kod := 'ILS';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '��������� �����';
          CurrentSpisokValut^.Element.Kod := 'INR';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '�������� �����';
          CurrentSpisokValut^.Element.Kod := 'IQD';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '�������� ����';
          CurrentSpisokValut^.Element.Kod := 'IRR';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '���������� ����';
          CurrentSpisokValut^.Element.Kod := 'IEP';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '���������� �����';
          CurrentSpisokValut^.Element.Kod := 'ISK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '��������� ������';
          CurrentSpisokValut^.Element.Kod := 'ESP';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '����������� ����';
          CurrentSpisokValut^.Element.Kod := 'ITL';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '��������� ����';
          CurrentSpisokValut^.Element.Kod := 'CNY';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '���������� ���';
          CurrentSpisokValut^.Element.Kod := 'LVL';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '��������� ���';
          CurrentSpisokValut^.Element.Kod := 'LTL';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '�������� �����';
          CurrentSpisokValut^.Element.Kod := 'DEM';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '������������� �������';
          CurrentSpisokValut^.Element.Kod := 'NLG';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '���������� �����';
          CurrentSpisokValut^.Element.Kod := 'NOK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '�������� ������';
          CurrentSpisokValut^.Element.Kod := 'PLN';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '������������� ������';
          CurrentSpisokValut^.Element.Kod := 'PTE';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '���������� �����';
          CurrentSpisokValut^.Element.Kod := 'RUR';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '��������� ���';
          CurrentSpisokValut^.Element.Kod := 'RON';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '�����';
          CurrentSpisokValut^.Element.Kod := 'IDR';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '�������� ����';
          CurrentSpisokValut^.Element.Kod := 'TRL';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '���������� ������';
          CurrentSpisokValut^.Element.Kod := 'UAH';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '����������� �����';
          CurrentSpisokValut^.Element.Kod := 'FIM';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '����������� �����';
          CurrentSpisokValut^.Element.Kod := 'FRF';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '������� �����';
          CurrentSpisokValut^.Element.Kod := 'CZK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '��������� ����';
          CurrentSpisokValut^.Element.Kod := 'CLP';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '�������� �����';
          CurrentSpisokValut^.Element.Kod := 'SEK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '����������� �����';
          CurrentSpisokValut^.Element.Kod := 'CHF';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '��������� �����';
          CurrentSpisokValut^.Element.Kod := 'EEK';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '��������� ���';
          CurrentSpisokValut^.Element.Kod := 'ETB';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '����������� �����';
          CurrentSpisokValut^.Element.Kod := 'YUM';
          CurrentSpisokValut^.Next := nil;
          New(CurrentSpisokValut^.Next);
          CurrentSpisokValut := CurrentSpisokValut^.Next;
          CurrentSpisokValut^.Element.Name := '�������� ����';
          CurrentSpisokValut^.Element.Kod := 'JPY';
          CurrentSpisokValut^.Next := nil;
        end;
      end;

      procedure TViFormMain.btnDontClick(Sender: TObject);
      begin
        PlaySound('D:\�����\����\����\4_����������� ���\button.wav', 0, SND_ASYNC);
        ViFormMain.Hide;
        Password.Show;
      end;

end.
