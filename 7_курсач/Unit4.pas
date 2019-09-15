    unit Unit4;

    interface

    uses
      Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, MMSystem, StdCtrls, Buttons, ExtCtrls, Grids, ComCtrls;

    type
      TMainForm = class(TForm)
    spl1: TSplitter;
    pnlUp: TPanel;
    btnNames: TBitBtn;
    btnCategory: TBitBtn;
    btnValut: TBitBtn;
    btnOtchet: TBitBtn;
    btnCalculate: TBitBtn;
    btnExit: TBitBtn;
    spl2: TSplitter;
    spl3: TSplitter;
    spl4: TSplitter;
    pnlUp1: TPanel;
    spl5: TSplitter;
    btnMain: TButton;
    btnRashod: TButton;
    btnDohod: TButton;
    btnZaem: TButton;
    btnDolg: TButton;
    tablVibor: TStringGrid;
    spl6: TSplitter;
    tablRashod: TStringGrid;
    pnlRashod: TPanel;
    tablRashod1: TStringGrid;
    spl7: TSplitter;
    btnAdd: TButton;
    btnChange: TButton;
    btnDelete: TButton;
    lbl1: TLabel;
    dtpSRashod: TDateTimePicker;
    dtpPoRashod: TDateTimePicker;
    btnDavai: TButton;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    tablDohod: TStringGrid;
    tablDohod1: TStringGrid;
    pnlDohod: TPanel;
    spl8: TSplitter;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    btnAddDohod: TButton;
    btnChangeDohod: TButton;
    btnDeleteDohod: TButton;
    dtpsDohod: TDateTimePicker;
    dtppoDohod: TDateTimePicker;
    btnDavaiDohod: TButton;
    tablDolgi: TStringGrid;
    tablDolgi1: TStringGrid;
    pnlDolgi: TPanel;
    spl9: TSplitter;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    btnAddDolgi: TButton;
    btnChangeDolgi: TButton;
    btnDeleteDolgi: TButton;
    dtpsDolgi: TDateTimePicker;
    dtppoDolgi: TDateTimePicker;
    btnDavaiDolgi: TButton;
    tablZaemi: TStringGrid;
    tablZaemi1: TStringGrid;
    pnlZaemi: TPanel;
    spl10: TSplitter;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    btnAddZaemi: TButton;
    btnChangeZaemi: TButton;
    btnDeleteZaemi: TButton;
    dtpsZaemi: TDateTimePicker;
    dtppoZaemi: TDateTimePicker;
    btnDavaiZaemi: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure btnNamesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMainClick(Sender: TObject);
    procedure btnValutClick(Sender: TObject);
    procedure btnCategoryClick(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
    procedure btnRashodClick(Sender: TObject);
    procedure btnDohodClick(Sender: TObject);
    procedure btnZaemClick(Sender: TObject);
    procedure btnDolgClick(Sender: TObject);
    procedure tablRashodMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDavaiClick(Sender: TObject);
    procedure tablDohodMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDeleteDohodClick(Sender: TObject);
    procedure btnDavaiDohodClick(Sender: TObject);
    procedure btnAddDohodClick(Sender: TObject);
    procedure btnChangeDohodClick(Sender: TObject);
    procedure tablDolgiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDeleteDolgiClick(Sender: TObject);
    procedure btnDavaiDolgiClick(Sender: TObject);
    procedure btnAddDolgiClick(Sender: TObject);
    procedure btnChangeDolgiClick(Sender: TObject);
    procedure tablZaemiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAddZaemiClick(Sender: TObject);
    procedure btnChangeZaemiClick(Sender: TObject);
    procedure btnDeleteZaemiClick(Sender: TObject);
    procedure btnDavaiZaemiClick(Sender: TObject);
    procedure btnOtchetClick(Sender: TObject);
    

      private
        { Private declarations }
      public
        { Public declarations }
      end;

    var
      MainForm: TMainForm;
    var ind, ORashod, ODohod,Odolgi,ozaemi, vs: Integer;
    GlobalName: string;

    type
      Category_Dohodov = record
        Name: string[30];
        User: string[30];
        end;

      AdrCategoryDohodov = ^TCategoryDohodov;
      TCategoryDohodov = record
        Element: Category_Dohodov;
        Next: AdrCategoryDohodov;
      end;

    var
     FileWithCategoryDohodov: file of Category_Dohodov;

     FirstCategoryDohodov, CurrentCategoryDohodov: AdrCategoryDohodov;
     DataCategoryDohodov: Category_Dohodov;

     type
      Category_Rachodov = record
        Name: string[30];
        User: string[30];
        end;

      AdrCategoryRachodov = ^TCategoryRachodov;
      TCategoryRachodov = record
        Element: Category_Rachodov;
        Next: AdrCategoryRachodov;
      end;

    var
     FileWithCategoryRachodov: file of Category_Rachodov;

     FirstCategoryRachodov, CurrentCategoryRachodov: AdrCategoryRachodov;
     DataCategoryRachodov: Category_Rachodov;

    type
      Valuta = record
        Name: string[30];
        User: string[30];
        end;

      AdrValuta = ^TValuta;
      TValuta = record
        Element: Valuta;
        Next: AdrValuta;
      end;

    var
     FileWithValuta: file of Valuta;

     FirstValuta, CurrentValuta: AdrValuta;
     DataValuta: Valuta;

     type
      Rashod = record
        Money: integer;
        Valuta: string[30];
        Day: TDateTime;
        Category: string[30];
        User: string[30];
        end;

      AdrRashod = ^TRashod;
      TRashod = record
        Element: Rashod;
        Next: AdrRashod;
      end;

    var
     FileWithRashod: file of Rashod;

     FirstRashod, CurrentRashod: AdrRashod;
     DataRashod: Rashod;

     type
      Dohod = record
        Money: integer;
        Valuta: string[30];
        Day: TDateTime;
        Category: string[30];
        User: string[30];
        end;

      AdrDohod = ^TDohod;
      TDohod = record
        Element: Dohod;
        Next: AdrDohod;
      end;

    var
     FileWithDohod: file of Dohod;

     FirstDohod, CurrentDohod: AdrDohod;
     DataDohod: Dohod;


     type
      Dolgi = record
        Name: string[30];
        Money: integer;
        Valuta: string[30];
        Day: TDateTime;
        User: string[30];
        end;

      AdrDolgi = ^TDolgi;
      TDolgi = record
        Element: Dolgi;
        Next: AdrDolgi;
      end;

    var
     FileWithDolgi: file of Dolgi;

     FirstDolgi, CurrentDolgi: AdrDolgi;
     DataDolgi: Dolgi;

     type
      Zaemi = record
        Name: string[30];
        Money: integer;
        Valuta: string[30];
        Day: TDateTime;
        User: string[30];
        end;

      AdrZaemi = ^TZaemi;
      TZaemi = record
        Element: Zaemi;
        Next: AdrZaemi;
      end;

    var
     FileWithZaemi: file of Zaemi;

     FirstZaemi, CurrentZaemi: AdrZaemi;
     DataZaemi: Zaemi;


     type
       SpisokValut = record
       Name: string[30];
       Kod: string[30];
       end;

       AdrSpisokValut = ^TSpisokValut;
       TSpisokValut = record
        Element: SpisokValut;
        Next: AdrSpisokValut;
        end;
      var
        FirstSpisokValut, CurrentSpisokValut: AdrSpisokValut;
      AcolRashod,ArowRashod, AcolDohod,ArowDohod, AcolDolgi,ArowDolgi, AcolZaemi,Arowzaemi:Integer;

     type
       SpisokNameDolgi = record
       Name: string [30];
       end;
       AdrSpisokNameDolgi = ^TSpisokNameDolgi;
       TSpisokNameDolgi = record
        element: SpisokNameDolgi;
        next: AdrSpisokNameDolgi;
        end;
        var FirstSpisokNameDolgi, CurrentSpisokNameDolgi : AdrSpisokNameDolgi;


        type
       SpisokNameZaemi = record
       Name: string [30];
       end;

       AdrSpisokNameZaemi = ^TSpisokNameZaemi;
       TSpisokNamezaemi = record
        Element: SpisokNameZaemi;
        next: AdrSpisokNameZaemi;
        end;
        var FirstSpisokNameZaemi, CurrentSpisokNameZaemi : AdrSpisokNameDolgi;

    implementation

    uses Unit1, Unit9, Unit2, Unit3, Unit5, Unit6, Unit7, Unit8, Unit10, Unit11,Unit12,Unit13,Unit14,Unit15, Unit16, Unit17,
  Unit18,Unit19, Unit20, Unit21, Unit22, Unit23, Unit24, Unit25, Unit26;

    {$R *.dfm}

procedure TMainForm.btnExitClick(Sender: TObject);
var i: Integer;
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



procedure TMainForm.btnNamesClick(Sender: TObject);
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  Password.Show;
  MainForm.Hide;
end;

procedure TMainForm.FormShow(Sender: TObject);
var i, j, m, vs, k, l, a, r, d, b, z, x: Integer;
var dolgiposle,dolgido,zaemiposle,zaemido:Integer;
var myRect: TGridRect;
begin
  with tablvibor do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  GlobalName:=Password.cbVibor.Items[Password.cbVibor.ItemIndex];
  ORashod := 0;
  ODohod := 0;
ind := Password.cbVibor.ItemIndex + 1 ;
tablVibor.Visible := true;
tablrashod.Visible := false;
tablDohod.Visible := False;
tablDolgi.Visible := False;
tablZaemi.Visible := False;
tablRashod1.Visible := False;
tablDohod1.Visible := False;
tablDolgi1.Visible := False;
tablZaemi1.Visible := False;
pnlRashod.Visible := False;
pnlDohod.Visible := False;
pnlDolgi.Visible := False;
pnlZaemi.Visible := False;
currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoValut;
r := CurrentUser^.Element.KolvoRashodov;
d := CurrentUser^.Element.KolvoDohodov;
dolgiPosle := CurrentUser^.Element.KolvoDolgnikov;
zaemiPOsle := CurrentUser^.Element.KolvoZaemchikov;
    if vs <> 0
    then
      BEGIN
        tablVibor.RowCount := vs + 1;
        j := 0;
        k := 0;
        l := 0;
        dolgido := 0;
        zaemido := 0;
        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoValut;
            k := k + CurrentUser^.Element.KolvoDohodov;
            l := l + CurrentUser^.Element.KolvoRashodov;
            dolgido := dolgido + CurrentUser^.Element.KolvoDolgnikov;
            zaemido := zaemido + CurrentUser^.Element.KolvoZaemchikov;
          end;

        m := 0;
        CurrentValuta := FirstValuta;
        for i := 1 to j do
          begin
            CurrentValuta := CurrentValuta^.Next;
          end;
        for I := 1 to vs do
          begin
            Orashod := 0;
            Odohod := 0;
            inc(m);
            CurrentValuta := CurrentValuta^.Next;
            tablVibor.Cells[0,m] := CurrentValuta^.Element.Name;
            CurrentRashod := FirstRashod;
            for a := 1 to l do
              begin
                CurrentRashod := CurrentRashod^.Next;
              end;
            for b := 1 to r do
              begin
                CurrentRashod := CurrentRashod^.Next;
                if CurrentValuta^.Element.Name = CurrentRashod^.Element.Valuta
                then
                  begin
                    ORashod := ORashod + CurrentRashod^.Element.Money;
                  end;
              end;
            CurrentDolgi := FirstDolgi;
            for z := 1 to dolgido do
              begin
                CurrentDolgi := CurrentDolgi^.Next;
              end;
            for x := 1 to dolgiposle do
              begin
                CurrentDolgi := CurrentDolgi^.Next;
                if CurrentValuta^.Element.Name = CurrentDolgi^.Element.Valuta
                then
                  begin
                    ORashod := ORashod + CurrentDolgi^.Element.Money;
                  end;
              end;
            tablVibor.Cells[1,m] := IntToStr(ORashod);
            CurrentDohod := FirstDohod;
            for a := 1 to k do
              begin
                CurrentDohod := CurrentDohod^.Next;
              end;
            for b := 1 to d do
              begin
                CurrentDohod := CurrentDohod^.Next;
                if CurrentValuta^.Element.Name = CurrentDohod^.Element.Valuta
                then
                  begin
                    ODohod := ODohod + CurrentDohod^.Element.Money;
                  end;
              end;
            CurrentZaemi := FirstZaemi;
            for z := 1 to zaemido do
              begin
                CurrentZaemi := CurrentZaemi^.Next;
              end;
            for x := 1 to zaemiposle do
              begin
                CurrentZaemi := CurrentZaemi^.Next;
                if CurrentValuta^.Element.Name = CurrentZaemi^.Element.Valuta
                then
                  begin
                    ODohod := ODohod + CurrentZaemi^.Element.Money;
                  end;
              end;
            tablVibor.Cells[2,m] := IntToStr(ODohod);
            tablVibor.Cells[3,m] := Inttostr(Odohod-ORashod);
          end;

      end
    else
    tablVibor.RowCount := 2;
with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablVibor do
          begin
            Selection := myRect;
            Cells[0,0] := ' Название валюты';
            Cells[1,0] := '  Общий расход';
            Cells[2,0] := '  Общий доход';
            Cells[3,0] := '  Остаток';
          end;

end;

procedure TMainForm.btnMainClick(Sender: TObject);
var i, j, m, vs, k, l, a, r, d, b, z, x: Integer;
var dolgiposle,dolgido,zaemiposle,zaemido:Integer;
var myRect: TGridRect;
begin
  
 with tablVibor do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  GlobalName:=Password.cbVibor.Items[Password.cbVibor.ItemIndex];
  ORashod := 0;
  ODohod := 0;
ind := Password.cbVibor.ItemIndex + 1 ;
tablVibor.Visible := true;
tablrashod.Visible := false;
tablDohod.Visible := False;
tablDolgi.Visible := False;
tablZaemi.Visible := False;
tablRashod1.Visible := False;
tablDohod1.Visible := False;
tablDolgi1.Visible := False;
tablZaemi1.Visible := False;
pnlRashod.Visible := False;
pnlDohod.Visible := False;
pnlDolgi.Visible := False;
pnlZaemi.Visible := False;
currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoValut;
r := CurrentUser^.Element.KolvoRashodov;
d := CurrentUser^.Element.KolvoDohodov;
dolgiPosle := CurrentUser^.Element.KolvoDolgnikov;
zaemiPOsle := CurrentUser^.Element.KolvoZaemchikov;
    if vs <> 0
    then
      BEGIN
        tablVibor.RowCount := vs + 1;
        j := 0;
        k := 0;
        l := 0;
        dolgido := 0;
        zaemido := 0;
        CurrentUser := FirstUser;
        for i := 1 to (ind-1) do
          begin
            CurrentUser := CurrentUser^.Next;
            j := j + CurrentUser^.Element.KolvoValut;
            k := k + CurrentUser^.Element.KolvoDohodov;
            l := l + CurrentUser^.Element.KolvoRashodov;
            dolgido := dolgido + CurrentUser^.Element.KolvoDolgnikov;
            zaemido := zaemido + CurrentUser^.Element.KolvoZaemchikov;
          end;

        m := 0;
        CurrentValuta := FirstValuta;
        for i := 1 to j do
          begin
            CurrentValuta := CurrentValuta^.Next;
          end;
        for I := 1 to vs do
          begin
            ORashod := 0;
            ODohod := 0;
            inc(m);
            CurrentValuta := CurrentValuta^.Next;
            tablVibor.Cells[0,m] := CurrentValuta^.Element.Name;
            CurrentRashod := FirstRashod;
            for a := 1 to l do
              begin
                CurrentRashod := CurrentRashod^.Next;
              end;
            for b := 1 to r do
              begin
                CurrentRashod := CurrentRashod^.Next;
                if CurrentValuta^.Element.Name = CurrentRashod^.Element.Valuta
                then
                  begin
                    ORashod := ORashod + CurrentRashod^.Element.Money;
                  end;
              end;
            CurrentDolgi := FirstDolgi;
            for z := 1 to dolgido do
              begin
                CurrentDolgi := CurrentDolgi^.Next;
              end;
            for x := 1 to dolgiposle do
              begin
                CurrentDolgi := CurrentDolgi^.Next;
                if CurrentValuta^.Element.Name = CurrentDolgi^.Element.Valuta
                then
                  begin
                    ORashod := ORashod + CurrentDolgi^.Element.Money;
                  end;
              end;
            tablVibor.Cells[1,m] := IntToStr(ORashod);
            CurrentDohod := FirstDohod;
            for a := 1 to k do
              begin
                CurrentDohod := CurrentDohod^.Next;
              end;
            for b := 1 to d do
              begin
                CurrentDohod := CurrentDohod^.Next;
                if CurrentValuta^.Element.Name = CurrentDohod^.Element.Valuta
                then
                  begin
                    ODohod := ODohod + CurrentDohod^.Element.Money;
                  end;
              end;
            CurrentZaemi := FirstZaemi;
            for z := 1 to zaemido do
              begin
                CurrentZaemi := CurrentZaemi^.Next;
              end;
            for x := 1 to zaemiposle do
              begin
                CurrentZaemi := CurrentZaemi^.Next;
                if CurrentValuta^.Element.Name = CurrentZaemi^.Element.Valuta
                then
                  begin
                    ODohod := ODohod + CurrentZaemi^.Element.Money;
                  end;
              end;
            tablVibor.Cells[2,m] := IntToStr(ODohod);
            tablVibor.Cells[3,m] := Inttostr(Odohod-ORashod);
          end;

      end
    else
    tablVibor.RowCount := 2;
with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablVibor do
          begin
            Selection := myRect;
            Cells[0,0] := ' Название валюты';
            Cells[1,0] := '  Общий расход';
            Cells[2,0] := '  Общий доход';
            Cells[3,0] := '  Остаток';
          end;

end;

procedure TMainForm.btnValutClick(Sender: TObject);
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
MainForm.Hide;
NastroikaValut.Show;
end;

procedure TMainForm.btnCategoryClick(Sender: TObject);
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
MainForm.Hide;
NastroikaCategory.Show;
end;

procedure TMainForm.btnCalculateClick(Sender: TObject);
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
   WinExec('calc.exe', SW_SHOWNORMAL);
end;

procedure TMainForm.btnRashodClick(Sender: TObject);
var myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z:Integer;
str: string;
begin
  dtpSRashod.Date := Date;
  dtpPoRashod.Date := Date;
  with tablRashod1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  with tablRashod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
tablVibor.Visible := False;
tablrashod.Visible := True;
tablDohod.Visible := False;
tablDolgi.Visible := False;
tablZaemi.Visible := False;
tablRashod1.Visible := true;
tablDohod1.Visible := False;
tablDolgi1.Visible := False;
tablZaemi1.Visible := False;
pnlRashod.Visible := true;
pnlDohod.Visible := False;
pnlDolgi.Visible := False;
pnlZaemi.Visible := False;
with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablRashod do
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

tablRashod.ColCount := kValut + 2;

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
     tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   CurrentRashod := FirstRashod;
   for i:= 1 to kRashoddo do
   begin
     CurrentRashod := CurrentRashod^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     CurrentRashod := CurrentRashod^.Next;
     tablRashod.Cells[m,n] := DateToStr(CurrentRashod^.Element.Day);
     tablRashod.Cells[m+1,n]:= CurrentRashod^.Element.Category;
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
       tablRashod.Cells[m+z+1,n] := IntToStr(CurrentRashod^.Element.Money);
     end
     else
     begin
       tablRashod.Cells[m+z+1,n] := '0';
     end;
     end;
     tablRashod.RowCount := 1+kRashod;
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
     tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tablRashod.RowCount := 2;
end;
  tablRashod.DefaultColWidth := Round(960/tablRashod.ColCount);
  tablRashod1.ColCount := tablRashod.ColCount;
  tablRashod1.DefaultColWidth := Round(960/TablRashod.ColCount);
  tablRashod1.RowCount := 1;
  with tablRashod1 do
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
       str := tablRashod.Cells[i+1,z];
      ORashod := ORashod + StrToInt(str);

    end;
    tablRashod1.Cells[i+1,0]:=IntToStr(Orashod);
  end;
  end;
end;


procedure TMainForm.btnDohodClick(Sender: TObject);
var myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z:Integer;
str: string;
begin
  dtpsDohod.Date := Date;
  dtppoDohod.Date := Date;
  with tabldohod1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  with tabldohod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
tablVibor.Visible := False;
tablrashod.Visible := False;
tablDohod.Visible := true;
tablDolgi.Visible := False;
tablZaemi.Visible := False;
tablRashod1.Visible := False;
tablDohod1.Visible := true;
tablDolgi1.Visible := False;
tablZaemi1.Visible := False;
pnlRashod.Visible := False;
pnlDohod.Visible := true;
pnlDolgi.Visible := False;
pnlZaemi.Visible := False;
with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tabldohod do
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

tablDohod.ColCount := kValut + 2;

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
     tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   CurrentDohod := FirstDohod;
   for i:= 1 to kRashoddo do
   begin
     CurrentDohod := CurrentDohod^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     CurrentDohod := CurrentDohod^.Next;
     tablDohod.Cells[m,n] := DateToStr(CurrentDohod^.Element.Day);
     tablDohod.Cells[m+1,n]:= CurrentDohod^.Element.Category;
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
       tablDohod.Cells[m+z+1,n] := IntToStr(CurrentDohod^.Element.Money);
     end
     else
     begin
       tablDohod.Cells[m+z+1,n] := '0';
     end;
     end;
     tablDohod.RowCount := 1+kRashod;
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
     tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tablDohod.RowCount := 2;
end;
  tablDohod.DefaultColWidth := Round(960/tablDohod.ColCount);
  tablDohod1.ColCount := tablDohod.ColCount;
  tablDohod1.DefaultColWidth := Round(960/TablDohod.ColCount);
  tablDohod1.RowCount := 1;
  with tablDohod1 do
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
       str := tablDohod.Cells[i+1,z];
      ODohod := ODohod + StrToInt(str);

    end;
    tablDohod1.Cells[i+1,0]:=IntToStr(ODohod);
  end;
  end;
end;

procedure TMainForm.btnZaemClick(Sender: TObject);
var myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z, bred:Integer;
str: string;
begin
  dtpsZaemi.Date := Date;
  dtppoZaemi.Date := Date;
  with tablZaemi1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  with tablZaemi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
tablVibor.Visible := False;
tablrashod.Visible := False;
tablDohod.Visible := False;
tablDolgi.Visible := false;
tablZaemi.Visible := true;
tablRashod1.Visible := False;
tablDohod1.Visible := False;
tablDolgi1.Visible := false;
tablZaemi1.Visible := true;
pnlRashod.Visible := False;
pnlDohod.Visible := False;
pnlDolgi.Visible := false;
pnlZaemi.Visible := true;
with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablZaemi do
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

tablZaemi.ColCount := kValut + 2;

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
     tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   CurrentZaemi := FirstZaemi;
   for i:= 1 to kRashoddo do
   begin
     CurrentZaemi := CurrentZaemi^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     CurrentZaemi := CurrentZaemi^.Next;
     tablZaemi.Cells[m,n] := DateToStr(CurrentZaemi^.Element.Day);
     tablZaemi.Cells[m+1,n]:= CurrentZaemi^.Element.Name;
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
       tablZaemi.Cells[m+z+1,n] := IntToStr(CurrentZaemi^.Element.Money);
     end
     else
     begin
       tablZaemi.Cells[m+z+1,n] := '0';
     end;
     end;
     tablZaemi.RowCount := 1+kRashod;
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
     tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tablZaemi.RowCount := 2;
end;
  tablZaemi.DefaultColWidth := Round(960/tablZaemi.ColCount);
  tablZaemi1.ColCount := tablZaemi.ColCount;
  tablZaemi1.DefaultColWidth := Round(960/TablZaemi.ColCount);
  tablZaemi1.RowCount := 1;
  with tablZaemi1 do
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
       str := tablZaemi.Cells[i+1,z];
      OZaemi := OZaemi + StrToInt(str);

    end;
    tablZaemi1.Cells[i+1,0]:=IntToStr(oZaemi);
  end;
  end;
end;

procedure TMainForm.btnDolgClick(Sender: TObject);
var myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z:Integer;
str: string;
begin
  dtpsDolgi.Date := Date;
  dtppoDolgi.Date := Date;
  with tablDolgi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tablDolgi1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
tablVibor.Visible := False;
tablrashod.Visible := False;
tablDohod.Visible := False;
tablDolgi.Visible := True;
tablZaemi.Visible := False;
tablRashod1.Visible := False;
tablDohod1.Visible := False;
tablDolgi1.Visible := True;
tablZaemi1.Visible := False;
pnlRashod.Visible := False;
pnlDohod.Visible := False;
pnlDolgi.Visible := True;
pnlZaemi.Visible := False;
with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tabldolgi do
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

tabldolgi.ColCount := kValut + 2;

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
     tabldolgi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   Currentdolgi := Firstdolgi;
   for i:= 1 to kRashoddo do
   begin
     Currentdolgi := Currentdolgi^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     Currentdolgi := Currentdolgi^.Next;
     tabldolgi.Cells[m,n] := DateToStr(Currentdolgi^.Element.Day);
     tabldolgi.Cells[m+1,n]:= Currentdolgi^.Element.Name;
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
     if CurrentValuta^.Element.Name = Currentdolgi^.Element.Valuta
     then
     begin
       tabldolgi.Cells[m+z+1,n] := IntToStr(Currentdolgi^.Element.Money);
     end
     else
     begin
       tabldolgi.Cells[m+z+1,n] := '0';
     end;
     end;
     tabldolgi.RowCount := 1+kRashod;
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
     tabldolgi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tabldolgi.RowCount := 2;
end;
  tabldolgi.DefaultColWidth := Round(960/tabldolgi.ColCount);
  tabldolgi1.ColCount := tabldolgi.ColCount;
  tabldolgi1.DefaultColWidth := Round(960/Tabldolgi.ColCount);
  tabldolgi1.RowCount := 1;
  with tabldolgi1 do
          begin
            Selection := myRect;
            Cells[0,0] := '  Итого';
          end;
  if kRashod <> 0
  then
  begin
  for i:= 1 to kValut do
  begin
    Odolgi := 0;
    for z:=1 to kRashod do
    begin
       str := tabldolgi.Cells[i+1,z];
      Odolgi := Odolgi + StrToInt(str);

    end;
    tabldolgi1.Cells[i+1,0]:=IntToStr(Odolgi);
  end;
  end;
end;

procedure TMainForm.tablRashodMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
tablRashod.MouseToCell(X, Y, AColRashod, ARowRashod);//Получаем индексы ячейки ACol и ARow
        //Перемещаем фокус в ячейку с этими индексами:
        tablRashod.Col:=AColRashod;
        tablRashod.Row:=ARowRashod;
end;

procedure TMainForm.btnAddClick(Sender: TObject);
begin
 PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
 NameRashod.ShowModal;

end;

procedure TMainForm.btnChangeClick(Sender: TObject);
var i,vs:Integer;
begin
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoRashodov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (arowrashod < 1) or (vs = 0)
        then
        ShowMessage('Выберите расход.')
        else
        begin
        ChangeNameRashod.ShowModal;
        end;
end;

procedure TMainForm.btnDeleteClick(Sender: TObject);
var myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z,k,vs:Integer;
str: string;
A:AdrRashod;
begin
currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoRashodov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (arowrashod < 1) or (vs = 0)
        then
        ShowMessage('Выберите расход.')
        else
        begin
           with tablRashod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tablRashod1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
                  k := 0;
          CurrentUser := FirstUser;
          for i := 1 to (ind -1 ) do
          begin
            CurrentUser := CurrentUser^.Next;
            k := k + CurrentUser^.Element.KolvoRashodov;
          end;
          CurrentUser := CurrentUser^.Next;




              CurrentRashod := FirstRashod;
              for i := 1 to (k + ARowRashod) do
                begin
                  CurrentRashod := CurrentRashod^.Next;
                end;
              if CurrentRashod^.Next = nil
              then
              begin
              CurrentRashod := FirstRashod;
              for i := 1 to (k + Arowrashod -1) do
                begin
                  CurrentRashod := CurrentRashod^.Next;
                end;
              a := CurrentRashod^.Next;
              CurrentRashod^.Next := nil;
              Dispose(a);
              end
              else
              begin
              CurrentRashod := FirstRashod;
              for i := 1 to (k + ArowRashod -1) do
                begin
                  CurrentRashod := CurrentRashod^.Next;
                end;
              a := CurrentRashod^.Next;
              CurrentRashod^.Next := CurrentRashod^.Next^.Next;
              Dispose(a);
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
                CurrentUser^.Element.KolvoRashodov := CurrentUser^.Element.KolvoRashodov - 1;

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




          with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablRashod do
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

tablRashod.ColCount := kValut + 2;

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
     tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   CurrentRashod := FirstRashod;
   for i:= 1 to kRashoddo do
   begin
     CurrentRashod := CurrentRashod^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     CurrentRashod := CurrentRashod^.Next;
     tablRashod.Cells[m,n] := DateToStr(CurrentRashod^.Element.Day);
     tablRashod.Cells[m+1,n]:= CurrentRashod^.Element.Category;
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
       tablRashod.Cells[m+z+1,n] := IntToStr(CurrentRashod^.Element.Money);
     end
     else
     begin
       tablRashod.Cells[m+z+1,n] := '0';
     end;
     end;
     tablRashod.RowCount := 1+kRashod;
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
     tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tablRashod.RowCount := 2;
end;
  tablRashod.DefaultColWidth := Round(960/tablRashod.ColCount);
  tablRashod1.ColCount := tablRashod.ColCount;
  tablRashod1.DefaultColWidth := Round(960/TablRashod.ColCount);
  tablRashod1.RowCount := 1;
  with tablRashod1 do
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
       str := tablRashod.Cells[i+1,z];
      ORashod := ORashod + StrToInt(str);

    end;
    tablRashod1.Cells[i+1,0]:=IntToStr(Orashod);
  end;
  end;
end;

end;


procedure TMainForm.btnDavaiClick(Sender: TObject);
var myRect: TGridRect;
bool ,chert: boolean;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z,ch:Integer;
str: string;
data1, data2: TDateTime;
mydata: TdateTime;
myYear, myMonth, myDay,myYear1, myMonth1, myDay1,myYear2, myMonth2, myDay2 : word;
begin
  with tablRashod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tablRashod1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  chert:=False;
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  data1 := MainForm.dtpSRashod.Date;
  data2 := MainForm.dtpPoRashod.Date;
  if data1 > data2 then
   begin
  dtpsRashod.Date := Date;
  dtppoRashod.Date := Date;
  with tablRashod1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  with tablRashod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

ShowMessage('Неправильный период времени.');
with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablRashod do
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
kRashoddo := kRashoddo + CurrentUser^.Element.KolvoRashodov;
end;
Currentuser:=CurrentUser^.Next;
kValut:=CurrentUser^.Element.KolvoValut;
krashod:=CurrentUser^.Element.KolvoRashodov;

tablRashod.ColCount := kValut + 2;

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
     tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   CurrentRashod := FirstRashod;
   for i:= 1 to kRashoddo do
   begin
     CurrentRashod := CurrentRashod^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     CurrentRashod := CurrentRashod^.Next;
     tablRashod.Cells[m,n] := DateToStr(CurrentRashod^.Element.Day);
     tablRashod.Cells[m+1,n]:= CurrentRashod^.Element.Category;
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
       tablRashod.Cells[m+z+1,n] := IntToStr(CurrentRashod^.Element.Money);
     end
     else
     begin
       tablRashod.Cells[m+z+1,n] := '0';
     end;
     end;
     tablRashod.RowCount := 1+kRashod;
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
     tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tablRashod.RowCount := 2;
end;
  tablRashod.DefaultColWidth := Round(960/tablRashod.ColCount);
  tablRashod1.ColCount := tablRashod.ColCount;
  tablRashod1.DefaultColWidth := Round(960/TablRashod.ColCount);
  tablRashod1.RowCount := 1;
  with tablRashod1 do
          begin
            Selection := myRect;
            Cells[0,0] := '  Итого';
          end;
  if kRashod <> 0
  then
  begin
  for i:= 1 to kValut do
  begin
    ORashod := 0;
    for z:=1 to kRashod do
    begin
       str := tablRashod.Cells[i+1,z];
      ORashod := ORashod + StrToInt(str);

    end;
    tablRashod1.Cells[i+1,0]:=IntToStr(oRashod);
  end;
  end;
end
  else
  begin
  DecodeDate(data1,myYear1,myMonth1,myDay1);
  DecodeDate(data2,myYear2,myMonth2,myDay2);
  with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablRashod do
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

tablRashod.ColCount := kValut + 2;

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
             tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
           CurrentRashod := FirstRashod;
           for i:= 1 to kRashoddo do
           begin
             CurrentRashod := CurrentRashod^.Next;
           end;

           m := 0;
           n := 0 ;
           for i:= 1 to kRashod do
           begin
             CurrentRashod := CurrentRashod^.Next;
             mydata := CurrentRashod^.Element.Day;
             DecodeDate(mydata,myYear,myMonth,myDay);

             bool := false;
             if (myYear > myYear1) and (myYear <myYear2)
             then bool := true;

             if not bool
             then
             if (myYear > myYear1) and (myYear = myYear2)
             then
             if mymonth < mymonth2
             then bool := true;

             if not bool
             then
             if (myYear > myYear1) and (myYear = myYear2)
             then
             if mymonth = mymonth2
             then
             if myDay <=myday2
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear < myYear2)
             then
             if mymonth > mymonth1
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear < myYear2)
             then
             if mymonth = mymonth1
             then
             if myDay >= Myday1
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth > myMonth1) and (myMonth < mymonth2)
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth < mymonth2)
             then
             if myDay >= myDay1
             then bool := true;

              if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth > myMonth1) and (myMonth = mymonth2)
             then
             if myDay <= myDay2
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday > myday1) and (myday < myday2)
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday = myday1) and (myday < myday2)
             then
             if myDay <= myDay2
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday > myday1) and (myday = myday2)
             then
             if myDay >= myDay1
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday = myday1) and (myday = myday2)
             then bool := True;

             if bool
             then
             begin
               chert:= chert or bool;
               Inc(n);
                tablRashod.Cells[m,n] := DateToStr(CurrentRashod^.Element.Day);
                tablRashod.Cells[m+1,n]:= CurrentRashod^.Element.Category;
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
                     tablRashod.Cells[m+z+1,n] := IntToStr(CurrentRashod^.Element.Money);
                   end
                   else
                   begin
                     tablRashod.Cells[m+z+1,n] := '0';
                   end;
                   end;
                   tablRashod.RowCount := 1+n;
             end;
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
             tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
          tablRashod.RowCount := 2;
        end;
        if not chert
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
             tablRashod.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
          tablRashod.RowCount := 2;
        end;
          tablRashod.DefaultColWidth := Round(960/tablRashod.ColCount);
          tablRashod1.ColCount := tablRashod.ColCount;
          tablRashod1.DefaultColWidth := Round(960/TablRashod.ColCount);
          tablRashod1.RowCount := 1;
          with tablRashod1 do
                  begin
                    Selection := myRect;
                    Cells[0,0] := '  Итого';
                  end;
          if chert
          then
          begin
          for i:= 1 to kValut do
          begin
            Orashod := 0;
            for z:=1 to n do
            begin
               str := tablRashod.Cells[i+1,z];
              ORashod := ORashod + StrToInt(str);

            end;
            tablRashod1.Cells[i+1,0]:=IntToStr(Orashod);
          end;
          end;
