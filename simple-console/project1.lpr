program project1;

Uses SysUtils, Test, StudentUnit;

function Add(x: Integer; y: Integer): Integer;
var
  sum: Integer; // 局變變量
begin
  sum := x + y;
  Result := sum; // Result就是返回值
end;

procedure UpdateValue(var x: Integer; y: Integer);
begin
  x := y;
end;

procedure LoopExample;
var
  i: Integer;
  count: Integer;
  str: String;
begin
  WriteLn('LoopExample');
  str := '';
  count := 3;
  for i := 1 to count do // [1..3]
      str := str + IntToStr(i);

  Assert(str = '123', '');

  repeat
    str := str + IntToStr(count);
    count := count - 1;
  until count = 0;
  Assert(str = '321', '');

  count := 3;
  str := '';
  while count > 0 do
  begin
    str := str + IntToStr(count);
    count := count - 1;
  end;
  Assert(str = '321', '');
end;

procedure StringExample;
var
  str, res: String;
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

type TPersion = record
  Name: String;
  Age: Integer;
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
  name: String;
  line: String;
  res: String;
begin
  name := 'in.txt';
  res := '';
  if FileExists(name) then
     begin
       AssignFile(f, name);
       Reset(f);
       while not Eof(f) do
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

procedure ProcedureWithArgExample(i: Integer);
begin
  WriteLn('ProcedureWithArgExample: ', i);
end;

procedure OverloadExample();
var
  x, y: Integer;
  a, b: String;
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
  Assert(student.Age = 18, '');
  Assert(student.Name = 'Tom', '');
  student.Destroy;
end;

var
  x: Integer;
  c: Char;
  r: Double;
  str: String;
  arr: array[1..10] of Integer;
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

  ReadLn;
end.

