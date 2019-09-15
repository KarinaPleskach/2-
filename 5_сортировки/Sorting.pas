unit Sorting;

interface

const
  Size10 = 10;
  Size100 = 100;
  Size2000 = 2000;

type
  TArray = array[1..2000] of integer;
  TSortKind = procedure (var Arr:TArray; count:integer);
  TRezMatrix = array[1..9,1..6] of Integer;

var
  Compares, Swappes: integer;
  ResultMatrix: TRezMatrix;

function CreateRandomArray(count: integer): TArray;
function MakeSortedArray(Arr: Tarray; count: Integer): TArray;
function MakeObrSortedArray(Arr: Tarray; count: Integer): TArray;
procedure StraightSelection(var Arr: TArray; count: integer);
procedure ShellSort(var Arr: TArray; count: Integer);
procedure QuickSort(var Arr:TArray; count:integer);
procedure SortArray(sort: TSortKind; var Arr: TArray; arSize: integer);
procedure FillResultMatrix;

implementation

procedure SortArray(sort: TSortKind; var Arr: TArray; arSize: integer);
begin
  sort(Arr, arSize);
end;

function CreateRandomArray(count: integer): TArray;
var i: integer;
begin
  Randomize;
  for i := 1 to count do
  begin
    Result[i] := Random(5000);
  end;
end;

procedure Swap(var x, y: integer);
var temp: integer;
begin
  temp := x;
  x := y;
  y:= temp;
end;

function MakeSortedArray(Arr: Tarray; count: Integer): TArray;
var i, j, min: integer;
begin
  for i := 1 to (count-1) do
  begin
    min := i;
    for j := (i+1) to count do
    begin
      if Arr[j] < Arr[min] then
        min := j;
    end;
    if min <> i then
      Swap(Arr[min], Arr[i]);
  end;
  Result := Arr;
end;

function MakeObrSortedArray(Arr: Tarray; count: Integer): TArray;
var i, j, max: integer;
begin
  j := count;
  for i := 1 to count do
  begin
    Arr[i] := j;
    Dec(j);
  end;
  Result := Arr;
end;

procedure StraightSelection(var Arr: TArray; count: integer);
var i, j, x: integer;
begin
  Compares := 0;
  Swappes := 0;
  for i := 2 to count do
  begin
    x := arr[i];
    j := i-1;
    if X < arr[j] then
    begin
      while (1 <= j) and (X < arr[j]) do
      begin
        Inc(Compares);
        Inc(swappes);
        arr[j+1] := arr[j];
        j := j - 1;
      end;
    end
    else
      Inc(Swappes, 2);
    Inc(Compares);
    arr[j+1] := x;
  end;
end;

procedure ShellSort(var Arr: TArray; count: Integer);
var i, j, h: integer;
const step: array[1..5]of integer = (1,4,13,40,121);
//const step: array[1..6]of integer = (1,3,7,15,31,63);
begin
  Compares := 0;
  Swappes := 0;
  h := high(step);
  while h > 0 do
  begin
    for i := 1 to (count - step[h]) do
    begin
      j := i;
      Inc(Compares);
      if Arr[j] > Arr[j+step[h]] then
      begin
        while (j >= 1) and (Arr[j] > Arr[j+step[h]]) do
        begin
          Inc(Compares);
          Swap(Arr[j], Arr[j+step[h]]);
          Inc(Swappes);
          if j > step[h] then
            Dec(j, step[h])
          else j := 0;
        end;
      end
      else
        Inc(Swappes, 2);
    end;
    dec(h);
  end;
end;

procedure QuickSort(var Arr:TArray; count:integer);
  procedure QSort(L,R:integer);
  var
    i,j,x,y:integer;
  begin
    i:=L;
    j:=R;
    x:=arr[(L+R) div 2];
    repeat
      while arr[i]<x do
      begin
        Inc(i);
        Inc(Compares);
      end;
      while arr[j]>x do
      begin
        Dec(j);
        Inc(Compares);
      end;
      Inc(Compares, 2);
      if i<=j then
      begin
        Inc(Swappes);
        Swap(Arr[i], Arr[j]);
        Inc(i);
        Dec(j);
      end;
    until i>j;
    if j>L then QSort(L,J);
    if i<R then QSort(I,R);
  end;