end;
end;

procedure TMainForm.tablDohodMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

tablDohod.MouseToCell(X, Y, AColDohod, ARowDohod);//Получаем индексы ячейки ACol и ARow
        //Перемещаем фокус в ячейку с этими индексами:
        tablDohod.Col:=AColDohod;
        tablDohod.Row:=ARowDohod;

end;

procedure TMainForm.btnDeleteDohodClick(Sender: TObject);
var myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z,k,vs:Integer;
str: string;
A:AdrDohod;
begin

  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoDohodov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (ArowDohod < 1) or (vs = 0)

        then
        ShowMessage('Выберите доход.')
        else
        begin
            with tabldohod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tabldohod1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
                  k := 0;
          CurrentUser := FirstUser;
          for i := 1 to (ind -1 ) do
          begin
            CurrentUser := CurrentUser^.Next;
            k := k + CurrentUser^.Element.KolvoDohodov;
          end;
          CurrentUser := CurrentUser^.Next;




              CurrentDohod := FirstDohod;
              for i := 1 to (k + ARowDohod) do
                begin
                  CurrentDohod := CurrentDohod^.Next;
                end;
              if CurrentDohod^.Next = nil
              then
              begin
              CurrentDohod := FirstDohod;
              for i := 1 to (k + ArowDohod -1) do
                begin
                  CurrentDohod := CurrentDohod^.Next;
                end;
              a := CurrentDohod^.Next;
              CurrentDohod^.Next := nil;
              Dispose(a);
              end
              else
              begin
              CurrentDohod := FirstDohod;
              for i := 1 to (k + ArowDohod -1) do
                begin
                  CurrentDohod := CurrentDohod^.Next;
                end;
              a := CurrentDohod^.Next;
              CurrentDohod^.Next := CurrentDohod^.Next^.Next;
              Dispose(a);
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
                CurrentUser^.Element.KolvoDohodov := CurrentUser^.Element.KolvoDohodov - 1;

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




          with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablDohod do
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

