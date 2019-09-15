program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Add},
  Unit3 in 'Unit3.pas' {change},
  Unit4 in 'Unit4.pas' {vi};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAdd, Add);
  Application.CreateForm(Tchange, change);
  Application.CreateForm(Tvi, vi);
  Application.Run;
end.
