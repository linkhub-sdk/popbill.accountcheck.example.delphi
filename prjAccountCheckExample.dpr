program prjAccountCheckExample;

uses
  Forms,
  Linkhub in 'Linkhub\Linkhub.pas',
  Popbill in 'Popbill\Popbill.pas',
  Example in 'Example.pas' {Form1};

PopbillAccountCheck in 'PopbillAccountCheck\PopbillAccountCheck.pas',

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
