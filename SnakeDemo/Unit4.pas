unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Math, ExtCtrls, jpeg;

type
  TForm4 = class(TForm)
    btnEsc: TBitBtn;
    btnOpenFile: TBitBtn;
    edtName: TEdit;
    dlg4: TOpenDialog;
    btnKey: TButton;
    edtKey: TEdit;
    btn4: TBitBtn;
    btn3: TBitBtn;
    imgright2: TImage;
    imgright1: TImage;
    imgleft1: TImage;
    imgleft2: TImage;
    btn2: TBitBtn;
    btn1: TBitBtn;
    img1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEscClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOpenFileClick(Sender: TObject);

    procedure btnKeyClick(Sender: TObject);

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
  Form4: TForm4;

implementation

uses Unit1, Unit2, unit3;

var
  FName, InputLine, OutputLine, keyline, key: string;
  InputFile, OutputFile: Text;
  x: Char;
  russianletters: array[0..32] of Char = ('à', 'á', 'â', 'ã', 'ä', 'å', '¸', 'æ', 'ç', 'è', 'é', 'ê', 'ë', 'ì', 'í', 'î', 'ï', 'ð', 'ñ', 'ò', 'ó', 'ô', 'õ', 'ö', '÷', 'ø', 'ù', 'ú', 'û', 'ü', 'ý', 'þ', 'ÿ');
{$R *.dfm}


procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm4.btnEscClick(Sender: TObject);
begin
Form4.Hide;
FormStart.Show;
end;

procedure TForm4.FormCreate(Sender: TObject);
var rgn:HRGN;
begin
FName := '';
InputLine := '';
  rgn := CreateRoundRectRgn(0,0,ClientWidth,ClientHeight,40,40);
  SetWindowRgn(Handle, rgn, True);
end;

procedure TForm4.btnOpenFileClick(Sender: TObject);
begin
  if dlg4.Execute then
      begin
        inputline := '';
        FName := dlg4.FileName;
        edtName.Text := FName;
        AssignFile(InputFile, FName);
        Reset(InputFile);
        while (not Eof(InputFile)) do
        begin
          Read(InputFile, x);
          if ((x = Chr(26)) or (x = Chr(13)) or (x = Chr(10))) then
            Continue;
          if not(x in ['À'..'ß','à'..'ÿ','¸' ,'¨']) then
            Continue;
          if (x in ['À'..'ß', '¨']) then
            if (x = '¨') then
              x := '¸'
            else
              x := Chr(ord(x)+32);
          InputLine := InputLine + x;
        end;
        CloseFile(InputFile);
      end;
end;


procedure TForm4.btnKeyClick(Sender: TObject);
var i, n:Integer;
begin
  n := RandomRange(2, 8);
  edtKey.Text := '';
  for i := 0 to n do
  edtKey.Text := edtKey.Text + chr(RandomRange(224, 255));
end;


procedure TForm4.FormShow(Sender: TObject);
var BMP: TBitmap;
begin
edtName.Text := '<---Select the source file';
          edtKey.text:= '';
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

procedure TForm4.btn1Click(Sender: TObject);
var
  i, N, kodfr, kodkl, m:Integer;
begin
if (FName = '') then
    ShowMessage('Select the source file')
  else
  begin
    if (InputLine = '') then
      ShowMessage('Your file is empty, please, select anothe one')
    else
    begin
      keyline := edtKey.Text;
        key := '';
        for i := 1 to Length(keyline) do
        begin
          if (keyline[i] in ['À'..'ß','à'..'ÿ','¸' ,'¨']) then
          begin
            if (keyline[i] in ['À'..'ß', '¨']) then
            if (keyline[i] = '¨') then
              keyline[i] := '¸'
            else
              keyline[i] := Chr(ord(Keyline[i])+32);
            key := key + keyline[i];
          end;
        end;
        if (key = '') then
          begin
            ShowMessage('Please, generate a keyword');
            edtKey.Text := '';
          end
        else
        begin
        if (Length(InputLine) < Length(key)) then
          delete(key, Length(InputLine), 255);
        if (Length(InputLine) > Length(key)) then
          begin
            N := Length(InputLine) - Length(key);
            for i := 1 to N do
            begin
              if key[i] = '¸' then
                key := key + 'æ'
              else
                if key[i] = 'ÿ' then
                  key := key + 'à'
                  else
                    if key[i] = 'å' then
                      key := key + '¸'
                      else
                    key := key + succ(Key[i]);
            end;
          end;
          OutputLine := '';
          for i := 1 to Length(InputLine) do
          begin
            for m := 0 to 32 do
            begin
              if russianletters[m] = InputLine[i] then
                begin
                  kodfr := m;
                  Break;
                end;
            end;
            for m := 0 to 32 do
            begin
              if russianletters[m] = key[i] then
                begin
                  kodkl := m;
                  Break;
                end;
            end;
            OutputLine := OutputLine + russianletters[(kodfr + kodkl) mod 33];
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
          edtKey.Text := '';
        end;
    end;
  end;
