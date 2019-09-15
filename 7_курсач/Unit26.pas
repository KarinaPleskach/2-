unit Unit26;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls,MMSystem;

type
  TOtchet = class(TForm)
    btnMain: TButton;
    btnRashod: TButton;
    btnDohod: TButton;
    btnDolgi: TButton;
    btnZaemi: TButton;
    pnlMain: TPanel;
    cbbMain: TComboBox;
    btnGoMain: TButton;
    lbl1: TLabel;
    chtMain: TChart;
    psrsMain: TPieSeries;
    pnlDohod: TPanel;
    lbl2: TLabel;
    cbbdohod: TComboBox;
    btngodohod: TButton;
    chtdohod: TChart;
    psrsdohod: TPieSeries;
    pnlDolgi: TPanel;
    lbl3: TLabel;
    cbbDolgi: TComboBox;
    btnGodolgi: TButton;
    chtdolgi: TChart;
    psrsdolgi: TPieSeries;
    pnlZaemi: TPanel;
    lbl4: TLabel;
    cbbzaemi: TComboBox;
    btngozaemi: TButton;
    chtzaemi: TChart;
    psrszaemi: TPieSeries;
    procedure FormShow(Sender: TObject);
    procedure btnGoMainClick(Sender: TObject);
    procedure btnMainClick(Sender: TObject);
    procedure btnRashodClick(Sender: TObject);
    procedure btnDohodClick(Sender: TObject);
    procedure btngodohodClick(Sender: TObject);
    procedure btnGodolgiClick(Sender: TObject);
    procedure btngozaemiClick(Sender: TObject);
    procedure btnDolgiClick(Sender: TObject);
    procedure btnZaemiClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Otchet: TOtchet;

implementation
 Uses Unit4, Unit1;
{$R *.dfm}

procedure TOtchet.FormShow(Sender: TObject);
var l,v,r,vs,i:Integer;
begin
  Randomize;
pnlMain.Visible := True;
pnlDohod.Visible := False;
pnlDolgi.Visible := False;
pnlZaemi.Visible := False;
v:=0;

currentUser := FirstUser;
for i := 1 to (ind-1) do
  begin
    CurrentUser := CurrentUser^.Next;
    v := CurrentUser^.Element.KolvoValut;
  end;
  CurrentUser := CurrentUser^.Next;
vs := CurrentUser^.Element.KolvoValut;

  cbbMain.Text := '';
  cbbMain.Items.Clear;
  CurrentValuta := FirstValuta;
  for i := 1 to v do
    CurrentValuta:=CurrentValuta^.Next;
  for i := 1 to vs do
    begin
      CurrentValuta := CurrentValuta^.Next;
      cbbMain.Items.Add(CurrentValuta^.Element.Name);
    end;
  psrsMain.Clear;

end;


procedure TOtchet.btnGoMainClick(Sender: TObject);
var s,cat:string[30];
var i,l,v,r,vs,j,catmoney, r1:Integer;
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        s := cbbMain.Items[cbbMain.ItemIndex];
        if Length(s) <> 0
          then
            begin

              l:=0;
              r:=0;
              r1:=0;
               psrsMain.Clear;
              currentUser := FirstUser;
              for i := 1 to (ind-1) do
                begin
                  CurrentUser := CurrentUser^.Next;
                  l := CurrentUser^.Element.KolvoRashodov;

                end;
                CurrentUser := CurrentUser^.Next;
              r := CurrentUser^.Element.KolvoRashodov;
              r1 := currentUser^.Element.KolvoRashodov;
              CurrentRashod := FirstRashod;
              for i:= 1 to l do
                 CurrentRashod := CurrentRashod^.Next;
              for i := 1 to r do
              begin
                currentrashod := FirstRashod;
                for j := 1 to l do
                    CurrentRashod := CurrentRashod^.Next;
                for j := 1 to i do
                    CurrentRashod := CurrentRashod^.Next;
                catmoney := 0;
                cat := currentrashod^.Element.Category;
                if cat <> '' then
                begin
                if CurrentRashod^.Element.Valuta = s
                then
                begin
                  currentrashod := FirstRashod;
                for j := 1 to l do
                    CurrentRashod := CurrentRashod^.Next;
                for j := 1 to r1 do
                begin
                    CurrentRashod := CurrentRashod^.Next;
                    if CurrentRashod^.Element.Category = cat
                    then
                    begin
                      catmoney := catmoney + CurrentRashod^.Element.Money;
                      CurrentRashod^.Element.Category := '';
                    end;
                end;

                  psrsmain.Add(catmoney,cat, Random(65536));
                end;
                end;

              end;
              Reset(FileWithRashod);
            New(FirstRashod);
            CurrentRashod := FirstRashod;
            CurrentRashod^.Next := nil;
            while not EOF(FileWithRashod) do
              begin
                Read(FileWithRashod, DataRashod);
                New(CurrentRashod^.Next);
                CurrentRashod := CurrentRashod^.Next;
                CurrentRashod^.Element.Money := DataRashod.Money;
                CurrentRashod^.Element.Valuta := DataRashod.Valuta;
                CurrentRashod^.Element.Category := DataRashod.Category;
                CurrentRashod^.Element.Day := DataRashod.Day;
                CurrentRashod^.Element.User := DataRashod.User;
                CurrentRashod^.Next := nil;
              end;

            end
          else
            begin
            ShowMessage('Выберите валюту.');
            cbbMain.Text := '';
            end;
