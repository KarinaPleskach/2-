unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, math, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
    btnEsc: TBitBtn;
    btnOpenFile: TBitBtn;
    edtName: TEdit;
    btnKey: TButton;
    edtKey: TEdit;
    dlgOpendlg4: TOpenDialog;
    ud1: TUpDown;
    img1: TImage;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    imgleft1: TImage;
    imgleft2: TImage;
    imgright1: TImage;
    imgright2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOpenFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEscClick(Sender: TObject);
    procedure btnKeyClick(Sender: TObject);
    procedure btnEnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

    procedure btn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3, Unit4;

var
  FName, InputLine, OutputLine, keyline: string;
  InputFile, OutputFile: Text;
  x: Char;
  key: Integer;

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm2.btnOpenFileClick(Sender: TObject);
begin
if dlgOpendlg4.Execute then
      begin
        inputline := '';
        FName := dlgOpendlg4.FileName;
        edtName.Text := FName;
        AssignFile(InputFile, FName);
        Reset(InputFile);
        while (not Eof(InputFile)) do
        begin
          Read(InputFile, x);
          if ((x = Chr(26)) or (x = Chr(13)) or (x = Chr(10))) then
            Continue;
          if not(x in ['A'..'Z','a'..'z']) then
            Continue;
          if (x in ['A'..'Z']) then
            x := Chr(Ord(x)+32);
          InputLine := InputLine + x;
        end;
        CloseFile(InputFile);
      end;
end;

procedure TForm2.FormCreate(Sender: TObject);
var rgn: HRGN;
begin
FName := '';
InputLine := '';
ud1.Associate := edtKey;
DoubleBuffered := True;
  rgn := CreateRoundRectRgn(0,0,ClientWidth,ClientHeight,40,40);
  SetWindowRgn(Handle, rgn, True);
end;

procedure TForm2.btnEscClick(Sender: TObject);
begin
form2.Hide;
FormStart.Show;
end;

procedure TForm2.btnKeyClick(Sender: TObject);
begin
ud1.Position := RandomRange(2, 6);
end;

procedure TForm2.btnEnClick(Sender: TObject);
var
  i, j, letter, dop, lowest, highest:Integer;
begin
if (FName = '') then
    ShowMessage('Select the source file')
  else
  begin
    if (InputLine = '') then
      ShowMessage('Your file is empty, please, select anothe one')
    else
    begin
        key := ud1.Position;
        if (key >= Length(InputLine)) then
          ShowMessage('Please, generate a smaller private key')
        else
        begin
          OutputLine := InputLine[1];
          letter := 1;
          dop := 0;
          lowest := 0;
          highest := 2;
          for i := 3 to key do
          begin
            inc(dop);
            lowest := lowest + 2;
          end;
          letter := letter + key + dop;
          while (letter <= Length(inputline)) do
          begin
            OutputLine := OutputLine + InputLine[letter];
            letter := letter + key + dop;
          end;
          for i := 2 to (key - 1) do
          begin
            letter := i;
            OutputLine := OutputLine + InputLine[letter];
            letter := letter + lowest;
            while (letter <= Length(InputLine)) do
            begin
              OutputLine := OutputLine + InputLine[letter];
              letter := letter + highest;
              if (letter > Length(InputLine)) then
                Break;
              OutputLine := OutputLine + InputLine[letter];
              letter := letter + lowest;
            end;
            lowest := lowest - 2;
            highest := highest + 2;
          end;
          OutputLine := OutputLine + InputLine[key];
          letter := key + key + dop;
          while (letter <= Length(inputline)) do
          begin
            OutputLine := OutputLine + InputLine[letter];
            letter := letter + key + dop;
          end;
          Insert('_cipher', FName, (Length(FName)-3));
          AssignFile(outputfile, FName);
          Rewrite(outputfile);
          for i := 1 to Length(outputLine) do
            Write(Outputfile, outputline[i]);
          CloseFile(outputfile);
          ShowMessage('Your ciphertext is written to a file: ' + FName);
          FName := '';
          InputLine := '';
          edtName.Text := '<---Select the source file';
          ud1.position := 2;
        end;
    end;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
var i, j: Integer;
BMP: TBitmap;
begin
  edtName.Text := '<---Select the source file';
  ud1.position := 2;
 BMP:= TBitmap.Create;
 bmp.Width:= Imgleft2.Picture.Graphic.Width;
bmp.Height:= imgleft2.Picture.Graphic.Height;
bmp.Canvas.Draw (0, 0, imgleft2.Picture.Graphic);
Btn3.Glyph:= BMP;
 BMP:= TBitmap.Create;
 bmp.Width:= Imgright2.Picture.Graphic.Width;
bmp.Height:= imgright2.Picture.Graphic.Height;
bmp.Canvas.Draw (0, 0, imgright2.Picture.Graphic);
Btn4.Glyph:= BMP;
end;



procedure TForm2.btn1Click(Sender: TObject);
var
  i, j, letter, dop, lowest, highest:Integer;