tablDohod.ColCount := kValut + 2;

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
     tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   CurrentDohod := FirstDohod;
   for i:= 1 to kRashoddo do
   begin
     CurrentDohod := CurrentDohod^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     CurrentDohod := CurrentDohod^.Next;
     tablDohod.Cells[m,n] := DateToStr(CurrentDohod^.Element.Day);
     tablDohod.Cells[m+1,n]:= CurrentDohod^.Element.Category;
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
       tablDohod.Cells[m+z+1,n] := IntToStr(CurrentDohod^.Element.Money);
     end
     else
     begin
       tablDohod.Cells[m+z+1,n] := '0';
     end;
     end;
     tablDohod.RowCount := 1+kRashod;
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
     tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tablDohod.RowCount := 2;
end;
  tablDohod.DefaultColWidth := Round(960/tablDohod.ColCount);
  tablDohod1.ColCount := tablDohod.ColCount;
  tablDohod1.DefaultColWidth := Round(960/TablDohod.ColCount);
  tablDohod1.RowCount := 1;
  with tablDohod1 do
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
       str := tablDohod.Cells[i+1,z];
      ODohod := ODohod + StrToInt(str);

    end;
    tablDohod1.Cells[i+1,0]:=IntToStr(ODohod);
  end;
  end;
end;

