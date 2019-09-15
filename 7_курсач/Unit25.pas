unit Unit25;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,Grids,MMSystem;

type
  TchangenameZaemi = class(TForm)
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
  changenameZaemi: TchangenameZaemi;

implementation
uses Unit1, Unit4;
var kolvodo:Integer;
day1: TDateTime;
cat1,Val1:string[30];
summa1 : Integer;
{$R *.dfm}

procedure TChangeNameZaemi.FormShow(Sender: TObject);
var i,j,vs: Integer;

begin

  dtpData.Date := date;
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




   kolvodo := 0;
  CurrentUser := FirstUser;
  for i := 1 to (ind-1) do
    begin
      CurrentUser := CurrentUser^.Next;
      kolvodo := kolvodo + CurrentUser^.Element.KolvoZaemchikov;
    end;
  CurrentZaemi := FirstZaemi;
  for i:= 1 to (kolvodo+ArowZaemi) do
  begin
    CurrentZaemi:= CurrentZaemi^.Next;
  end;

  day1 := CurrentZaemi^.Element.Day;
  edtname.Text := '';
  edtName.SetFocus;
  cat1:= CurrentZaemi^.Element.name;
  cbbValuta.Text:= '';
  val1:=  CurrentZaemi^.Element.Valuta;
  edtMoney.Text:='';
  summa1 :=CurrentZaemi^.Element.Money;









end;

procedure TChangeNameZaemi.btnOkClick(Sender: TObject);
var n,str,stroka,strname: string;
bool: Boolean;
i, j, k,d,summa, cod,s,m,z,p: Integer;
myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod:Integer;
begin
  
  bool := True;
   if edtname.Text = '' then
   begin
     ShowMessage('Введите имя');
     edtname.SetFocus;
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

            CurrentZaemi := FirstZaemi;
              for i:= 1 to (kolvodo+ArowZaemi) do
              begin
                CurrentZaemi := CurrentZaemi^.Next;
              end;
            CurrentZaemi^.Element.Money := summa;
            CurrentZaemi^.Element.Valuta := cbbValuta.Items[cbbValuta.ItemIndex];
            CurrentZaemi^.Element.name := edtName.Text;
            CurrentZaemi^.Element.Day := dtpData.Date;


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
                                    with MainForm.tablZaemi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with MainForm.tablZaemi1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

             with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
                      with MainForm.tablZaemi do
                                begin
                                  Selection := myRect;
                                  Cells[0,0] := '  Дата';
                                  Cells[1,0] := '  Я должен';
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
                      kRashoddo := kRashoddo + CurrentUser^.Element.KolvoZaemchikov;
                      end;
                      Currentuser:=CurrentUser^.Next;
                      kValut:=CurrentUser^.Element.KolvoValut;
                      krashod:=CurrentUser^.Element.KolvoZaemchikov;

                      MainForm.tablZaemi.ColCount := kValut + 2;

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
                           MainForm.tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
                         end;
                         CurrentZaemi := FirstZaemi;
                         for i:= 1 to kRashoddo do
                         begin
                           CurrentZaemi := CurrentZaemi^.Next;
                         end;
                         m:=0;
                         s:=0;
                         for i:= 1 to kRashod do
                         begin

                           inc(s);
                           CurrentZaemi := CurrentZaemi^.Next;
                           MainForm.tablZaemi.Cells[m,s] := DateToStr(CurrentZaemi^.Element.Day);
                           MainForm.tablZaemi.Cells[m+1,s]:= CurrentZaemi^.Element.name;
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
                           if CurrentValuta^.Element.Name = CurrentZaemi^.Element.Valuta
                           then
                           begin
                             MainForm.tablZaemi.Cells[m+z+1,s] := IntToStr(CurrentZaemi^.Element.Money);
                           end
                           else
                           begin
                             MainForm.tablZaemi.Cells[m+z+1,s] := '0';
                           end;
                           end;
                           MainForm.tablZaemi.RowCount := 1+kRashod;
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
                           MainForm.tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
                         end;
                        MainForm.tablZaemi.RowCount := 2;
                      end;
                        MainForm.tablZaemi.DefaultColWidth := Round(960/mainform.tablZaemi.ColCount);
                        MainForm.tablZaemi1.ColCount := MainForm.tablZaemi.ColCount;
                        MainForm.tablZaemi1.DefaultColWidth := Round(960/mainform.TablZaemi.ColCount);
                        MainForm.tablZaemi1.RowCount := 1;
                        with MainForm.tablZaemi1 do
                                begin
                                  Selection := myRect;
                                  Cells[0,0] := '  Итого';
                                end;
                        if kRashod <> 0
                        then
                        begin
                        for i:= 1 to kValut do
                        begin
                          OZaemi := 0;
                          for z:=1 to kRashod do
                          begin
                             str := MainForm.tablZaemi.Cells[i+1,z];
                            OZaemi := OZaemi + StrToInt(str);

                          end;
                          MainForm.tablZaemi1.Cells[i+1,0]:=IntToStr(OZaemi);
                        end;
                        end;

            ChangeNameZaemi.Close;
          end;
end;


procedure TChangeNameZaemi.btnDontClick(Sender: TObject);
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  CurrentZaemi^.Element.Day := day1;
  CurrentZaemi^.Element.name := cat1;
  CurrentZaemi^.Element.Valuta := val1;
  CurrentZaemi^.Element.Money := summa1;
  ChangeNameZaemi.Close;
end;

end.
