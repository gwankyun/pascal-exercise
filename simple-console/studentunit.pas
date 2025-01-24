unit StudentUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  TStudent = class
    private
      fAge: Integer;
      fName: String;
    public
      function Age: Integer;
      function Name: String;
      constructor Create(_name: String; _age: Integer);
      destructor Destroy; override;
  end;

implementation

constructor TStudent.Create(_name: String; _age: Integer);
begin
  fAge := _age;
  fName := _name;
end;

destructor TStudent.Destroy;
begin
  inherited Destroy;
end;

function TStudent.Age: Integer;
begin
  Result := age;
end;

function TStudent.Name: String;
begin
  Result := name;
end;

end.