end;

procedure TMainForm.btnDavaiDohodClick(Sender: TObject);
var myRect: TGridRect;
bool,chert : boolean;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z,ch:Integer;
str: string;
data1, data2: TDateTime;
mydata: TdateTime;
myYear, myMonth, myDay,myYear1, myMonth1, myDay1,myYear2, myMonth2, myDay2 : word;
begin
  with tablDohod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tabldohod1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  chert:=False;
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  data1 := MainForm.dtpSDohod.Date;
  data2 := MainForm.dtpPoDohod.Date;
  if data1 > data2 then
  begin
  ShowMessage('Неправильный период времени.') ;
    dtpsDohod.Date := Date;
  dtppoDohod.Date := Date;
  with tabldohod1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  with tabldohod do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
tablVibor.Visible := False;
tablrashod.Visible := False;
tablDohod.Visible := true;
tablDolgi.Visible := False;
tablZaemi.Visible := False;
tablRashod1.Visible := False;
tablDohod1.Visible := true;
tablDolgi1.Visible := False;
tablZaemi1.Visible := False;
pnlRashod.Visible := False;
pnlDohod.Visible := true;
pnlDolgi.Visible := False;
pnlZaemi.Visible := False;
with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tabldohod do
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

tablDohod.ColCount := kValut + 2;

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
     tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   CurrentDohod := FirstDohod;
   for i:= 1 to kRashoddo do
   begin
     CurrentDohod := CurrentDohod^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     CurrentDohod := CurrentDohod^.Next;
     tablDohod.Cells[m,n] := DateToStr(CurrentDohod^.Element.Day);
     tablDohod.Cells[m+1,n]:= CurrentDohod^.Element.Category;
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
       tablDohod.Cells[m+z+1,n] := IntToStr(CurrentDohod^.Element.Money);
     end
     else
     begin
       tablDohod.Cells[m+z+1,n] := '0';
     end;
     end;
     tablDohod.RowCount := 1+kRashod;
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
     tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tablDohod.RowCount := 2;
