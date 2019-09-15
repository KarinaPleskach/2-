unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AppEvnts;

type
  TCellType = (ctEmpty, ctSnake, ctfood);

  PSnakeItem = ^TSnakeItem;
  TSnakeItem = record
    Row, Col: Integer;
    Next, Prev: PSnakeItem;
  end;

  TGameState = record
    Field: array of array of TCellType;
    SnakeHead: PSnakeItem;
    SnakeTail: PSnakeItem;
  end;

  TfrmMain = class(TForm)
    pbGame: TPaintBox;
    tmrTimer: TTimer;
    procedure pbGamePaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrTimerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    FGameState: TGameState;
    procedure NewGame;
    procedure EndGame;
    procedure Tick;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

const
  FieldWidth = 10;
  FieldHeight = 20;
  CellWidth = 30;
  CellHeight = 30;

var
  destination: 1..4;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.NewGame;
var
  Curr: PSnakeItem;
  var i, j: Integer;
begin
  destination := 1;
  with FGameState do
  begin
    SetLength(Field, FieldWidth, FieldHeight);
    New(Curr);
    Curr^.Row := FieldHeight - 1;
    Curr^.Col := 2;
    New(Curr^.Next);
    Curr^.Prev := nil;
    SnakeHead := Curr;
    Curr^.Next^.Prev := Curr;
    Field[2, FieldHeight - 1] := ctSnake;

    Curr := Curr^.Next;
    Curr^.Row := FieldHeight - 1;
    Curr^.Col := 1;
    New(Curr^.Next);
    Curr^.Next^.Prev := Curr;
    Field[1, FieldHeight - 1] := ctSnake;

    Curr := Curr^.Next;
    Curr^.Row := FieldHeight - 1;
    Curr^.Col := 0;
    Curr^.Next := nil;
    Field[0, FieldHeight - 1] := ctSnake;
    SnakeTail := Curr;
  end;
  while (true) do
  begin
    Randomize;
    i := Random(10);
    j := Random(20);
    if (FGameState.Field[i,j] = ctEmpty)
    then
      begin
        FGameState.Field[i,j] := ctFood;
        Break;
      end;
  end;
end;

procedure TfrmMain.EndGame;
var
  Curr: PSnakeItem;
begin
  with FGameState do
  begin
    Field := nil;
    while SnakeHead <> nil do
    begin
      Curr := SnakeHead^.Next;
      Dispose(SnakeHead);
      SnakeHead := Curr;
    end;
  end;
  showmessage('You lose');
end;

