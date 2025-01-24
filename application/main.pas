unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, second;

type

  { TFormMain }

  TFormMain = class(TForm)
    Button1: TButton;
    ButtonShowSecond: TButton;
    ButtonClose: TButton;
    ButtonAdd: TButton;
    ButtonClear: TButton;
    ButtonDelete: TButton;
    EditInput: TEdit;
    EditName: TEdit;
    Label1: TLabel;
    LabelName: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonShowSecondClick(Sender: TObject);
  private

  public

  end;

var
  FormMain: TFormMain;

implementation

{$R *.lfm}

{ TFormMain }

procedure TFormMain.Button1Click(Sender: TObject);
begin
  //ShowMessage('First GUI');
  LabelName.Caption := 'Hello ' + EditName.Text;
end;

procedure TFormMain.ButtonAddClick(Sender: TObject);
begin
  ListBox1.Items.Add(EditInput.Text);
end;

procedure TFormMain.ButtonClearClick(Sender: TObject);
begin
  ListBox1.Clear;
end;

procedure TFormMain.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.ButtonDeleteClick(Sender: TObject);
var
  index: Integer;
begin
  index := ListBox1.ItemIndex;
  if index <> -1 then
     ListBox1.Items.Delete(index);
end;

procedure TFormMain.ButtonShowSecondClick(Sender: TObject);
begin
  second.FormSecond.Show;
end;

end.

