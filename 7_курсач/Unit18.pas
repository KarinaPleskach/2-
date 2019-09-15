unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,MMSystem, ComCtrls, Grids;

type
  TNameRashod = class(TForm)
    cbbCategory: TComboBox;
    btnOk: TButton;
    btnDont: TButton;
    lbl4: TLabel;
    lbl5: TLabel;
    edtMoney: TEdit;
    spl1: TSplitter;
    dtpData: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbValuta: TComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure btnDontClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NameRashod: TNameRashod;
  myDate1,myDate2 : TDateTime;
myYear, myMonth, myDay : word;


implementation
uses Unit1,Unit4;
{$R *.dfm}
var now:TDateTime;

procedure TNameRashod.btnOkClick(Sender: TObject);
var  n,str,stroka: string;
bool:Boolean;
i,j, vs, thelast, k, d, summa, cod,m,s,z,p:Integer;
Q:AdrRashod;
myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod:Integer;
begin
 bool := True;
    stroka := cbbCategory.Items[cbbCategory.ItemIndex];
        if Length(stroka) = 0
          then
            begin
              ShowMessage('Выберите катеорию.');
               cbbCategory.SetFocus;
               bool := False;
               cbbCategory.Text :='';
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
              k := k + CurrentUser^.Element.KolvoRashodov;
            end;
            CurrentUser := CurrentUser^.Next;
            d := CurrentUser^.Element.KolvoRashodov;




      CurrentRashod := FirstRashod;
      for i := 1 to (k + d) do
        begin
          CurrentRashod := CurrentRashod^.Next;
        end;
      if CurrentRashod^.Next = nil
      then
      begin
      New(CurrentRashod^.next);
      CurrentRashod := CurrentRashod^.Next;
      CurrentRashod^.Element.Money := summa;
      CurrentRashod^.Element.User := GlobalName;
      CurrentRashod^.Element.Valuta := NameRashod.cbbValuta.Items[NameRashod.cbbValuta.ItemIndex];
      CurrentRashod^.Element.Category := cbbCategory.Items[cbbCategory.itemIndex];
      CurrentRashod^.Element.Day := dtpData.Date;
      CurrentRashod^.Next := nil;
      end
      else
      begin
      New(Q);
      Q^.Element.Money := summa;
      Q^.Element.User := GlobalName;
      Q^.Element.Valuta := NameRashod.cbbValuta.Items[NameRashod.cbbValuta.ItemIndex];
      Q^.Element.Category  := cbbCategory.Items[cbbCategory.itemIndex];
      Q^.Element.Day := dtpData.Date;
      Q^.Next := CurrentRashod^.Next;
      CurrentRashod^.Next := Q;
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

      CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoRashodov := CurrentUser^.Element.KolvoRashodov + 1;

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



          with MainForm.tablRashod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
            with MainForm.tablRashod1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

         with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
                      with MainForm.tablRashod do
                                begin
                                  Selection := myRect;
                                  Cells[0,0] := '  Дата';
                                  Cells[1,0] := '  Категория расхода';
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
                      kRashoddo := kRashoddo + CurrentUser^.Element.KolvoRashodov;
                      end;
                      Currentuser:=CurrentUser^.Next;
                      kValut:=CurrentUser^.Element.KolvoValut;
                      krashod:=CurrentUser^.Element.KolvoRashodov;

                      MainForm.tablRashod.ColCount := kValut + 2;

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
                           MainForm.tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
                         end;
                         CurrentRashod := FirstRashod;
                         for i:= 1 to kRashoddo do
                         begin
                           CurrentRashod := CurrentRashod^.Next;
                         end;
                         m:=0;
                         s:=0;
                         for i:= 1 to kRashod do
                         begin

                           inc(s);
                           CurrentRashod := CurrentRashod^.Next;
                           MainForm.tablRashod.Cells[m,s] := DateToStr(CurrentRashod^.Element.Day);
                           MainForm.tablRashod.Cells[m+1,s]:= CurrentRashod^.Element.Category;
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
                           if CurrentValuta^.Element.Name = CurrentRashod^.Element.Valuta
                           then
                           begin
                             MainForm.tablRashod.Cells[m+z+1,s] := IntToStr(CurrentRashod^.Element.Money);
                           end
                           else
                           begin
                             MainForm.tablRashod.Cells[m+z+1,s] := '0';
                           end;
                           end;
                           MainForm.tablRashod.RowCount := 1+kRashod;
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
                           MainForm.tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
                         end;
                        MainForm.tablRashod.RowCount := 2;
                      end;
                        MainForm.tablRashod.DefaultColWidth := Round(960/mainform.tablRashod.ColCount);
                        MainForm.tablRashod1.ColCount := MainForm.tablRashod.ColCount;
                        MainForm.tablRashod1.DefaultColWidth := Round(960/mainform.TablRashod.ColCount);
                        MainForm.tablRashod1.RowCount := 1;
                        with MainForm.tablRashod1 do
                                begin
                                  Selection := myRect;
                                  Cells[0,0] := '  Итого';
                                end;
                        if kRashod <> 0
                        then
                        begin
                        for i:= 1 to kValut do
                        begin
                          Orashod := 0;
                          for z:=1 to kRashod do
                          begin
                             str := MainForm.tablRashod.Cells[i+1,z];
                            ORashod := ORashod + StrToInt(str);

                          end;
                          MainForm.tablRashod1.Cells[i+1,0]:=IntToStr(Orashod);
                        end;
                        end;
           NameRashod.Close;
      end


end;

procedure TNameRashod.btnDontClick(Sender: TObject);
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  NameRashod.close;


  //myDate1:=dtpData.Date;
 // mydate2:=StrToDate('29.12.2000');
  //if myDate1>myDate2
  //then
  //ShowMessage('bol');

  //DecodeDate(myDate, myYear, myMonth, myDay);
  //ShowMessage('myDate  сейчас = '+DateToStr(myDate));
  //ShowMessage('myDay      = '+IntToStr(myDay));
  //ShowMessage('myMonth    = '+IntToStr(myMonth));
  //ShowMessage('myYear     = '+IntToStr(myYear));

end;

procedure TNameRashod.FormShow(Sender: TObject);
var i, j, vs:Integer;
begin
  dtpData.Date := date;
 edtMoney.Text := '';
 cbbCategory.Text := '';
 cbbCategory.Items.Clear;
 j:=0;
 vs:=0;
 CurrentUser:=FirstUser;
 for i := 1 to (ind-1) do
 begin
   CurrentUser := CurrentUser^.Next;
   j:= j + CurrentUser^.Element.KolvoCategoryRashodov;
 end;
 CurrentUser := CurrentUser^.Next;
 vs := CurrentUser^.Element.KolvoCategoryRashodov;
 CurrentCategoryRachodov := FirstCategoryRachodov;
 for i:= 1 to j do
 begin
   CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
 end;
 for i :=1 to vs do
 begin
   CurrentCategoryRachodov := CurrentCategoryRachodov^.Next;
   cbbCategory.Items.Add(CurrentCategoryRachodov^.Element.Name);
 end;
 cbbCategory.SetFocus;
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

end.
