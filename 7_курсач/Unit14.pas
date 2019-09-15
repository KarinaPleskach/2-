unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,MMSystem;

type
  TAddRashod = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    spl1: TSplitter;
    btnOk: TButton;
    btnDont: TButton;
    procedure btnDontClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddRashod: TAddRashod;

implementation
Uses Unit1,Unit4,Unit12;
{$R *.dfm}

procedure TAddRashod.btnDontClick(Sender: TObject);
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  AddRashod.Hide;
  nastroikaCategory.Show;
end;

procedure TAddRashod.FormShow(Sender: TObject);
begin
edtName.Text := '';
edtName.SetFocus;
end;

procedure TAddRashod.btnOkClick(Sender: TObject);
var  n: string;
bool:Boolean;
i,j, vs, thelast, k, d:Integer;
Q:AdrCategoryRachodov;
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
              k := k + CurrentUser^.Element.KolvoCategoryRashodov;
            end;
            CurrentUser := CurrentUser^.Next;
            d := CurrentUser^.Element.KolvoCategoryRashodov;




      CurrentCategoryRachodov := FirstCategoryRachodov;
      for i := 1 to (k + d) do
        begin
          CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
        end;
      if CurrentCategoryRachodov^.Next = nil
      then
      begin
      New(CurrentCategoryRachodov^.next);
      CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
      CurrentCategoryRachodov^.Element.Name := edtName.Text;
      CurrentCategoryRachodov^.Element.User := GlobalName;
      CurrentCategoryRachodov^.Next := nil;
      end
      else
      begin
      New(Q);
      Q^.Element.Name := edtName.Text;
      Q^.Element.User := GlobalName;
      Q^.Next := CurrentCategoryRachodov^.Next;
      CurrentCategoryRachodov^.Next := Q;
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
            CloseFile(FileWithCategoryRachodov) ;

      CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoCategoryRashodov := CurrentUser^.Element.KolvoCategoryRashodov + 1;

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
           AddRashod.Hide;
           nastroikaCategory.Show;
      end


end;

end.