end;
  tablDohod.DefaultColWidth := Round(960/tablDohod.ColCount);
  tablDohod1.ColCount := tablDohod.ColCount;
  tablDohod1.DefaultColWidth := Round(960/TablDohod.ColCount);
  tablDohod1.RowCount := 1;
  with tablDohod1 do
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
       str := tablDohod.Cells[i+1,z];
      ODohod := ODohod + StrToInt(str);

    end;
    tablDohod1.Cells[i+1,0]:=IntToStr(ODohod);
  end;
  end;
end
  else
  begin
  DecodeDate(data1,myYear1,myMonth1,myDay1);
  DecodeDate(data2,myYear2,myMonth2,myDay2);
  with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablDohod do
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

tablDohod.ColCount := kValut + 2;

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
             tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
           CurrentDohod := FirstDohod;
           for i:= 1 to kRashoddo do
           begin
             CurrentDohod := CurrentDohod^.Next;
           end;

           m := 0;
           n := 0 ;
           for i:= 1 to kRashod do
           begin
             CurrentDohod := CurrentDohod^.Next;
             mydata := CurrentDohod^.Element.Day;
             DecodeDate(mydata,myYear,myMonth,myDay);

             bool := false;
             if (myYear > myYear1) and (myYear <myYear2)
             then bool := true;

             if not bool
             then
             if (myYear > myYear1) and (myYear = myYear2)
             then
             if mymonth < mymonth2
             then bool := true;

             if not bool
             then
             if (myYear > myYear1) and (myYear = myYear2)
             then
             if mymonth = mymonth2
             then
             if myDay <=myday2
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear < myYear2)
             then
             if mymonth > mymonth1
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear < myYear2)
             then
             if mymonth = mymonth1
             then
             if myDay >= Myday1
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth > myMonth1) and (myMonth < mymonth2)
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth < mymonth2)
             then
             if myDay >= myDay1
             then bool := true;

              if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth > myMonth1) and (myMonth = mymonth2)
             then
             if myDay <= myDay2
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday > myday1) and (myday < myday2)
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday = myday1) and (myday < myday2)
             then
             if myDay <= myDay2
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday > myday1) and (myday = myday2)
             then
             if myDay >= myDay1
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday = myday1) and (myday = myday2)
             then bool := True;

             if bool
             then
             begin
               chert := bool or chert;
               Inc(n);
                tablDohod.Cells[m,n] := DateToStr(CurrentDohod^.Element.Day);
                tablDohod.Cells[m+1,n]:= CurrentDohod^.Element.Category;
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
                     tablDohod.Cells[m+z+1,n] := IntToStr(CurrentDohod^.Element.Money);
                   end
                   else
                   begin
                     tablDohod.Cells[m+z+1,n] := '0';
                   end;
                   end;
                   tablDohod.RowCount := 1+n;
             end;
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
             tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
          tablDohod.RowCount := 2;
        end;
        if not chert
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
             tablDohod.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
          tablDohod.RowCount := 2;
        end;
          tablDohod.DefaultColWidth := Round(960/tablDohod.ColCount);
          tablDohod1.ColCount := tablDohod.ColCount;
          tablDohod1.DefaultColWidth := Round(960/TablDohod.ColCount);
          tablDohod1.RowCount := 1;
          with tablDohod1 do
                  begin
                    Selection := myRect;
                    Cells[0,0] := '  Итого';
                  end;
          if chert
          then
          begin
          for i:= 1 to kValut do
          begin
            ODohod := 0;
            for z:=1 to n do
            begin
               str := tablDohod.Cells[i+1,z];
              ODohod := ODohod + StrToInt(str);

            end;
            tablDohod1.Cells[i+1,0]:=IntToStr(ODohod);
          end;
          end;