begin
if (FName = '') then
    ShowMessage('Select the source file')
  else
  begin
    if ((InputLine = '') or (Length(InputLine) = 1)) then
      ShowMessage('Your file is empty, please, select anothe one')
    else
    begin
        key := ud1.Position;
        if (key >= Length(InputLine)) then
          ShowMessage('Please, generate a smaller private key')
        else
        begin
          OutputLine := InputLine[1];
          letter := 1;
          dop := 0;
          lowest := 0;
          highest := 2;
          for i := 3 to key do
          begin
            inc(dop);
            lowest := lowest + 2;
          end;
          letter := letter + key + dop;
          while (letter <= Length(inputline)) do
          begin
            OutputLine := OutputLine + InputLine[letter];
            letter := letter + key + dop;
          end;
          for i := 2 to (key - 1) do
          begin
            letter := i;
            OutputLine := OutputLine + InputLine[letter];
            letter := letter + lowest;
            while (letter <= Length(InputLine)) do
            begin
              OutputLine := OutputLine + InputLine[letter];
              letter := letter + highest;
              if (letter > Length(InputLine)) then
                Break;
              OutputLine := OutputLine + InputLine[letter];
              letter := letter + lowest;
            end;
            lowest := lowest - 2;
            highest := highest + 2;
          end;
          OutputLine := OutputLine + InputLine[key];
          letter := key + key + dop;
          while (letter <= Length(inputline)) do
          begin
            OutputLine := OutputLine + InputLine[letter];
            letter := letter + key + dop;
          end;
          Insert('_cipher', FName, (Length(FName)-3));
          AssignFile(outputfile, FName);
          Rewrite(outputfile);
          for i := 1 to Length(outputLine) do
            Write(Outputfile, outputline[i]);
          CloseFile(outputfile);
          ShowMessage('Your ciphertext is written to a file: ' + FName);
          FName := '';
          InputLine := '';
          edtName.Text := '<---Select the source file';
          ud1.position := 2;
        end;
    end;
  end;
end;


procedure TForm2.btn2Click(Sender: TObject);
var
  i, j, letter, dop, lowest, highest, a:Integer;
begin
if (FName = '') then
    ShowMessage('Select the source file')
  else
  begin
    if ((InputLine = '') or (Length(InputLine) = 1)) then
      ShowMessage('Your file is empty, please, select anothe one')
    else
    begin
        key := ud1.Position;
        if (key >= Length(InputLine)) then
          ShowMessage('Please, generate a smaller private key')
        else
        begin
          dop := 0;
          lowest := 0;
          highest := 2;
          for i := 3 to key do
          begin
            inc(dop);
            lowest := lowest + 2;
          end;
          OutputLine := '';
          for i := 1 to Length(InputLine) do
            OutputLine := OutputLine + ' ';
          letter := 1;
          OutputLine[letter] := inputline[letter];
          letter := letter + key + dop;
          a := 1;
          while (letter <= Length(InputLine)) do
          begin
            Inc(a);
            OutputLine[letter] := inputline[a];
            letter := letter + key + dop;
          end;
          for i := 2 to (key - 1) do
          begin
            letter := i;
            Inc(a);
            OutputLine[letter] := inputline[a];
            letter := letter + lowest;
            while (letter <= Length(InputLine)) do
            begin
              Inc(a);
              OutputLine[letter] := InputLine[a];
              letter := letter + highest;
              if (letter > Length(InputLine)) then
                Break;
              Inc(a);
              OutputLine[letter] := InputLine[a];
              letter := letter + lowest;
            end;
            lowest := lowest - 2;
            highest := highest + 2;
          end;
          inc(a);
          outputline[key] := inputline[a];
          letter := key + key + dop;
          while (letter <= Length(inputline)) do
          begin
            inc(a);
            OutputLine[letter] := InputLine[a];
            letter := letter + key + dop;
          end;
          i := Pos('_cipher', FName);
          if (i = 0) then
            Insert('_decipher', FName, (Length(FName)-3))
          else
            insert('de', FName, (Length(FName)-9));
          AssignFile(outputfile, FName);
          Rewrite(outputfile);
          for i := 1 to Length(outputLine) do
            Write(Outputfile, outputline[i]);
          CloseFile(outputfile);
          ShowMessage('Your plaintext is written to a file: ' + FName);
          FName := '';
          InputLine := '';
          edtName.Text := '<---Select the source file';
          ud1.position := 2;
        end;
    end;
  end;
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
form4.Show;
form2.Hide;
end;

procedure TForm2.btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
btn1.Font.Color := $00400000;
end;

procedure TForm2.btn2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
btn2.Font.Color := $00400000;
end;

procedure TForm2.img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);


begin
btn1.Font.Color := $00400080;
btn2.Font.Color := $00400080;

end;


procedure TForm2.btn3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var BMP: TBitmap;
begin
 BMP:= TBitmap.Create;
 bmp.Width:= Imgleft1.Picture.Graphic.Width;
bmp.Height:= imgleft1.Picture.Graphic.Height;
bmp.Canvas.Draw (0, 0, imgleft1.Picture.Graphic);
Btn3.Glyph:= BMP;
end;

procedure TForm2.btn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var BMP: TBitmap;
begin
 BMP:= TBitmap.Create;
 bmp.Width:= Imgright1.Picture.Graphic.Width;
bmp.Height:= imgright1.Picture.Graphic.Height;
bmp.Canvas.Draw (0, 0, imgright1.Picture.Graphic);
Btn4.Glyph:= BMP;
end;

procedure TForm2.btn4Click(Sender: TObject);
begin
Form2.Hide;
form3.Show;
end;

end.
