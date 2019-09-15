unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,Grids,MMSystem;

type
  TNameDolgi = class(TForm)
    lbl4: TLabel;
    lbl5: TLabel;
    spl1: TSplitter;
    lbl1: TLabel;
    lbl2: TLabel;
    btnOk: TButton;
    btnDont: TButton;
    edtMoney: TEdit;
    dtpData: TDateTimePicker;
    cbbValuta: TComboBox;
    edtName: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnDontClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NameDolgi: TNameDolgi;
 myDate1,myDate2 : TDateTime;
myYear, myMonth, myDay : word;


implementation
uses Unit1,Unit4, Unit18;
{$R *.dfm}
var now:TDateTime;

procedure TNameDolgi.btnOkClick(Sender: TObject);
var  n,str,stroka,strname: string;
bool:Boolean;
i,j, vs, thelast, k, d, summa, cod,m,s,z,p:Integer;
Q:AdrDolgi;
myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod:Integer;
begin

 bool := True;
   if edtName.Text = '' then
   begin
     ShowMessage('Введите имя.');
     edtName.SetFocus;
     bool := False;
   end;

    if bool
        then
        begin
          if Length(edtName.Text) > 30
            then
              begin
                strname := edtName.Text;
                ShowMessage('Слишком длинное имя.');
                Delete(strname, 30, Length(strname));
                edtName.Text := n;
                edtName.SetFocus;
                bool := False;
              end;
        end;

    if bool
   then
   begin
     stroka := cbbValuta.Items[cbbValuta.ItemIndex];
        if Length(stroka) = 0
          then
            begin
              ShowMessage('Выберите валюту.');
               cbbValuta.SetFocus;
               bool := False;
               cbbValuta.Text := '';
            end ;

   end;

        if bool
        then
        begin
        n := edtMoney.Text;
        while Pos(' ', n)<>0 do
          Delete (n, Pos(' ', n), 1);
        if Length(n) = 0
          then
            begin
              bool := False;
              ShowMessage('Введите сумму.');
              edtMoney.SetFocus;
              edtmoney.Text := '';
            end;
        end;

        if bool
        then
        begin
          Val(n,summa,cod);
          if cod <> 0
            then
              begin
                ShowMessage('Некорректно введена сумма.');
                edtMoney.Text := '';
                edtMoney.SetFocus;
                bool := False;
              end;
        end;

        if bool
        then
        begin

          if summa <1
            then
              begin
                ShowMessage('Некорректно введена сумма.');
                edtMoney.Text := '';
                edtMoney.SetFocus;
                bool := False;
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
              k := k + CurrentUser^.Element.KolvoDolgnikov;
            end;
            CurrentUser := CurrentUser^.Next;
            d := CurrentUser^.Element.KolvoDolgnikov;




      CurrentDolgi := FirstDolgi;
      for i := 1 to (k + d) do
        begin
          CurrentDolgi := CurrentDolgi^.Next;
        end;
      if CurrentDolgi^.Next = nil
      then
      begin
      New(CurrentDolgi^.next);
      CurrentDolgi := CurrentDolgi^.Next;
      CurrentDolgi^.Element.Money := summa;
      CurrentDolgi^.Element.User := GlobalName;
      CurrentDolgi^.Element.Valuta := NameDolgi.cbbValuta.Items[NameDolgi.cbbValuta.ItemIndex];
      CurrentDolgi^.Element.name := edtName.text;
      CurrentDolgi^.Element.Day := dtpData.Date;
      CurrentDolgi^.Next := nil;
      end
      else
      begin
      New(Q);
      Q^.Element.Money := summa;
      Q^.Element.User := GlobalName;
      Q^.Element.Valuta := NameRashod.cbbValuta.Items[NameRashod.cbbValuta.ItemIndex];
      Q^.Element.name  := edtName.text;
      Q^.Element.Day := dtpData.Date;
      Q^.Next := CurrentDolgi^.Next;
      CurrentDolgi^.Next := Q;
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

      CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoDolgnikov := CurrentUser^.Element.KolvoDolgnikov + 1;

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

           with MainForm.tablDolgi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with MainForm.tablDolgi1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;



         with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
                      with MainForm.tablDolgi do
                                begin
                                  Selection := myRect;
                                  Cells[0,0] := '  Дата';
                                  Cells[1,0] := '  Мне должны';
                                end;
                      kValutdo := 0;
                      kValut := 0;
                      kRashoddo := 0;
                      kRashod := 0;
                      currentUser := FirstUser;
                      for i:=1 to (ind-1) do
                      begin
                      CurrentUser := CurrentUser^.Next;
                      kValutdo := kValutdo + CurrentUser^.Element.KolvoValut;
                      kRashoddo := kRashoddo + CurrentUser^.Element.KolvoDolgnikov;
                      end;
                      Currentuser:=CurrentUser^.Next;
                      kValut:=CurrentUser^.Element.KolvoValut;
                      krashod:=CurrentUser^.Element.KolvoDolgnikov;

                      MainForm.tablDolgi.ColCount := kValut + 2;

                      if kRashod <> 0
                      then
                      begin
                         CurrentValuta:=FirstValuta;
                         for i:= 1 to kValutdo do
                         begin
                           CurrentValuta:=CurrentValuta^.Next;
                         end;
                         m := 1;
                         for i:= 1 to kValut do
                         begin
                           inc(m);
                           CurrentValuta := CurrentValuta^.Next;
                           MainForm.tablDolgi.Cells[m,0] := CurrentValuta^.Element.Name;
                         end;
                         CurrentDolgi := FirstDolgi;
                         for i:= 1 to kRashoddo do
                         begin
                           CurrentDolgi := CurrentDolgi^.Next;
                         end;
                         m:=0;
                         s:=0;
                         for i:= 1 to kRashod do
                         begin

                           inc(s);
                           CurrentDolgi := CurrentDolgi^.Next;
                           MainForm.tablDolgi.Cells[m,s] := DateToStr(CurrentDolgi^.Element.Day);
                           MainForm.tablDolgi.Cells[m+1,s]:= CurrentDolgi^.Element.name;
                           for z:=1 to kValut do
                           begin
                             CurrentValuta:=FirstValuta;
                                           for p:= 1 to kValutdo do
                                           begin
                                             CurrentValuta:=CurrentValuta^.Next;
                                           end;
                                           for p := 1 to z do
                                           begin
                                             CurrentValuta := CurrentValuta^.Next;
                                           end;
                           if CurrentValuta^.Element.Name = CurrentDolgi^.Element.Valuta
                           then
                           begin
                             MainForm.tablDolgi.Cells[m+z+1,s] := IntToStr(CurrentDolgi^.Element.Money);
                           end
                           else
                           begin
                             MainForm.tablDolgi.Cells[m+z+1,s] := '0';
                           end;
                           end;
                           MainForm.tablDolgi.RowCount := 1+kRashod;
                         end;
                      end
                      else
                      begin
                        CurrentValuta:=FirstValuta;
                         for i:= 1 to kValutdo do
                         begin
                           CurrentValuta:=CurrentValuta^.Next;
                         end;
                         m := 1;
                         for i:= 1 to kValut do
                         begin
                           inc(m);
                           CurrentValuta := CurrentValuta^.Next;
                           MainForm.tablDolgi.Cells[m,0] := CurrentValuta^.Element.Name;
                         end;
                        MainForm.tablDolgi.RowCount := 2;
                      end;
                        MainForm.tablDolgi.DefaultColWidth := Round(960/mainform.tablDolgi.ColCount);
                        MainForm.tablDolgi1.ColCount := MainForm.tablDolgi.ColCount;
                        MainForm.tablDolgi1.DefaultColWidth := Round(960/mainform.TablDolgi.ColCount);
                        MainForm.tablDolgi1.RowCount := 1;
                        with MainForm.tablDolgi1 do
                                begin
                                  Selection := myRect;
                                  Cells[0,0] := '  Итого';
                                end;
                        if kRashod <> 0
                        then
                        begin
                        for i:= 1 to kValut do
                        begin
                          ODolgi := 0;
                          for z:=1 to kRashod do
                          begin
                             str := MainForm.tablDolgi.Cells[i+1,z];
                            ODolgi := ODolgi+ StrToInt(str);

                          end;
                          MainForm.tablDolgi1.Cells[i+1,0]:=IntToStr(ODolgi);
                        end;
                        end;
           NameDolgi.Close;
      end


end;

procedure TNameDolgi.FormShow(Sender: TObject);
var i, j, vs:Integer;
begin
  dtpData.Date := date;
 edtMoney.Text := '';
 edtName.Text := '';
 edtName.SetFocus;
 cbbValuta.Text := '';
 cbbValuta.Items.Clear;
 j:=0;
 vs:=0;
 CurrentUser:=FirstUser;
 for i := 1 to (ind-1) do
 begin
   CurrentUser := CurrentUser^.Next;
   j:= j + CurrentUser^.Element.KolvoValut;
 end;
 CurrentUser := CurrentUser^.Next;
 vs := CurrentUser^.Element.KolvoValut;
 CurrentValuta := FirstValuta;
 for i:= 1 to j do
 begin
   CurrentValuta := CurrentValuta^.Next;
 end;
 for i :=1 to vs do
 begin
   CurrentValuta := CurrentValuta^.Next;
   cbbValuta.Items.Add(CurrentValuta^.Element.Name);
 end;
 
end;

procedure TNameDolgi.btnDontClick(Sender: TObject);
begin
   PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  NameDolgi.close;
end;

end.