end;
end;

procedure TMainForm.btnAddDohodClick(Sender: TObject);
begin
 PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
 Namedohod.ShowModal;

end;

procedure TMainForm.btnChangeDohodClick(Sender: TObject);
var i,vs:Integer;
begin
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoDohodov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (ArowDohod < 1) or (vs = 0)
        then
        ShowMessage('Выберите доход.')
        else
        begin
        ChangeNameDohod.ShowModal;
        end;
end;

procedure TMainForm.tablDolgiMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

tabldolgi.MouseToCell(X, Y, AColdolgi, ARowdolgi);//Получаем индексы ячейки ACol и ARow
        //Перемещаем фокус в ячейку с этими индексами:
        tabldolgi.Col:=AColdolgi;
        tabldolgi.Row:=ARowdolgi;

end;

procedure TMainForm.btnDeleteDolgiClick(Sender: TObject);
var myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z,k,vs:Integer;
str: string;
A:AdrDolgi;
begin

currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoDolgnikov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (ArowDolgi < 1) or (vs = 0)
        then
        ShowMessage('Выберите долг.')
        else
        begin
               with tablDolgi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tablDolgi1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
                  k := 0;
          CurrentUser := FirstUser;
          for i := 1 to (ind -1 ) do
          begin
            CurrentUser := CurrentUser^.Next;
            k := k + CurrentUser^.Element.KolvoDolgnikov;
          end;
          CurrentUser := CurrentUser^.Next;




              CurrentDolgi := FirstDolgi;
              for i := 1 to (k + ARowDolgi) do
                begin
                  CurrentDolgi := CurrentDolgi^.Next;
                end;
              if CurrentDolgi^.Next = nil
              then
              begin
              CurrentDolgi := FirstDolgi;
              for i := 1 to (k + ArowDolgi -1) do
                begin
                  CurrentDolgi := CurrentDolgi^.Next;
                end;
              a := CurrentDolgi^.Next;
              CurrentDolgi^.Next := nil;
              Dispose(a);
              end
              else
              begin
              CurrentDolgi := FirstDolgi;
              for i := 1 to (k + ArowDolgi -1) do
                begin
                  CurrentDolgi := CurrentDolgi^.Next;
                end;
              a := CurrentDolgi^.Next;
              CurrentDolgi^.Next := CurrentDolgi^.Next^.Next;
              Dispose(a);
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
                CurrentUser^.Element.KolvoDolgnikov := CurrentUser^.Element.KolvoDolgnikov - 1;

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




          with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablDolgi do
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

tablDolgi.ColCount := kValut + 2;

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
     tablDolgi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   CurrentDolgi := FirstDolgi;
   for i:= 1 to kRashoddo do
   begin
     CurrentDolgi := CurrentDolgi^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     CurrentDolgi := CurrentDolgi^.Next;
     tablDolgi.Cells[m,n] := DateToStr(CurrentDolgi^.Element.Day);
     tablDolgi.Cells[m+1,n]:= CurrentDolgi^.Element.name;
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
       tablDolgi.Cells[m+z+1,n] := IntToStr(CurrentDolgi^.Element.Money);
     end
     else
     begin
       tablDolgi.Cells[m+z+1,n] := '0';
     end;
     end;
     tablDolgi.RowCount := 1+kRashod;
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
     tablDolgi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tablDolgi.RowCount := 2;
end;
  tablDolgi.DefaultColWidth := Round(960/tablDolgi.ColCount);
  tablDolgi1.ColCount := tablDolgi.ColCount;
  tablDolgi1.DefaultColWidth := Round(960/TablDolgi.ColCount);
  tablDolgi1.RowCount := 1;
  with tablDolgi1 do
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
       str := tablDolgi.Cells[i+1,z];
      ODolgi := ODolgi+ StrToInt(str);

    end;
    tablDolgi1.Cells[i+1,0]:=IntToStr(ODolgi);
  end;
  end;
end;

end;

procedure TMainForm.btnDavaiDolgiClick(Sender: TObject);
var myRect: TGridRect;
bool ,chert: boolean;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z,ch:Integer;
str: string;
data1, data2: TDateTime;
mydata: TdateTime;
myYear, myMonth, myDay,myYear1, myMonth1, myDay1,myYear2, myMonth2, myDay2 : word;
begin
  with tabldolgi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tabldolgi1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  chert:= False;

  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  data1 := MainForm.dtpSDolgi.Date;
  data2 := MainForm.dtpPoDolgi.Date;
  if data1 > data2 then

  begin
  dtpsDolgi.Date := Date;
  dtppoDolgi.Date := Date;
  ShowMessage('Неправильный период времени.');
  with tablDolgi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tablDolgi1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