end;

procedure TOtchet.btnMainClick(Sender: TObject);
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
Otchet.Hide;
MainForm.Show;
end;

procedure TOtchet.btnRashodClick(Sender: TObject);
var l,v,r,vs,i:Integer;
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
pnlMain.Visible := True;
pnlDohod.Visible := False;
pnlDolgi.Visible := False;
pnlZaemi.Visible := False;
v:=0;

currentUser := FirstUser;
for i := 1 to (ind-1) do
  begin
    CurrentUser := CurrentUser^.Next;
    v := CurrentUser^.Element.KolvoValut;
  end;
  CurrentUser := CurrentUser^.Next;
vs := CurrentUser^.Element.KolvoValut;

  cbbMain.Text := '';
  cbbMain.Items.Clear;
  CurrentValuta := FirstValuta;
  for i := 1 to v do
    CurrentValuta:=CurrentValuta^.Next;
  for i := 1 to vs do
    begin
      CurrentValuta := CurrentValuta^.Next;
      cbbMain.Items.Add(CurrentValuta^.Element.Name);
    end;
  psrsMain.Clear;

end;


procedure TOtchet.btnDohodClick(Sender: TObject);
var l,v,r,vs,i:Integer;
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
pnlMain.Visible := false;
pnlDohod.Visible := true;
pnlDolgi.Visible := False;
pnlZaemi.Visible := False;
v:=0;

currentUser := FirstUser;
for i := 1 to (ind-1) do
  begin
    CurrentUser := CurrentUser^.Next;
    v := CurrentUser^.Element.KolvoValut;
  end;
  CurrentUser := CurrentUser^.Next;
vs := CurrentUser^.Element.KolvoValut;

  cbbdohod.Text := '';
  cbbdohod.Items.Clear;
  CurrentValuta := FirstValuta;
  for i := 1 to v do
    CurrentValuta:=CurrentValuta^.Next;
  for i := 1 to vs do
    begin
      CurrentValuta := CurrentValuta^.Next;
      cbbdohod.Items.Add(CurrentValuta^.Element.Name);
    end;
  psrsdohod.Clear;

end;

procedure TOtchet.btngodohodClick(Sender: TObject);
var s,cat:string[30];
var i,l,v,r,vs,j,catmoney, r1:Integer;
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        s := cbbDohod.Items[cbbDohod.ItemIndex];
        if Length(s) <> 0
          then
            begin

              l:=0;
              r:=0;
              r1:=0;
               psrsDohod.Clear;
              currentUser := FirstUser;
              for i := 1 to (ind-1) do
                begin
                  CurrentUser := CurrentUser^.Next;
                  l := CurrentUser^.Element.KolvoDohodov;

                end;
                CurrentUser := CurrentUser^.Next;
              r := CurrentUser^.Element.KolvoDohodov;
              r1 := currentUser^.Element.KolvoDohodov;
              CurrentDohod := FirstDohod;
              for i:= 1 to l do
                 CurrentDohod := CurrentDohod^.Next;
              for i := 1 to r do
              begin
                currentDohod := FirstDohod;
                for j := 1 to l do
                    CurrentDohod := CurrentDohod^.Next;
                for j := 1 to i do
                    CurrentDohod := CurrentDohod^.Next;
                catmoney := 0;
                cat := currentDohod^.Element.Category;
                if cat <> '' then
                begin
                if CurrentDohod^.Element.Valuta = s
                then
                begin
                  currentDohod := FirstDohod;
                for j := 1 to l do
                    CurrentDohod := CurrentDohod^.Next;
                for j := 1 to r1 do
                begin
                    CurrentDohod := CurrentDohod^.Next;
                    if CurrentDohod^.Element.Category = cat
                    then
                    begin
                      catmoney := catmoney + CurrentDohod^.Element.Money;
                      CurrentDohod^.Element.Category := '';
                    end;
                end;

                  psrsDohod.Add(catmoney,cat, Random(65536));
                end;
                end;

              end;
              Reset(FileWithDohod);
            New(FirstDohod);
            CurrentDohod := FirstDohod;
            CurrentDohod^.Next := nil;
            while not EOF(FileWithDohod) do
              begin
                Read(FileWithDohod, DataDohod);
                New(CurrentDohod^.Next);
                CurrentDohod := CurrentDohod^.Next;
                CurrentDohod^.Element.Money := DataDohod.Money;
                CurrentDohod^.Element.Valuta := DataDohod.Valuta;
                CurrentDohod^.Element.Category := DataDohod.Category;
                CurrentDohod^.Element.Day := DataDohod.Day;
                CurrentDohod^.Element.User := DataDohod.User;
                CurrentDohod^.Next := nil;
              end;

            end
          else
            begin
            ShowMessage('Выберите валюту.');
            cbbDohod.Text := '';
            end;
