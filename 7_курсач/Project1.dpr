program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Password},
  Unit2 in 'Unit2.pas' {AdminNames},
  Unit3 in 'Unit3.pas' {FormName},
  Unit4 in 'Unit4.pas' {MainForm},
  Unit5 in 'Unit5.pas' {Vi},
  Unit6 in 'Unit6.pas' {ViForm},
  Unit7 in 'Unit7.pas' {Change},
  Unit8 in 'Unit8.pas' {ViFormMain},
  Unit9 in 'Unit9.pas' {NastroikaValut},
  Unit10 in 'Unit10.pas' {AddValut},
  Unit11 in 'Unit11.pas' {Attantion},
  Unit12 in 'Unit12.pas' {nastroikaCategory},
  Unit13 in 'Unit13.pas' {AddDohod},
  Unit14 in 'Unit14.pas' {AddRashod},
  Unit15 in 'Unit15.pas' {ChangeDohod},
  Unit16 in 'Unit16.pas' {ChangeRashod},
  Unit17 in 'Unit17.pas' {Form17},
  Unit18 in 'Unit18.pas' {NameRashod},
  Unit19 in 'Unit19.pas' {ChangeNameRashod},
  Unit20 in 'Unit20.pas' {NameDohod},
  Unit21 in 'Unit21.pas' {ChangeNameDohod},
  Unit22 in 'Unit22.pas' {NameDolgi},
  Unit23 in 'Unit23.pas' {ChangeNamedolgi},
  Unit24 in 'Unit24.pas' {NameZaemi},
  Unit25 in 'Unit25.pas' {changenameZaemi},
  Unit26 in 'Unit26.pas' {Otchet};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPassword, Password);
  Application.CreateForm(TAdminNames, AdminNames);
  Application.CreateForm(TFormName, FormName);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TVi, Vi);
  Application.CreateForm(TViForm, ViForm);
  Application.CreateForm(TChange, Change);
  Application.CreateForm(TViFormMain, ViFormMain);
  Application.CreateForm(TNastroikaValut, NastroikaValut);
  Application.CreateForm(TAddValut, AddValut);
  Application.CreateForm(TAttantion, Attantion);
  Application.CreateForm(TnastroikaCategory, nastroikaCategory);
  Application.CreateForm(TAddDohod, AddDohod);
  Application.CreateForm(TAddRashod, AddRashod);
  Application.CreateForm(TChangeDohod, ChangeDohod);
  Application.CreateForm(TChangeRashod, ChangeRashod);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TNameRashod, NameRashod);
  Application.CreateForm(TChangeNameRashod, ChangeNameRashod);
  Application.CreateForm(TNameDohod, NameDohod);
  Application.CreateForm(TChangeNameDohod, ChangeNameDohod);
  Application.CreateForm(TNameDolgi, NameDolgi);
  Application.CreateForm(TChangeNamedolgi, ChangeNamedolgi);
  Application.CreateForm(TNameZaemi, NameZaemi);
  Application.CreateForm(TchangenameZaemi, changenameZaemi);
  Application.CreateForm(TOtchet, Otchet);
  Application.Run;
end.