end;

procedure TForm4.btn2Click(Sender: TObject);
var
  i, N, kodfr, kodkl, m:Integer;
begin
if (FName = '') then
    ShowMessage('Select the source file')
  else
  begin
    if (InputLine = '') then
      ShowMessage('Your file is empty, please, select anothe one')
    else
    begin
      keyline := edtKey.Text;
        key := '';
        for i := 1 to Length(keyline) do
        begin
          if (keyline[i] in ['À'..'ß','à'..'ÿ','¸' ,'¨']) then
          begin
            if (keyline[i] in ['À'..'ß', '¨']) then
            if (keyline[i] = '¨') then
              keyline[i] := '¸'
            else
              keyline[i] := Chr(ord(Keyline[i])+32);
            key := key + keyline[i];
          end;
        end;
        if (key = '') then
          begin
            ShowMessage('Please, generate a keyword');
            edtKey.Text := '';
          end
        else
        begin
        if (Length(InputLine) < Length(key)) then
          delete(key, Length(InputLine), 255);
        if (Length(InputLine) > Length(key)) then
          begin
            N := Length(InputLine) - Length(key);
            for i := 1 to N do
            begin
              if key[i] = '¸' then
                key := key + 'æ'
              else
                if key[i] = 'ÿ' then
                  key := key + 'à'
                  else
                    if key[i] = 'å' then
                      key := key + '¸'
                      else
                    key := key + succ(Key[i]);
            end;
          end;
          OutputLine := '';
          for i := 1 to Length(InputLine) do
          begin
            for m := 0 to 32 do
            begin
              if russianletters[m] = InputLine[i] then
                begin
                  kodfr := m;
                  Break;
                end;
            end;
            for m := 0 to 32 do
            begin
              if russianletters[m] = key[i] then
                begin
                  kodkl := m;
                  Break;
                end;
            end;
            OutputLine := OutputLine + russianletters[(kodfr - kodkl + 33) mod 33];
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
          edtKey.Text := '';
        end;
    end;
  end;
end;

procedure TForm4.btn3Click(Sender: TObject);
begin
form4.Hide;
form3.Show;
end;

procedure TForm4.btn4Click(Sender: TObject);
begin
Form4.Hide;
form2.Show;
end;

procedure TForm4.btn3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var BMP: TBitmap;
begin
 BMP:= TBitmap.Create;
 bmp.Width:= Imgleft1.Picture.Graphic.Width;
bmp.Height:= imgleft1.Picture.Graphic.Height;
bmp.Canvas.Draw (0, 0, imgleft1.Picture.Graphic);
Btn3.Glyph:= BMP;
end;

procedure TForm4.btn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var BMP: TBitmap;
begin
 BMP:= TBitmap.Create;
 bmp.Width:= Imgright1.Picture.Graphic.Width;
bmp.Height:= imgright1.Picture.Graphic.Height;
bmp.Canvas.Draw (0, 0, imgright1.Picture.Graphic);
Btn4.Glyph:= BMP;
end;

procedure TForm4.img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  btn1.Font.Color := $00400080;
btn2.Font.Color := $00400080;
end;

procedure TForm4.btn1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
btn1.Font.Color := $00400000;
end;

procedure TForm4.btn2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
btn2.Font.Color := $00400000;
end;

end.