tablVibor.Visible := False;
tablrashod.Visible := False;
tablDohod.Visible := False;
tablDolgi.Visible := True;
tablZaemi.Visible := False;
tablRashod1.Visible := False;
tablDohod1.Visible := False;
tablDolgi1.Visible := True;
tablZaemi1.Visible := False;
pnlRashod.Visible := False;
pnlDohod.Visible := False;
pnlDolgi.Visible := True;
pnlZaemi.Visible := False;
with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tabldolgi do
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

tabldolgi.ColCount := kValut + 2;

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
     tabldolgi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   Currentdolgi := Firstdolgi;
   for i:= 1 to kRashoddo do
   begin
     Currentdolgi := Currentdolgi^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     Currentdolgi := Currentdolgi^.Next;
     tabldolgi.Cells[m,n] := DateToStr(Currentdolgi^.Element.Day);
     tabldolgi.Cells[m+1,n]:= Currentdolgi^.Element.Name;
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
     if CurrentValuta^.Element.Name = Currentdolgi^.Element.Valuta
     then
     begin
       tabldolgi.Cells[m+z+1,n] := IntToStr(Currentdolgi^.Element.Money);
     end
     else
     begin
       tabldolgi.Cells[m+z+1,n] := '0';
     end;
     end;
     tabldolgi.RowCount := 1+kRashod;
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
     tabldolgi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tabldolgi.RowCount := 2;
end;
  tabldolgi.DefaultColWidth := Round(960/tabldolgi.ColCount);
  tabldolgi1.ColCount := tabldolgi.ColCount;
  tabldolgi1.DefaultColWidth := Round(960/Tabldolgi.ColCount);
  tabldolgi1.RowCount := 1;
  with tabldolgi1 do
          begin
            Selection := myRect;
            Cells[0,0] := '  Итого';
          end;
  if kRashod <> 0
  then
  begin
  for i:= 1 to kValut do
  begin
    Odolgi := 0;
    for z:=1 to kRashod do
    begin
       str := tabldolgi.Cells[i+1,z];
      Odolgi := Odolgi + StrToInt(str);

    end;
    tabldolgi1.Cells[i+1,0]:=IntToStr(Odolgi);
  end;
  end;
end
  else
  begin
  DecodeDate(data1,myYear1,myMonth1,myDay1);
  DecodeDate(data2,myYear2,myMonth2,myDay2);
  with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablDolgi do
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

tablDolgi.ColCount := kValut + 2;

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
             tablDolgi.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
           CurrentDolgi := FirstDolgi;
           for i:= 1 to kRashoddo do
           begin
             CurrentDolgi := CurrentDolgi^.Next;
           end;

           m := 0;
           n := 0 ;
           for i:= 1 to kRashod do
           begin
             CurrentDolgi := CurrentDolgi^.Next;
             mydata := CurrentDolgi^.Element.Day;
             DecodeDate(mydata,myYear,myMonth,myDay);

             bool := false;
             if (myYear > myYear1) and (myYear <myYear2)
             then bool := true;

             if not bool
             then
             if (myYear > myYear1) and (myYear = myYear2)
             then
             if mymonth < mymonth2
             then bool := true;

             if not bool
             then
             if (myYear > myYear1) and (myYear = myYear2)
             then
             if mymonth = mymonth2
             then
             if myDay <=myday2
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear < myYear2)
             then
             if mymonth > mymonth1
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear < myYear2)
             then
             if mymonth = mymonth1
             then
             if myDay >= Myday1
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth > myMonth1) and (myMonth < mymonth2)
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth < mymonth2)
             then
             if myDay >= myDay1
             then bool := true;

              if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth > myMonth1) and (myMonth = mymonth2)
             then
             if myDay <= myDay2
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday > myday1) and (myday < myday2)
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday = myday1) and (myday < myday2)
             then
             if myDay <= myDay2
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday > myday1) and (myday = myday2)
             then
             if myDay >= myDay1
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday = myday1) and (myday = myday2)
             then bool := True;

             if bool
             then
             begin
               chert := chert or bool;
               Inc(n);
                tablDolgi.Cells[m,n] := DateToStr(CurrentDolgi^.Element.Day);
                tablDolgi.Cells[m+1,n]:= CurrentDolgi^.Element.name;
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
                     tablDolgi.Cells[m+z+1,n] := IntToStr(CurrentDolgi^.Element.Money);
                   end
                   else
                   begin
                     tablDolgi.Cells[m+z+1,n] := '0';
                   end;
                   end;
                   tablDolgi.RowCount := 1+n;
             end;
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
             tablDolgi.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
          tablDolgi.RowCount := 2;
        end;
        if not chert
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
             tablDolgi.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
          tablDolgi.RowCount := 2;
        end;
          tablDolgi.DefaultColWidth := Round(960/tablDolgi.ColCount);
          tablDolgi1.ColCount := tablDolgi.ColCount;
          tablDolgi1.DefaultColWidth := Round(960/TablDolgi.ColCount);
          tablDolgi1.RowCount := 1;
          with tablDolgi1 do
                  begin
                    Selection := myRect;
                    Cells[0,0] := '  Итого';
                  end;
          if chert
          then
          begin
          for i:= 1 to kValut do
          begin
            ODolgi := 0;
            for z:=1 to n do
            begin
               str := tablDolgi.Cells[i+1,z];
              ODolgi := ODolgi + StrToInt(str);

            end;
            tablDolgi1.Cells[i+1,0]:=IntToStr(ODolgi);
          end;
          end;
end;
end;

procedure TMainForm.btnAddDolgiClick(Sender: TObject);
begin
 PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
 Namedolgi.ShowModal;

end;

procedure TMainForm.btnChangeDolgiClick(Sender: TObject);
var i,vs:Integer;
begin
  currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoDolgnikov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (ArowDolgi < 1) or (vs = 0)
        then
        ShowMessage('Выберите долг.')
        else
        begin
        ChangeNamedolgi.ShowModal;
        end;
end;




procedure TMainForm.tablZaemiMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

tablZaemi.MouseToCell(X, Y, AcolZaemi, ARowZaemi);//Получаем индексы ячейки ACol и ARow
        //Перемещаем фокус в ячейку с этими индексами:
        tablZaemi.Col:=AColZaemi;
        tablZaemi.Row:=ARowZaemi;
end;

procedure TMainForm.btnAddZaemiClick(Sender: TObject);
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
 Namezaemi.ShowModal;

end;

procedure TMainForm.btnChangeZaemiClick(Sender: TObject);
var i, vs:Integer;
begin
currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoZaemchikov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (Arowzaemi < 1) or (vs = 0)
        then
        ShowMessage('Выберите займ.')
        else
        begin
        ChangeNamezaemi.ShowModal;
        end;
end;

procedure TMainForm.btnDeleteZaemiClick(Sender: TObject);
var myRect: TGridRect;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z,k,vs:Integer;
str: string;
A:AdrZaemi;
begin


currentUser := FirstUser;
for i := 1 to ind do
  begin
    CurrentUser := CurrentUser^.Next;
  end;
vs := CurrentUser^.Element.KolvoZaemchikov;
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (Arowzaemi < 1) or (vs = 0)
        then
        ShowMessage('Выберите займ.')
        else
        begin
              with tablZaemi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tablZaemi1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
                  k := 0;
          CurrentUser := FirstUser;
          for i := 1 to (ind -1 ) do
          begin
            CurrentUser := CurrentUser^.Next;
            k := k + CurrentUser^.Element.KolvoZaemchikov;
          end;
          CurrentUser := CurrentUser^.Next;




              CurrentZaemi := FirstZaemi;
              for i := 1 to (k + ARowZaemi) do
                begin
                  CurrentZaemi:= CurrentZaemi^.Next;
                end;
              if CurrentZaemi^.Next = nil
              then
              begin
              CurrentZaemi := FirstZaemi;
              for i := 1 to (k + ArowZaemi -1) do
                begin
                  CurrentZaemi := CurrentZaemi^.Next;
                end;
              a := CurrentZaemi^.Next;
              CurrentZaemi^.Next := nil;
              Dispose(a);
              end
              else
              begin
              CurrentZaemi := FirstZaemi;
              for i := 1 to (k + ArowZaemi -1) do
                begin
                  CurrentZaemi := CurrentZaemi^.Next;
                end;
              a := CurrentZaemi^.Next;
              CurrentZaemi^.Next := CurrentZaemi^.Next^.Next;
              Dispose(a);
              end;
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

              CurrentUser := FirstUser;
              for i:= 1 to ind do
                begin
                  CurrentUser := CurrentUser^.Next;

                end;
                CurrentUser^.Element.KolvoZaemchikov := CurrentUser^.Element.KolvoZaemchikov - 1;

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




          with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablZaemi do
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

