program project1;

var
  x: Integer;
  c: Char;
  r: Double;
  i: Integer;
  count: Integer;
  str: String;
begin
  WriteLn('test');
  x := 5;
  WriteLn('x: ', x);
  c := 'M';
  r := 0.5;
  if r < 1 then
     WriteLn('r < 1');
  Write('Count = ?');
  ReadLn(count);
  for i := 1 to count do // [1..3]
      WriteLn('i: ', i);

  repeat
    Write(count, ' ');
    count := count - 1;
  until count = 0;
  WriteLn('');

  Write('Count = ?');
  ReadLn(count);

  while count > 0 do
  begin
    Write(count, ' ');
    count := count - 1;
  end;

  Write('read str: ');
  ReadLn(str);
  WriteLn('str: ', str);

  ReadLn;
end.

