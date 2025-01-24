unit Test;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fgl;

function Add(x, y: Integer): Integer;

procedure SwapValue(var x, y: Integer); overload;
procedure SwapValue(var x, y: String); overload;
procedure MyClassExample;

implementation

function Add(x, y: Integer): Integer;
begin
  Result := x + y;
end;

type
  // 自定義類
  TMyClass = class(TObject)
    fld1 : String;
  end;

  // 泛型容器
  TMyList = specialize TFPGList<TMyClass>;

procedure MyClassExample;
type
  TIntList = specialize TFPGList<Integer>;
var
  myClass : TMyClass;
  myList : TMyList;
  intList : TIntList;
begin
  WriteLn('MyClassExample');
  myClass := TMyClass.Create;
  myClass.fld1 := 'myClass';
  myClass.Destroy;

  myList := TMyList.Create;
  myList.Add(myClass);
  Assert(myList.Count = 1, '');
  myList.Destroy;

  intList := TIntList.Create;
  intList.Add(1);
  intList.Add(2);
  intList.Add(3);
  Assert(intList.Items[1] = 1, '');
  Assert(intList.Count = 3, '');
  Assert(intList.Remove(2) = 2, '');
  Assert(intList.Count = 2, '');
  intList.Destroy;
end;

procedure SwapValue(var x, y: Integer); overload;
var
  temp: Integer;
begin
  temp := x;
  x := y;
  y := temp;
end;

procedure SwapValue(var x, y: String); overload;
var
  temp: String;
begin
  temp := x;
  x := y;
  y := temp;
end;

end.

