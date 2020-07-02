program prjAccountCheckExample;

uses
  Forms,
  Linkhub in 'Linkhub\Linkhub.pas',
  Popbill in 'Popbill\Popbill.pas',
  PopbillAccountCheck in 'PopbillAccountCheck\PopbillAccountCheck.pas',  
  Example in 'Example.pas' {Form1};


{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
