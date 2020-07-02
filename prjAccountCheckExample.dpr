program prjAccountCheckExample;

uses
  Forms,
  Linkhub in 'Linkhub\Linkhub.pas',
  Popbill in 'Popbill\Popbill.pas',
  PopbillAccountCheck in 'PopbillAccountCheck\PopbillAccountCheck.pas',
  Example in 'Example.pas' {frmExample};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmExample, frmExample);
  Application.Run;
end.