end;

procedure TOtchet.btnGodolgiClick(Sender: TObject);
var s,cat:string[30];
var i,l,v,r,vs,j,catmoney, r1:Integer;
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        s := cbbdolgi.Items[cbbdolgi.ItemIndex];
        if Length(s) <> 0
          then
            begin

              l:=0;
              r:=0;
              r1:=0;
               psrsdolgi.Clear;
              currentUser := FirstUser;
              for i := 1 to (ind-1) do
                begin
                  CurrentUser := CurrentUser^.Next;
                  l := CurrentUser^.Element.KolvoDolgnikov;

                end;
                CurrentUser := CurrentUser^.Next;
              r := CurrentUser^.Element.KolvoDolgnikov;
              r1 := currentUser^.Element.KolvoDolgnikov;
              Currentdolgi := Firstdolgi;
              for i:= 1 to l do
                 Currentdolgi := Currentdolgi^.Next;
              for i := 1 to r do
              begin
                currentdolgi := Firstdolgi;
                for j := 1 to l do
                    Currentdolgi := Currentdolgi^.Next;
                for j := 1 to i do
                    Currentdolgi := Currentdolgi^.Next;
                catmoney := 0;
                cat := currentdolgi^.Element.name;
                if cat <> '' then
                begin
                if Currentdolgi^.Element.Valuta = s
                then
                begin
                  currentdolgi:= Firstdolgi;
                for j := 1 to l do
                    Currentdolgi := Currentdolgi^.Next;
                for j := 1 to r1 do
                begin
                    Currentdolgi := Currentdolgi^.Next;
                    if Currentdolgi^.Element.name = cat
                    then
                    begin
                      catmoney := catmoney + Currentdolgi^.Element.Money;
                      Currentdolgi^.Element.Name := '';
                    end;
                end;

                  psrsdolgi.Add(catmoney,cat, Random(65536));
                end;
                end;

              end;
              Reset(FileWithDolgi);
            New(FirstDolgi);
            CurrentDolgi := FirstDolgi;
            CurrentDolgi^.Next := nil;
            while not EOF(FileWithDolgi) do
              begin
                Read(FileWithDolgi, DataDolgi);
                New(CurrentDolgi^.Next);
                CurrentDolgi := CurrentDolgi^.Next;
                CurrentDolgi^.Element.Name := DataDolgi.Name;
                CurrentDolgi^.Element.Money := DataDolgi.Money;
                CurrentDolgi^.Element.Valuta := DataDolgi.Valuta;
                CurrentDolgi^.Element.Day := DataDolgi.Day;
                CurrentDolgi^.Element.User := DataDolgi.User;
                CurrentDolgi^.Next := nil;
              end;

            end
          else
            begin
            ShowMessage('Выберите валюту.');
            cbbDolgi.Text := '';
            end;