tablZaemi.ColCount := kValut + 2;

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
     tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   CurrentZaemi := FirstZaemi;
   for i:= 1 to kRashoddo do
   begin
     CurrentZaemi := CurrentZaemi^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     CurrentZaemi := CurrentZaemi^.Next;
     tablZaemi.Cells[m,n] := DateToStr(CurrentZaemi^.Element.Day);
     tablZaemi.Cells[m+1,n]:= CurrentZaemi^.Element.name;
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
       tablZaemi.Cells[m+z+1,n] := IntToStr(CurrentZaemi^.Element.Money);
     end
     else
     begin
       tablZaemi.Cells[m+z+1,n] := '0';
     end;
     end;
     tablZaemi.RowCount := 1+kRashod;
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
     tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tablZaemi.RowCount := 2;
end;
  tablZaemi.DefaultColWidth := Round(960/tablZaemi.ColCount);
  tablZaemi1.ColCount := tablZaemi.ColCount;
  tablZaemi1.DefaultColWidth := Round(960/TablZaemi.ColCount);
  tablZaemi1.RowCount := 1;
  with tablZaemi1 do
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
       str := tablZaemi.Cells[i+1,z];
      OZaemi := OZaemi+ StrToInt(str);

    end;
    tablZaemi1.Cells[i+1,0]:=IntToStr(OZaemi);
  end;
  end;
end;

end;

procedure TMainForm.btnDavaiZaemiClick(Sender: TObject);
var myRect: TGridRect;
bool,chert : boolean;
kValutdo,kValut,kRashoddo,kRashod,p:Integer;
i,m,n,z,ch:Integer;
str: string;
data1, data2: TDateTime;
mydata: TdateTime;
myYear, myMonth, myDay,myYear1, myMonth1, myDay1,myYear2, myMonth2, myDay2 : word;
begin
  with tablZaemi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
    with tablZaemi1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  chert := False;
  
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
  data1 := MainForm.dtpSZaemi.Date;
  data2 := MainForm.dtpPoZaemi.Date;
  if data1 > data2 then
  begin
  dtpsZaemi.Date := Date;
  dtppoZaemi.Date := Date;
  with tablZaemi1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
  with tablZaemi do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

ShowMessage('Неправильный период времени.');
with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablZaemi do
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

tablZaemi.ColCount := kValut + 2;

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
     tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
   CurrentZaemi := FirstZaemi;
   for i:= 1 to kRashoddo do
   begin
     CurrentZaemi := CurrentZaemi^.Next;
   end;
   m:=0;
   n:=0;
   for i:= 1 to kRashod do
   begin
     inc(n);
     CurrentZaemi := CurrentZaemi^.Next;
     tablZaemi.Cells[m,n] := DateToStr(CurrentZaemi^.Element.Day);
     tablZaemi.Cells[m+1,n]:= CurrentZaemi^.Element.Name;
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
       tablZaemi.Cells[m+z+1,n] := IntToStr(CurrentZaemi^.Element.Money);
     end
     else
     begin
       tablZaemi.Cells[m+z+1,n] := '0';
     end;
     end;
     tablZaemi.RowCount := 1+kRashod;
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
     tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
   end;
  tablZaemi.RowCount := 2;
end;
  tablZaemi.DefaultColWidth := Round(960/tablZaemi.ColCount);
  tablZaemi1.ColCount := tablZaemi.ColCount;
  tablZaemi1.DefaultColWidth := Round(960/TablZaemi.ColCount);
  tablZaemi1.RowCount := 1;
  with tablZaemi1 do
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
       str := tablZaemi.Cells[i+1,z];
      OZaemi := OZaemi + StrToInt(str);

    end;
    tablZaemi1.Cells[i+1,0]:=IntToStr(oZaemi);
  end;
  end;
end

  else
  begin
  DecodeDate(data1,myYear1,myMonth1,myDay1);
  DecodeDate(data2,myYear2,myMonth2,myDay2);
  with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
with tablZaemi do
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

tablZaemi.ColCount := kValut + 2;

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
             tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
           CurrentZaemi := FirstZaemi;
           for i:= 1 to kRashoddo do
           begin
             CurrentZaemi := CurrentZaemi^.Next;
           end;

           m := 0;
           n := 0 ;
           for i:= 1 to kRashod do
           begin
             CurrentZaemi := CurrentZaemi^.Next;
             mydata := CurrentZaemi^.Element.Day;
             DecodeDate(mydata,myYear,myMonth,myDay);

             bool := false;
             if (myYear > myYear1) and (myYear <myYear2)
             then bool := true;

             if not bool
             then
             if (myYear > myYear1) and (myYear = myYear2)
             then
             if mymonth < mymonth2
             then bool := true;

             if not bool
             then
             if (myYear > myYear1) and (myYear = myYear2)
             then
             if mymonth = mymonth2
             then
             if myDay <=myday2
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear < myYear2)
             then
             if mymonth > mymonth1
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear < myYear2)
             then
             if mymonth = mymonth1
             then
             if myDay >= Myday1
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth > myMonth1) and (myMonth < mymonth2)
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth < mymonth2)
             then
             if myDay >= myDay1
             then bool := true;

              if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth > myMonth1) and (myMonth = mymonth2)
             then
             if myDay <= myDay2
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday > myday1) and (myday < myday2)
             then bool := true;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday = myday1) and (myday < myday2)
             then
             if myDay <= myDay2
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday > myday1) and (myday = myday2)
             then
             if myDay >= myDay1
             then bool := True;

             if not bool
             then
             if (myYear = myYear1) and (myYear = myYear2)
             then
             if (myMonth = myMonth1) and (myMonth = mymonth2)
             then
             if (myday = myday1) and (myday = myday2)
             then bool := True;

             if bool
             then
             begin
               chert := chert or bool;
               Inc(n);
                tablZaemi.Cells[m,n] := DateToStr(CurrentZaemi^.Element.Day);
                tablZaemi.Cells[m+1,n]:= CurrentZaemi^.Element.name;
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
                     tablZaemi.Cells[m+z+1,n] := IntToStr(CurrentZaemi^.Element.Money);
                   end
                   else
                   begin
                     tablZaemi.Cells[m+z+1,n] := '0';
                   end;
                   end;
                   tablZaemi.RowCount := 1+n;
             end;
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
             tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
          tablZaemi.RowCount := 2;
        end;
        if not chert
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
             tablZaemi.Cells[m,0] := CurrentValuta^.Element.Name;
           end;
          tablZaemi.RowCount := 2;
        end;
          tablZaemi.DefaultColWidth := Round(960/tablZaemi.ColCount);
          tablZaemi1.ColCount := tablZaemi.ColCount;
          tablZaemi1.DefaultColWidth := Round(960/TablZaemi.ColCount);
          tablZaemi1.RowCount := 1;
          with tablZaemi1 do
                  begin
                    Selection := myRect;
                    Cells[0,0] := '  Итого';
                  end;
          if chert
          then
          begin
          for i:= 1 to kValut do
          begin
            OZaemi := 0;
            for z:=1 to n do
            begin
               str := tablZaemi.Cells[i+1,z];
              OZaemi := OZaemi + StrToInt(str);

            end;
            tablZaemi1.Cells[i+1,0]:=IntToStr(OZaemi);
          end;
          end;
end;
end;




procedure TMainForm.btnOtchetClick(Sender: TObject);
begin
 PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
 Otchet.Show;
 MainForm.Hide;
end;



end.