var L, R: Integer;
begin
  Compares := 0;
  Swappes := 0;
  L := 1;
  R := count;
  QSort(L,R);
end;

procedure FillResultMatrix;
var
  size, i: integer;
  workArr, SortArr, ObrArr, RandArr: TArray;
  currSort: TSortKind;
begin
  size := Size10;
  RandArr := CreateRandomArray(size);
  SortArr := MakeSortedArray(RandArr, size);
  ObrArr := MakeObrSortedArray(RandArr, size);

  currSort := StraightSelection;
  workArr := RandArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[1,1] := Compares;
  ResultMatrix[1,2] := Swappes;
  workArr := SortArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[2,1] := Compares;
  ResultMatrix[2,2] := Swappes;
  workArr := ObrArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[3,1] := Compares;
  ResultMatrix[3,2] := Swappes;

  currSort := ShellSort;
  workArr := RandArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[1,3] := Compares;
  ResultMatrix[1,4] := Swappes;
  workArr := SortArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[2,3] := Compares;
  ResultMatrix[2,4] := Swappes;
  workArr := ObrArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[3,3] := Compares;
  ResultMatrix[3,4] := Swappes;

  currSort := QuickSort;
  workArr := RandArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[1,5] := Compares;
  ResultMatrix[1,6] := Swappes;
  workArr := SortArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[2,5] := Compares;
  ResultMatrix[2,6] := Swappes;
  workArr := ObrArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[3,5] := Compares;
  ResultMatrix[3,6] := Swappes;



  size := Size100;
  RandArr := CreateRandomArray(size);
  SortArr := MakeSortedArray(RandArr, size);
  ObrArr := MakeObrSortedArray(RandArr, size);

  currSort := StraightSelection;
  workArr := RandArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[4,1] := Compares;
  ResultMatrix[4,2] := Swappes;
  workArr := SortArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[5,1] := Compares;
  ResultMatrix[5,2] := Swappes;
  workArr := ObrArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[6,1] := Compares;
  ResultMatrix[6,2] := Swappes;

  currSort := ShellSort;
  workArr := RandArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[4,3] := Compares;
  ResultMatrix[4,4] := Swappes;
  workArr := SortArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[5,3] := Compares;
  ResultMatrix[5,4] := Swappes;
  workArr := ObrArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[6,3] := Compares;
  ResultMatrix[6,4] := Swappes;

  currSort := QuickSort;
  workArr := RandArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[4,5] := Compares;
  ResultMatrix[4,6] := Swappes;
  workArr := SortArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[5,5] := Compares;
  ResultMatrix[5,6] := Swappes;
  workArr := ObrArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[6,5] := Compares;
  ResultMatrix[6,6] := Swappes;



  size := Size2000;
  RandArr := CreateRandomArray(size);
  SortArr := MakeSortedArray(RandArr, size);
  ObrArr := MakeObrSortedArray(RandArr, size);

  currSort := StraightSelection;
  workArr := RandArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[7,1] := Compares;
  ResultMatrix[7,2] := Swappes;
  workArr := SortArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[8,1] := Compares;
  ResultMatrix[8,2] := Swappes;
  workArr := ObrArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[9,1] := Compares;
  ResultMatrix[9,2] := Swappes;

  currSort := ShellSort;
  workArr := RandArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[7,3] := Compares;
  ResultMatrix[7,4] := Swappes;
  workArr := SortArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[8,3] := Compares;
  ResultMatrix[8,4] := Swappes;
  workArr := ObrArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[9,3] := Compares;
  ResultMatrix[9,4] := Swappes;

  currSort := QuickSort;
  workArr := RandArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[7,5] := Compares;
  ResultMatrix[7,6] := Swappes;
  workArr := SortArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[8,5] := Compares;
  ResultMatrix[8,6] := Swappes;
  workArr := ObrArr;
  SortArray(currSort, workArr, size);
  ResultMatrix[9,5] := Compares;
  ResultMatrix[9,6] := Swappes;
end;


end.