end;
procedure TOtchet.btngozaemiClick(Sender: TObject);
var s,cat:string[30];
var i,l,v,r,vs,j,catmoney, r1:Integer;
begin
PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        s := cbbzaemi.Items[cbbzaemi.ItemIndex];
        if Length(s) <> 0
          then
            begin

              l:=0;
              r:=0;
              r1:=0;
               psrszaemi.Clear;
              currentUser := FirstUser;
              for i := 1 to (ind-1) do
                begin
                  CurrentUser := CurrentUser^.Next;
                  l := CurrentUser^.Element.KolvoZaemchikov;

                end;
                CurrentUser := CurrentUser^.Next;
              r := CurrentUser^.Element.KolvoZaemchikov;
              r1 := currentUser^.Element.KolvoZaemchikov;
              Currentzaemi := Firstzaemi;
              for i:= 1 to l do
                 Currentzaemi := Currentzaemi^.Next;
              for i := 1 to r do
              begin
                currentzaemi := Firstzaemi;
                for j := 1 to l do
                    Currentzaemi := Currentzaemi^.Next;
                for j := 1 to i do
                    Currentzaemi := Currentzaemi^.Next;
                catmoney := 0;
                cat := currentzaemi^.Element.name;
                if cat <> '' then
                begin
                if Currentzaemi^.Element.Valuta = s
                then
                begin
                  currentzaemi:= Firstzaemi;
                for j := 1 to l do
                    Currentzaemi := Currentzaemi^.Next;
                for j := 1 to r1 do
                begin
                    Currentzaemi := Currentzaemi^.Next;
                    if Currentzaemi^.Element.name = cat
                    then
                    begin
                      catmoney := catmoney + Currentzaemi^.Element.Money;
                      Currentzaemi^.Element.Name := '';
                    end;
                end;

                  psrszaemi.Add(catmoney,cat, Random(65536));
                end;
                end;

              end;
             Reset(FileWithZaemi);
            New(FirstZaemi);
            CurrentZaemi := FirstZaemi;
            CurrentZaemi^.Next := nil;
            while not EOF(FileWithZaemi) do
              begin
                Read(FileWithZaemi, DataZaemi);
                New(CurrentZaemi^.Next);
                CurrentZaemi := CurrentZaemi^.Next;
                CurrentZaemi^.Element.Name := DataZaemi.Name;
                CurrentZaemi^.Element.Money := DataZaemi.MOney;
                CurrentZaemi^.Element.Valuta := DataZaemi.Valuta;
                CurrentZaemi^.Element.Day := DataZaemi.Day;
                CurrentZaemi^.Element.User := DataZaemi.User;
                CurrentZaemi^.Next := nil;
              end;

            end
          else
            begin
            ShowMessage('Выберите валюту.');
            cbbzaemi.Text := '';
            end;
end;
procedure TOtchet.btnDolgiClick(Sender: TObject);
var l,v,r,vs,i:Integer;
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
pnlMain.Visible := false;
pnlDohod.Visible := False;
pnlDolgi.Visible := true;
pnlZaemi.Visible := False;
v:=0;

currentUser := FirstUser;
for i := 1 to (ind-1) do
  begin
    CurrentUser := CurrentUser^.Next;
    v := CurrentUser^.Element.KolvoValut;
  end;
  CurrentUser := CurrentUser^.Next;
vs := CurrentUser^.Element.KolvoValut;

  cbbDolgi.Text := '';
  cbbDolgi.Items.Clear;
  CurrentValuta := FirstValuta;
  for i := 1 to v do
    CurrentValuta:=CurrentValuta^.Next;
  for i := 1 to vs do
    begin
      CurrentValuta := CurrentValuta^.Next;
      cbbDolgi.Items.Add(CurrentValuta^.Element.Name);
    end;
  psrsDolgi.Clear;

end;
procedure TOtchet.btnZaemiClick(Sender: TObject);
var l,v,r,vs,i:Integer;
begin
  PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
pnlMain.Visible := false;
pnlDohod.Visible := False;
pnlDolgi.Visible := False;
pnlZaemi.Visible := true;
v:=0;

currentUser := FirstUser;
for i := 1 to (ind-1) do
  begin
    CurrentUser := CurrentUser^.Next;
    v := CurrentUser^.Element.KolvoValut;
  end;
  CurrentUser := CurrentUser^.Next;
vs := CurrentUser^.Element.KolvoValut;

  cbbZaemi.Text := '';
  cbbZaemi.Items.Clear;
  CurrentValuta := FirstValuta;
  for i := 1 to v do
    CurrentValuta:=CurrentValuta^.Next;
  for i := 1 to vs do
    begin
      CurrentValuta := CurrentValuta^.Next;
      cbbZaemi.Items.Add(CurrentValuta^.Element.Name);
    end;
  psrsZaemi.Clear;

end;



end.
