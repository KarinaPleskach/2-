unit Unit20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,MMSystem, ComCtrls, StdCtrls, ExtCtrls,Grids;

type
  TNameDohod = class(TForm)
    lbl4: TLabel;
    lbl5: TLabel;
    spl1: TSplitter;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbCategory: TComboBox;
    btnOk: TButton;
    btnDont: TButton;
    edtMoney: TEdit;
    dtpData: TDateTimePicker;
    cbbValuta: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnDontClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NameDohod: TNamedohod;
  myDate1,myDate2 : TDateTime;
myYear, myMonth, myDay : word;


implementation
uses Unit1,Unit4;

var now:TDateTime;
{$R *.dfm}

procedure TNameDohod.FormShow(Sender: TObject);
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
   j:= j + CurrentUser^.Element.KolvoCategoryDohodov;
 end;
 CurrentUser := CurrentUser^.Next;
 vs := CurrentUser^.Element.KolvoCategoryDohodov;
 CurrentCategoryDohodov := FirstCategoryDohodov;
 for i:= 1 to j do
 begin
   CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
 end;
 for i :=1 to vs do
 begin
   CurrentCategoryDohodov := CurrentCategoryDohodov^.Next;
   cbbCategory.Items.Add(CurrentCategoryDohodov^.Element.Name);
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
procedure TNameDohod.btnDontClick(Sender: TObject);
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  NameDohod.close;


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

procedure TNameDohod.btnOkClick(Sender: TObject);
var  n,str,stroka: string;
bool:Boolean;
i,j, vs, thelast, k, d, summa, cod,m,s,z,p:Integer;
Q:AdrDohod;
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
              k := k + CurrentUser^.Element.KolvoDohodov;
            end;
            CurrentUser := CurrentUser^.Next;
            d := CurrentUser^.Element.KolvoDohodov;




      CurrentDohod := FirstDohod;
      for i := 1 to (k + d) do
        begin
          CurrentDohod := CurrentDohod^.Next;
        end;
      if CurrentDohod^.Next = nil
      then
      begin
      New(CurrentDohod^.next);
      CurrentDohod := CurrentDohod^.Next;
      CurrentDohod^.Element.Money := summa;
      CurrentDohod^.Element.User := GlobalName;
      CurrentDohod^.Element.Valuta := NameDohod.cbbValuta.Items[NameDohod.cbbValuta.ItemIndex];
      CurrentDohod^.Element.Category := cbbCategory.Items[cbbCategory.itemIndex];
      CurrentDohod^.Element.Day := dtpData.Date;
      CurrentDohod^.Next := nil;
      end
      else
      begin
      New(Q);
      Q^.Element.Money := summa;
      Q^.Element.User := GlobalName;
      Q^.Element.Valuta := NameDohod.cbbValuta.Items[NameDohod.cbbValuta.ItemIndex];
      Q^.Element.Category  := cbbCategory.Items[cbbCategory.itemIndex];
      Q^.Element.Day := dtpData.Date;
      Q^.Next := CurrentDohod^.Next;
      CurrentDohod^.Next := Q;
      end;
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

      CurrentUser := FirstUser;
      for i:= 1 to ind do
        begin
          CurrentUser := CurrentUser^.Next;

        end;
        CurrentUser^.Element.KolvoDohodov := CurrentUser^.Element.KolvoDohodov + 1;

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


          with MainForm.tablDohod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
                      with MainForm.tablDohod1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

         with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
                      with MainForm.tablDohod do
                                begin
                                  Selection := myRect;
                                  Cells[0,0] := '  Дата';
                                  Cells[1,0] := '  Категория дохода';
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
                      kRashoddo := kRashoddo + CurrentUser^.Element.KolvoDohodov;
                      end;
                      Currentuser:=CurrentUser^.Next;
                      kValut:=CurrentUser^.Element.KolvoValut;
                      krashod:=CurrentUser^.Element.KolvoDohodov;

                      MainForm.tablDohod.ColCount := kValut + 2;

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
                           MainForm.tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
                         end;
                         CurrentDohod := FirstDohod;
                         for i:= 1 to kRashoddo do
                         begin
                           CurrentDohod := CurrentDohod^.Next;
                         end;
                         m:=0;
                         s:=0;
                         for i:= 1 to kRashod do
                         begin

                           inc(s);
                           CurrentDohod := CurrentDohod^.Next;
                           MainForm.tablDohod.Cells[m,s] := DateToStr(CurrentDohod^.Element.Day);
                           MainForm.tablDohod.Cells[m+1,s]:= CurrentDohod^.Element.Category;
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
                           if CurrentValuta^.Element.Name = CurrentDohod^.Element.Valuta
                           then
                           begin
                             MainForm.tablDohod.Cells[m+z+1,s] := IntToStr(CurrentDohod^.Element.Money);
                           end
                           else
                           begin
                             MainForm.tablDohod.Cells[m+z+1,s] := '0';
                           end;
                           end;
                           MainForm.tablDohod.RowCount := 1+kRashod;
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
                           MainForm.tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
                         end;
                        MainForm.tablDohod.RowCount := 2;
                      end;
                        MainForm.tablDohod.DefaultColWidth := Round(960/mainform.tablDohod.ColCount);
                        MainForm.tablDohod1.ColCount := MainForm.tablDohod.ColCount;
                        MainForm.tablDohod1.DefaultColWidth := Round(960/mainform.TablDohod.ColCount);
                        MainForm.tablDohod1.RowCount := 1;
                        with MainForm.tablDohod1 do
                                begin
                                  Selection := myRect;
                                  Cells[0,0] := '  Итого';
                                end;
                        if kRashod <> 0
                        then
                        begin
                        for i:= 1 to kValut do
                        begin
                          ODohod := 0;
                          for z:=1 to kRashod do
                          begin
                             str := MainForm.tablDohod.Cells[i+1,z];
                            ODohod := ODohod + StrToInt(str);

                          end;
                          MainForm.tablDohod1.Cells[i+1,0]:=IntToStr(ODohod);
                        end;
                        end;
           NameDohod.Close;
      end


end;

end.
