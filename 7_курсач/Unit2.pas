    unit Unit2;

    interface

    uses
      Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, Grids, ExtCtrls, StdCtrls, MMSystem;

    type
      TAdminNames = class(TForm)
        spl1: TSplitter;
    lblName: TLabel;
    lblKol: TLabel;
    btnAdd: TButton;
    btnChange: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    tablVibor: TStringGrid;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tablViborMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
      private
        { Private declarations }
      public
        { Public declarations }
      end;

    var
      AdminNames: TAdminNames;

    var ACol, ARow, indeks: Integer;

 



    implementation

    uses Unit1, Unit3, Unit5, Unit7, Unit6;
   
 

    {$R *.dfm}


    procedure TAdminNames.btnCloseClick(Sender: TObject);
      begin
        PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        AdminNames.Hide;
        Password.Show;
      end;

    procedure TAdminNames.btnAddClick(Sender: TObject);
      begin
        PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        FormName.Show;
        AdminNames.Hide;
      end;

    procedure TAdminNames.FormShow(Sender: TObject);
    var myRect: TGridRect;
    var i:Integer;
      begin
        btnClose.SetFocus;
        with AdminNames.tablVibor do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
        with myRect do
          begin
            Left := -1;
            Top := -1;
            Right := -1;
            Bottom := -1;
          end;
        with AdminNames.tablVibor do
          begin
            Selection := myRect;
            Cells[0,0] := ' Имя пользоателя';
          end;
        indeks := 0;
        CurrentUser := FirstUser;
        if CurrentUser^.Next = nil
        then
        begin
           AdminNames.tablVibor.RowCount := 2;
        end
        else
        begin
        while CurrentUser^.Next <> nil do
          begin
            CurrentUser := CurrentUser^.Next;
            inc(indeks);
            AdminNames.tablVibor.RowCount := indeks+1;
            AdminNames.tablVibor.Cells[0,indeks] := CurrentUser^.Element.Name;
          end;
        end;
        AdminNames.lblKol.Caption := IntToStr(indeks);
      end;

    procedure TAdminNames.tablViborMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      begin
        try
        tablVibor.MouseToCell(X, Y, ACol, ARow);//Получаем индексы ячейки ACol и ARow
        //Перемещаем фокус в ячейку с этими индексами:
        tablVibor.Col:=ACol;
        tablVibor.Row:=ARow;
        except
          end;
      end;

    procedure TAdminNames.btnDeleteClick(Sender: TObject);

      begin

        PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
        if (Arow < 1 )  or (lblKol.Caption = '0')
        then
        ShowMessage('Выберите пользователя.')
        else
        begin
        Vi.Show;
        AdminNames.Hide;
        end;
      end;

procedure TAdminNames.btnChangeClick(Sender: TObject);

begin

PlaySound('D:\учеба\ОАИП\лабы\4_процедурный тип\button.wav', 0, SND_ASYNC);
if (Arow < 1) or (lblKol.Caption = '0')
        then
        ShowMessage('Выберите пользователя.')
        else
        begin
        AdminNames.Hide;
        ViForm.Show;
        end;
end;


end.