procedure TfrmMain.Tick;
var curr: PSnakeItem;
i, j, vscol, vsrow: Integer;
begin
  if (destination = 1)
  then
  begin
  with FGameState do
  begin
    if (Field[((SnakeHead^.Col + 1) mod FieldWidth),SnakeHead^.Row] = ctfood)
    then
    begin
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctSnake;
        vscol := (SnakeHead^.Col + 1) mod FieldWidth;
        vsrow := SnakeHead^.Row;
        Field[((SnakeHead^.Col + 1) mod FieldWidth),SnakeHead^.Row] := ctSnake;

        New(SnakeHead^.prev);
        SnakeHead^.Prev^.Next := SnakeHead;
        SnakeHead := SnakeHead^.Prev;
        SnakeHead^.Prev := nil;
        snakehead^.row := vsrow;
        snakehead^.col := vscol;

        while (true) do
        begin
          Randomize;
          i := Random(10);
          j := Random(20);
          if (FGameState.Field[i,j] = ctEmpty)
          then
            begin
              FGameState.Field[i,j] := ctFood;
              Break;
            end;
        end;
    end
    else
    begin
      if (Field[((SnakeHead^.Col + 1) mod FieldWidth),SnakeHead^.Row] = ctSnake)
      then
      begin
        EndGame;
      end
      else
      begin
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctEmpty;
        SnakeTail^.Row := SnakeHead^.Row;
        SnakeTail^.Col := (SnakeHead^.Col + 1) mod FieldWidth;
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctSnake;

        SnakeTail^.Next := SnakeHead;
        SnakeHead^.Prev := SnakeTail;
        SnakeTail^.Prev^.Next := nil;
        SnakeHead := SnakeTail;
        SnakeTail := SnakeTail^.Prev;
        SnakeHead^.Prev := nil;
      end;
    end;
  end;
  end;
  if (destination = 2)
  then
  begin
    vscol := fgamestate.snakehead^.Col;
    vsrow := (fgamestate.SnakeHead^.row - 1);
    if (vsrow = -1)
    then vsRow := 19;
  with FGameState do
  begin
    if (Field[vscol,vsRow] = ctfood)
    then
    begin
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctSnake;
        Field[vscol,vsRow] := ctSnake;

        New(SnakeHead^.prev);
        SnakeHead^.Prev^.Next := SnakeHead;
        SnakeHead := SnakeHead^.Prev;
        SnakeHead^.Prev := nil;
        snakehead^.row := vsrow;
        snakehead^.col := vscol;

        while (true) do
        begin
          Randomize;
          i := Random(10);
          j := Random(20);
          if (FGameState.Field[i,j] = ctEmpty)
          then
            begin
              FGameState.Field[i,j] := ctFood;
              Break;
            end;
        end;
    end
    else
    begin
      if (Field[vsCol,vsRow] = ctSnake)
      then
      begin
        EndGame;
      end
      else
      begin
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctEmpty;
        SnakeTail^.Col := snakehead^.Col;
        SnakeTail^.row := (SnakeHead^.row - 1);
        if (SnakeTail^.Row = -1)
        then SnakeTail^.Row := 19;
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctSnake;

        SnakeTail^.Next := SnakeHead;
        SnakeHead^.Prev := SnakeTail;
        SnakeTail^.Prev^.Next := nil;
        SnakeHead := SnakeTail;
        SnakeTail := SnakeTail^.Prev;
        SnakeHead^.Prev := nil;
      end;
    end;
  end;
  end;
  if (destination = 3)
  then
  begin
     vsrow := FGameState.snakeHead^.Row;
    vscol := (FGameState.SnakeHead^.Col - 1);
    if (vsCol = -1)
    then vsCol := 9;
  with FGameState do
  begin
    if (Field[vscol,vsRow] = ctfood)
    then
    begin
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctSnake;
        Field[vscol,vsRow] := ctSnake;

        New(SnakeHead^.prev);
        SnakeHead^.Prev^.Next := SnakeHead;
        SnakeHead := SnakeHead^.Prev;
        SnakeHead^.Prev := nil;
        snakehead^.row := vsrow;
        snakehead^.col := vscol;

        while (true) do
        begin
          Randomize;
          i := Random(10);
          j := Random(20);
          if (FGameState.Field[i,j] = ctEmpty)
          then
            begin
              FGameState.Field[i,j] := ctFood;
              Break;
            end;
        end;
    end
    else
    begin
      if (Field[vsCol,vsRow] = ctSnake)
      then
      begin
        EndGame;
      end
      else
      begin
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctEmpty;
        SnakeTail^.Row := snakeHead^.Row;
        SnakeTail^.Col := (SnakeHead^.Col - 1);
        if (SnakeTail^.Col = -1)
        then SnakeTail^.Col := 9;
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctSnake;

        SnakeTail^.Next := SnakeHead;
        SnakeHead^.Prev := SnakeTail;
        SnakeTail^.Prev^.Next := nil;
        SnakeHead := SnakeTail;
        SnakeTail := SnakeTail^.Prev;
        SnakeHead^.Prev := nil;
      end;
    end;
  end;

  end;
  if (destination = 4)
  then
  begin
  with FGameState do
  begin
    if (Field[snakehead^.Col,((SnakeHead^.Row + 1) mod FieldHeight)] = ctfood)
    then
    begin
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctSnake;
        vscol := SnakeHead^.Col;
        vsrow := (SnakeHead^.Row + 1) mod FieldHeight;
        Field[snakehead^.Col,((SnakeHead^.Row + 1) mod FieldHeight)] := ctSnake;

        New(SnakeHead^.prev);
        SnakeHead^.Prev^.Next := SnakeHead;
        SnakeHead := SnakeHead^.Prev;
        SnakeHead^.Prev := nil;
        snakehead^.row := vsrow;
        snakehead^.col := vscol;

        while (true) do
        begin
          Randomize;
          i := Random(10);
          j := Random(20);
          if (FGameState.Field[i,j] = ctEmpty)
          then
            begin
              FGameState.Field[i,j] := ctFood;
              Break;
            end;
        end;
    end
    else
    begin
      if (Field[snakehead^.Col,((SnakeHead^.Row + 1) mod FieldHeight)] = ctSnake)
      then
      begin
        EndGame;
      end
      else
      begin
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctEmpty;
        SnakeTail^.Col := snakehead^.Col;
        SnakeTail^.Row := (SnakeHead^.Row + 1) mod FieldHeight;
        Field[SnakeTail^.Col, SnakeTail^.Row] := ctSnake;

        SnakeTail^.Next := SnakeHead;
        SnakeHead^.Prev := SnakeTail;
        SnakeTail^.Prev^.Next := nil;
        SnakeHead := SnakeTail;
        SnakeTail := SnakeTail^.Prev;
        SnakeHead^.Prev := nil;
      end;
    end;
  end;
  end;
end;

procedure TfrmMain.pbGamePaint(Sender: TObject);
var
  i, j: Integer;
begin
  with pbGame.Canvas do
  begin
    Pen.Color := clMaroon;
    Pen.Width := 1;
    for i := 0 to FieldWidth - 1 do
    begin
      for j := 0 to FieldHeight - 1 do
      begin
        case FGameState.Field[i, j] of
          ctEmpty:
            Brush.Color := clCream;
          ctSnake:
            Brush.Color := clNavy;
          ctfood:
            Brush.Color := Random(676786);
        end;
        Rectangle(i * CellWidth, j * CellHeight, i * CellWidth + CellWidth, j * CellHeight + CellHeight);
      end;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pbGame.Width := FieldWidth * CellWidth;
  pbGame.Height := FieldHeight * CellHeight;
  ClientWidth := FieldWidth * CellWidth;
  ClientHeight := FieldHeight * CellHeight;
  NewGame;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  EndGame;
end;

procedure TfrmMain.tmrTimerTimer(Sender: TObject);
begin
  Tick;
  pbGame.Invalidate;
end;





procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
tmrTimer.Enabled := True;
  if (key = 39) and (destination <> 3)
  then
    begin

      destination := 1
    end;
  if (key = 37) and (destination <> 1)
  then
    begin

      destination := 3
    end;
  if (key = 38) and (destination <> 4)
  then
    begin

      destination := 2
    end;
  if (key = 40) and (destination <> 2)
  then
    begin

      destination := 4
    end;
end;

end.
