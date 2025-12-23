program project1;

uses
  SysUtils,
  Test,
  StudentUnit,
  fgl;

  function Add(x: integer; y: integer): integer;
  var
    sum: integer; // 局變變量
  begin
    sum := x + y;
    Result := sum; // Result就是返回值
  end;

  procedure UpdateValue(var x: integer; y: integer);
  begin
    x := y;
  end;

  procedure LoopExample;
  var
    i: integer;
    Count: integer;
    str: string;
  begin
    WriteLn('LoopExample');
    str := '';
    Count := 3;
    for i := 1 to Count do // [1..3]
      str := str + IntToStr(i);

    Assert(str = '123', '');

    repeat
      str := str + IntToStr(Count);
      Count := Count - 1;
    until Count = 0;
    Assert(str = '321', '');

    Count := 3;
    str := '';
    while Count > 0 do
    begin
      str := str + IntToStr(Count);
      Count := Count - 1;
    end;
    Assert(str = '321', '');
  end;

  procedure StringExample;
  var
    str, res: string;
  begin
    WriteLn('StringExample');

    // 拼接
    str := '12';
    res := str + '34';
    Assert(res = '1234', '');

    // 大小寫轉換
    Assert(UpperCase('ab') = 'AB', '');
    Assert(LowerCase('AB') = 'ab', '');

    // 查找
    str := '12345';
    Assert(Pos('3', str) = 3, '');
    Assert(Pos('6', str) = 0, ''); // 找不到

    // 複製
    res := Copy(str, 2, 3);
    Assert(res = '234', ''); // 位置 長度

    // 插入
    str := '12345';
    Insert('678', str, 2);
    Assert(str = '12678345', '');

    // 刪除
    str := '12345';
    Delete(str, 2, 2);
    Assert(str = '125', '');

    // 去除空格
    str := ' 12345 ';
    Assert(TrimLeft(str) = '12345 ', '');
    Assert(TrimRight(str) = ' 12345', '');
    Assert(Trim(str) = '12345', '');

    // 替换
    res := StringReplace('1 2 3', ' ', '-', [rfReplaceAll]);
    Assert(res = '1-2-3', '');
  end;

type
  TPersion = record
    Name: string;
    Age: integer;
  end;

  procedure RecordExample;
  var
    tom: TPersion;
  begin
    tom.Name := 'Tom';
    tom.Age := 18;
  end;

  procedure FileExample;
  var
    f: TextFile;
    Name: string;
    line: string;
    res: string;
  begin
    Name := 'in.txt';
    res := '';
    if FileExists(Name) then
    begin
      AssignFile(f, Name);
      Reset(f);
      while not EOF(f) do
      begin
        ReadLn(f, line);
        res := res + line;
      end;
      CloseFile(f);
      Assert(res = 'abc123efg');
    end
    else
      WriteLn('File does not exist');
  end;

  procedure ProcedureExample;
  begin
    WriteLn('ProcedureExample');
  end;

  procedure ProcedureWithArgExample(i: integer);
  begin
    WriteLn('ProcedureWithArgExample: ', i);
  end;

  procedure OverloadExample();
  var
    x, y: integer;
    a, b: string;
  begin
    WriteLn('OverloadExample');
    x := 1;
    y := 2;
    Test.SwapValue(x, y);
    Assert(x = 2, '');
    Assert(y = 1, '');

    a := 'a';
    b := 'b';
    Test.SwapValue(a, b);
    Assert(a = 'b', '');
    Assert(b = 'a', '');
  end;

  procedure ObjectExample;
  var
    student: TStudent;
  begin
    WriteLn('ObjectExample');
    student := TStudent.Create('Tom', 18);
    repeat
      Assert(student.Age = 18, '');
      Assert(student.Name = 'Tom', '');
    until True;
    student.Destroy;
  end;

  procedure RepeatExample;
  var
    i: integer;
  begin
    WriteLn('RepeatExample');
    i := 0;
    repeat
      WriteLn(i);
      i := i + 1;
      if i = 10 then
      begin
        Break;
      end;
    until False;
    WriteLn('RepeatExample');
  end;

  procedure ExceptionExample;
  var
    x: integer;
    y: integer;
    res: double;
  begin
    x := 1;
    y := 0;
    //try
    //  if y = 0 then
    //     raise Exception.Create('/ 0');
    //  res := x / y;
    //except on e: Exception do
    //begin
    //  WriteLn('Error: ' + e.Message);
    //end;
    //end;
  end;

  procedure TFPGListExample;
  type
    TListInt = specialize TFPGList<integer>;
  var
    list: TListInt;
  begin
    list := TListInt.Create;
    list.Add(1);
    list.Add(2);
    list.Add(3);
    Assert(list.Count = 3, '');
    list.Destroy;
  end;

  procedure MapExample;
  type
    TMap = specialize TFPGMap<string, integer>;
  var
    map: TMap;
    Value: integer;
  begin
    WriteLn('MapExample');
    map := TMap.Create;
    try
      map.Add('a', 1);
      map.Add('b', 2);
      map.Add('c', 3);
      Assert(map.Count = 3);
      if map.TryGetData('a', Value) then
        Assert(Value = 1);
      map.TryGetData('d', Value);
      Assert(Value = 1);
      map['b'] := 4;
      map.TryGetData('b', Value);
      Assert(Value = 4);
    finally
      map.Free;
    end;
  end;

  procedure PointerExample;
  var
    x, y: integer;
    p: ^integer;
    pEmpty: ^integer;
  begin
    x := 1;
    y := 0;
    p := @x;
    y := p^;
    Assert(y = 1, '');
    p^ := 2;
    Assert(x = 2, '');

    New(pEmpty); // 申請內存
    pEmpty^ := y;
    Assert(pEmpty^ = 1, '');
    Dispose(pEmpty); // 釋放內存
  end;

var
  x: integer;
  c: char;
  r: double;
  str: string;
  arr: array[1..10] of integer;
begin
  WriteLn('test');
  x := 5;
  WriteLn('x: ', x);
  c := 'M';
  r := 0.5;
  if r < 1 then
    WriteLn('r < 1');

  LoopExample;

  StringExample;

  arr[1] := 1;

  WriteLn('arr[1]: ', arr[1]);

  RecordExample;

  FileExample;

  ProcedureExample;
  ProcedureWithArgExample(9);

  Assert(Add(1, 2) = 3, '');

  x := 0;
  UpdateValue(x, 9);
  Assert(x = 9, '');

  Assert(Test.Add(1, 2) = 3, '');

  OverloadExample;

  ObjectExample;

  MyClassExample;

  ExceptionExample;

  RepeatExample;

  PointerExample;

  TFPGListExample;

  MapExample;

  Test.TListNodeExample;

  ReadLn;
end.
