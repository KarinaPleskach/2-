unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppEvnts, ExtCtrls;

type
  TParticle = record
    StartTime: Integer;
    Size: Integer;
    Angle: Single;
    Force: Single;
  end;
  TfrmMain = class(TForm)
    pbMain: TPaintBox;
    aeMain: TApplicationEvents;
    procedure pbMainPaint(Sender: TObject);
    procedure pbMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aeMainIdle(Sender: TObject; var Done: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FParticles: array of TParticle;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.pbMainPaint(Sender: TObject);
var
  i, j: Integer;
  X, Y: Integer;
  tmNow: Integer;
  tmDelta: Single;
begin
  tmNow := GetTickCount;
  with pbMain.Canvas do
  begin
    Pen.Style := psClear;
    Brush.Color := clBlack;
    for i := 0 to Length(FParticles) - 1 do
      with FParticles[i] do
      begin
        tmDelta := (tmNow - StartTime) / 10;
        X := Trunc(Force * Cos(Angle) * tmDelta);
        Y := Trunc(pbMain.Height - (Force * Sin(Angle) * tmDelta - tmDelta * tmDelta * 0.125));
        if Y > pbMain.Height then
          Force := 0;
        Pie(X - Size, Y - Size, X + Size, Y + Size, 0, 0, 0, 0);
      end;
  end;

  i := 0; j :=0;
  while i < Length(FParticles) do
  begin
    if FParticles[i].Force <> 0 then
    begin
      FParticles[j] := FParticles[i];
      Inc(j);
    end;
    Inc(i);
  end;
  SetLength(FParticles, j + 1);
end;

procedure TfrmMain.pbMainMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  L: Integer;
begin
  if X = 0 then X := 1;
  L := Length(FParticles);
  SetLength(FParticles, L + 1);
  FParticles[L].StartTime := GetTickCount;
  FParticles[L].Size := Random(5) + 5;
  FParticles[L].Angle := ArcTan((pbMain.Height - Y) / X);
  Caption := FloatToStr(FParticles[L].Angle / Pi * 180);
  FParticles[L].Force := Random(20) + 10;
  Invalidate;
end;

procedure TfrmMain.aeMainIdle(Sender: TObject; var Done: Boolean);
begin
  Invalidate;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
end;

end.
