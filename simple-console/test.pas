unit Test;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}

interface

uses
  Classes, SysUtils, fgl;

function Add(x, y: Integer): Integer;

procedure SwapValue(var x, y: Integer); overload;
procedure SwapValue(var x, y: String); overload;
procedure MyClassExample;
procedure TListNodeExample;

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

  generic TListNode<T> = record
  type
    TSelf = specialize TListNode<T>;
    PSelf = ^TSelf;
  public
    Value: T;
    Prev: PSelf;
    Next: PSelf;
  end;

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

procedure TListNodeExample;
type
  TListNodeInt = specialize TListNode<Integer>;
var
  node1: ^TListNodeInt;
  node2: ^TListNodeInt;
  node3: ^TListNodeInt;
begin
  New(node1);
  New(node2);
  New(node3);

  node1^.Value := 1;
  node2^.Value := 2;
  node3^.Value := 3;

  node1^.Next := node2;
  node1^.Prev := Nil;

  node2^.Prev := node1;
  node2^.Next := node3;

  node3^.Prev := node2;
  node3^.Next := Nil;

  Assert(node1^.Next^.Value = 2, '');

  Dispose(node1);
  Dispose(node2);
  Dispose(node3);
end;

end.

