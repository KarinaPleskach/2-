  unit Unit3;

  interface

  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, Math, ExtCtrls, jpeg;

  type
    TForm3 = class(TForm)
      btnEsc: TBitBtn;
    dlg3: TOpenDialog;
    btnOpenFile: TBitBtn;
    edtName: TEdit;
    btn2: TBitBtn;
    btn1: TBitBtn;
    btn4: TBitBtn;
    btn3: TBitBtn;
    imgright2: TImage;
    imgright1: TImage;
    imgleft1: TImage;
    imgleft2: TImage;
    img1: TImage;
    procedure btnOpenFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure btnEscClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
    Form3: TForm3;

  implementation

  uses Unit1, Unit2, Unit4;

  type
    mas = array [0..3, 0..3] of Char;

  var
    FName, InputLine, outputLine: string;
    InputFile, outputfile: Text;
    x: Char;
    matrics: mas;
    devisor, DopLetters, i: Integer;

  {$R *.dfm}

  procedure TForm3.btnOpenFileClick(Sender: TObject);
    begin
      if dlg3.Execute then
      begin
        inputline := '';
        FName := dlg3.FileName;
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

procedure TForm3.FormCreate(Sender: TObject);
var rgn : HRGN;
begin
  FName := '';
  InputLine := '';
    rgn := CreateRoundRectRgn(0,0,ClientWidth,ClientHeight,40,40);
  SetWindowRgn(Handle, rgn, True);
end;



procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;


procedure TForm3.btnEscClick(Sender: TObject);
begin
 Form3.Hide;
 FormStart.Show;
end;

procedure TForm3.FormShow(Sender: TObject);
var BMP: TBitmap;
begin
edtName.Text := '<---Select the source file';
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

procedure TForm3.btn1Click(Sender: TObject);
var
  letter, m, n: Integer;
procedure Matrica(const i: Integer; const j: Integer; var num: integer);
begin
  matrics[i, j] := InputLine[num];
  Inc(num);
end;
begin
  if (FName = '') then
    ShowMessage('Select the source file')
  else
  begin
    if (InputLine = '') then
      ShowMessage('Your file is empty, please, select anothe one')
    else
    begin
      DopLetters := Length(InputLine) mod 16;
      if (DopLetters <> 0) then
        DopLetters := 16 - DopLetters;
      for i := 1 to DopLetters do
      begin
        InputLine := InputLine + chr(RandomRange(97, 122));
      end;
      devisor := Length(InputLine) div 16;
      letter := 1;
      outputLine := '';
      for i := 1 to devisor do
      begin
        Matrica(0, 0, letter);
        Matrica(1, 3, letter);
        Matrica(2, 2, letter);
        Matrica(3, 1, letter);

        Matrica(0, 3, letter);
        Matrica(1, 0, letter);
        Matrica(2, 1, letter);
        Matrica(3, 2, letter);

        Matrica(0, 2, letter);
        Matrica(1, 1, letter);
        Matrica(2, 0, letter);
        Matrica(3, 3, letter);

        Matrica(0, 1, letter);
        Matrica(1, 2, letter);
        Matrica(2, 3, letter);
        Matrica(3, 0, letter);

        for m := 0 to 3 do
          for n := 0 to 3 do
            outputLine := outputLine + matrics[m, n];
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
    end;
  end;
end;


procedure TForm3.btn2Click(Sender: TObject);
var
  letter, m, n: Integer;
procedure Matrica(const i: Integer; const j: Integer);
begin
  outputLine := outputLine + matrics[i, j];
end;
begin
  if (FName = '') then
    ShowMessage('Select the source file')
  else
  begin
    if (InputLine = '') then
      ShowMessage('Your file is empty, please, select anothe one')
    else
    begin
      DopLetters := Length(InputLine) mod 16;
      if (DopLetters <> 0) then
        DopLetters := 16 - DopLetters;
      for i := 1 to DopLetters do
      begin
        InputLine := InputLine + chr(RandomRange(97, 122));
      end;
      devisor := Length(InputLine) div 16;
      letter := 1;
      outputLine := '';
      for i := 1 to devisor do
      begin
        for m := 0 to 3 do
          for n := 0 to 3 do
            begin
              matrics[m, n] := inputLine[letter];
              inc(letter);
            end;
        Matrica(0, 0);
        Matrica(1, 3);
        Matrica(2, 2);
        Matrica(3, 1);

        Matrica(0, 3);
        Matrica(1, 0);
        Matrica(2, 1);
        Matrica(3, 2);

        Matrica(0, 2);
        Matrica(1, 1);
        Matrica(2, 0);
        Matrica(3, 3);

        Matrica(0, 1);
        Matrica(1, 2);
        Matrica(2, 3);
        Matrica(3, 0);
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
    end;
  end;
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
form2.Show;
form3.Hide;
end;

procedure TForm3.btn4Click(Sender: TObject);
begin
form3.Hide;
Form4.Show;
end;

procedure TForm3.btn3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var BMP: TBitmap;
begin
 BMP:= TBitmap.Create;
 bmp.Width:= Imgleft1.Picture.Graphic.Width;
bmp.Height:= imgleft1.Picture.Graphic.Height;
bmp.Canvas.Draw (0, 0, imgleft1.Picture.Graphic);
Btn3.Glyph:= BMP;
end;

procedure TForm3.btn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var BMP: TBitmap;
begin
 BMP:= TBitmap.Create;
 bmp.Width:= Imgright1.Picture.Graphic.Width;
bmp.Height:= imgright1.Picture.Graphic.Height;
bmp.Canvas.Draw (0, 0, imgright1.Picture.Graphic);
Btn4.Glyph:= BMP;
end;

procedure TForm3.img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
btn1.Font.Color := $00400080;
btn2.Font.Color := $00400080;
end;

procedure TForm3.btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
btn1.Font.Color := $00400000;
end;

procedure TForm3.btn2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
btn2.Font.Color := $00400000;
end;

end.
