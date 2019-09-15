unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MMSystem, StdCtrls, ExtCtrls;

type
  TAddValut = class(TForm)
    lbl1: TLabel;
    cbbAddValut: TComboBox;
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
  AddValut: TAddValut;

implementation

uses Unit1, Unit4, Unit9;

{$R *.dfm}



procedure TAddValut.btnDontClick(Sender: TObject);
begin
 PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
 AddValut.Hide;
 NastroikaValut.Show;
end;

procedure TAddValut.btnOkClick(Sender: TObject);
var
bool:Boolean;
i,j, vs, thelast:Integer;
Q:AdrValuta;
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  currentUser := FirstUser;
  for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
  vs := CurrentUser^.Element.KolvoValut;
  bool := True;
  if vs <> 0
    then
      BEGIN

        j := 0;

        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoValut;
          end;

        CurrentValuta := FirstValuta;
        for i := 1 to j do
          begin
            CurrentValuta := CurrentValuta^.Next;
          end;
        for I := 1 to vs do
          begin

            CurrentValuta := CurrentValuta^.Next;
            if CurrentValuta^.Element.Name = AddValut.cbbAddValut.Items[AddValut.cbbAddValut.ItemIndex]
            then bool := False;
          end;
        if Length(AddValut.cbbAddValut.Items[AddValut.cbbAddValut.ItemIndex])=0
        then
        bool := False;
      end
    else
    bool := True;

    if bool
    then
      begin
      j := 0;

        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoValut;
          end;




      CurrentValuta := FirstValuta;
      for i := 1 to (j + vs) do
        begin
          CurrentValuta := CurrentValuta^.Next;
        end;
      if CurrentValuta^.Next = nil
      then
      begin
      New(CurrentValuta^.next);
      CurrentValuta := CurrentValuta^.Next;
      CurrentValuta^.Element.Name := AddValut.cbbAddValut.Items[AddValut.cbbAddValut.ItemIndex];
      CurrentValuta^.Element.User := GlobalName;
      CurrentValuta^.Next := nil;
      end
      else
      begin
      New(Q);
      Q^.Element.Name := AddValut.cbbAddValut.Items[AddValut.cbbAddValut.ItemIndex];
      Q^.Element.User := GlobalName;
      Q^.Next := CurrentValuta^.Next;
      CurrentValuta^.Next := Q;
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
            CloseFile(FileWithValuta) ;

      CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoValut := CurrentUser^.Element.KolvoValut + 1;

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
           AddValut.Hide;
           NastroikaValut.Show;
      end
    else
    begin
      if AddValut.cbbAddValut.Items[AddValut.cbbAddValut.ItemIndex]=''
        then
        begin
        ShowMessage('Выберите валюту.');
        AddValut.cbbAddValut.Text := '';
        end
        else
        begin
          ShowMessage('Зачем вам две одинаковые валюты?');
         AddValut.cbbAddValut.Text := '';

        end;
    end;


end;

procedure TAddValut.FormShow(Sender: TObject);
var i: Integer;
begin
  cbbAddValut.Text := '';
CurrentSpisokValut := FirstSpisokValut;
for i := 1 to 43 do
  begin
    CurrentSpisokValut := CurrentSpisokValut^.Next;
    cbbAddValut.Items.Add(CurrentSpisokValut^.Element.Name);
  end;
end;

end.
