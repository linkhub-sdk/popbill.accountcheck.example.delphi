{******************************************************************************}
{ �˺� ��������ȸ API Delphi SDK Example
{
{ - ������Ʈ ���� : 2021-06-15
{ - ���� ������� ����ó : 1600-9854 / 070-4304-2991
{ - ���� ������� �̸��� : code@linkhub.co.kr
{
{ <�׽�Ʈ �������� �غ����>
{ (1) 32, 35�� ���ο� ����� ��ũ���̵�(LinkID)�� ���Ű(SecretKey)��
{    ��ũ��� ���Խ� ���Ϸ� �߱޹��� ���������� ����
{ (2) �˺� ���߿� ����Ʈ(test.popbill.com)�� ����ȸ������ ����
{
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Popbill, PopbillAccountCheck;

const
        {**********************************************************************}
        { - ��������(��ũ���̵�, ���Ű)�� ��Ʈ���� ����ȸ���� �ĺ��ϴ�        }
        {   ������ ���ǹǷ� ������� �ʵ��� �����Ͻñ� �ٶ��ϴ�              }
        { - ����� ��ȯ���Ŀ��� ���������� ������� �ʽ��ϴ�.                  }
        {**********************************************************************}

         //��ũ���̵�.
        LinkID = 'TESTER';

        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TfrmExample = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    btnGetBalance: TButton;
    btnGetChargeURL: TButton;
    GroupBox9: TGroupBox;
    btnGetPartnerPoint: TButton;
    btnGetPartnerURL_CHRG: TButton;
    GroupBox4: TGroupBox;
    btnRegistContact: TButton;
    btnListContact: TButton;
    btnUpdateContact: TButton;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    btnGetChargeInfo: TButton;
    GroupBox1: TGroupBox;
    btnCheckID: TButton;
    btnGetUnitCost: TButton;
    txtCorpNum: TEdit;
    txtUserID: TEdit;
    btnJoinMember: TButton;
    btnCheckIsMember: TButton;
    btnGetAccessURL: TButton;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    txtBankCode: TEdit;
    btnCheckAccountInfo: TButton;
    GroupBox6: TGroupBox;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    Label4: TLabel;
    txtAccountNumber: TEdit;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCheckAccountInfoClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnGetPartnerPointClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExample: TfrmExample;
  accountCheckService : TAccountCheckService;
implementation

{$R *.DFM}

procedure TfrmExample.FormCreate(Sender: TObject);
begin

        //��������ȸ ��� �ʱ�ȭ.
        accountCheckService := TAccountCheckService.Create(LinkID,SecretKey);

        //����ȯ�� ������, true(���߿�), false(�����)
        accountCheckService.IsTest := true;

        //Exception ó�� ������, true(�⺻��)
        accountCheckService.IsThrowException := true;

        //������ū IP���ѱ�� ��뿩��, true(����)
        accountCheckService.IPRestrictOnOff := true;
end;

function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;


procedure TfrmExample.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        accountCheckService.Free;
        Action := caFree;
end;

procedure TfrmExample.btnCheckAccountInfoClick(Sender: TObject);
var
        accountInfo : TAccountCheckInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 1���� ���¿� ���� �����ָ��� ��ȸ�մϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#CheckAccountInfo
        {**********************************************************************}

        try
                accountInfo := accountCheckService.CheckAccountInfo(txtCorpNum.text, txtBankCode.text, txtAccountNumber.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(accountCheckService.LastErrCode) + ' | ' +  accountCheckService.LastErrMessage);
        end
        else
        begin
                tmp := 'bankCode (����ڵ�) : '+ accountInfo.bankCode + #13;
                tmp := tmp + 'accountNumber (���¹�ȣ) : '+ accountInfo.accountNumber + #13;
                tmp := tmp + 'accountName (������ ����) : '+ accountInfo.accountName + #13;
                tmp := tmp + 'checkDate (Ȯ���Ͻ�) : '+ FloatToStr(accountInfo.checkDate) + #13;
                tmp := tmp + 'resultCode (�����ڵ�) : '+ accountInfo.resultCode + #13;
                tmp := tmp + 'resultMessage (����޽���) : '+ accountInfo.resultMessage + #13#13;

                accountInfo.Free;
                ShowMessage(tmp);
        end;
end;


procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { ��Ʈ���� ����ȸ������ ȸ�������� ��û�մϴ�.
        { - ���̵� �ߺ�Ȯ���� btnCheckIDClick ���ν����� �����Ͻñ� �ٶ��ϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#JoinMember
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ '-' ����, 10�ڸ�
        joinInfo.CorpNum := '1234567890';

        // ��ǥ�ڼ���, �ִ� 100��
        joinInfo.CEOName := '��ǥ�ڼ���';

        // ��ȣ��, �ִ� 200��
        joinInfo.CorpName := '��ũ���';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 100��
        joinInfo.BizType := '����';

        // ����, �ִ� 100��
        joinInfo.BizClass := '����';

        // ���̵�, 6���̻� 50�� �̸�
        joinInfo.ID     := 'userid';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // ����ڸ�, �ִ� 100��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� �޴�����ȣ, �ִ� 20��
        joinInfo.ContactHP := '010-000-1111';

        // ����� �ѽ���ȣ, �ִ� 20��
        joinInfo.ContactFAX := '02-6442-9700';

        // ����� ����, �ִ� 100��
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := accountCheckService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ��Ʈ���� ����ȸ������ ���Ե� ����ڹ�ȣ���� Ȯ���մϴ�.
        { - LinkID�� ��Ʈ�ʸ� �ĺ��ϴ� ��������(32������)�� �����Ǿ� �ֽ��ϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#CheckIsMember
        {**********************************************************************}

        try
                response := accountCheckService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ȸ������(JoinMember API)�� ȣ���ϱ� �� ���̵� �ߺ��� Ȯ���մϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#CheckID
        {**********************************************************************}
        
        try
                response := accountCheckService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - ���ݹ���� ���������� �ƴ� ��Ʈ�ʰ����� ��� ��Ʈ�� �ܿ�����Ʈ
        {   Ȯ��(GetPartnerBalance API) ��� �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/accountcheck/delphi/api#GetBalance
        {**********************************************************************}
        
        try
                balance := accountCheckService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { �����ּ��� ��ȸ�ܰ��� Ȯ���մϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetUnitCost
        {**********************************************************************}

        try
                unitcost := accountCheckService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'����޽��� : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('��ȸ�ܰ� : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { �˺�(www.popbill.com)�� �α��ε� �˾� URL�� ��ȯ�մϴ�.
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#getAccessURL
        {**********************************************************************}

        try
                resultURL := accountCheckService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL : ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#getChargeURL
        {**********************************************************************}
        
        try
                resultURL := accountCheckService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL : ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPartnerPointClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ��Ʈ�ʰ����� �ƴ�
        { - ���������� ��� ����ȸ�� �ܿ�����Ʈ Ȯ��(GetBalance API)��
        {   �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/accountcheck/delphi/api#GetPartnerBalance
        {**********************************************************************}
        
        try
                balance := accountCheckService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { ����ȸ���� ����ڸ� �űԷ� ����մϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'testkorea';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        joinInfo.hp := '010-1111-2222';

        // �ѽ���ȣ (�ִ� 20��)
        joinInfo.fax := '02-6442-9700';

        // [�ʼ�] �̸��� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ����� ��ȸ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        joinInfo.searchRole := '3';

        try
                response := accountCheckService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ����� Ȯ���մϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#ListContact
        {**********************************************************************}

        try
                InfoList := accountCheckService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'id(���̵�) | email(�̸���) | hp(�޴���) | personName(����) | searchRole(����� ��ȸ ����) | ';
        tmp := tmp + 'tel(����ó) | fax(�ѽ�) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + InfoList[i].searchRole + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + ' | ';
            tmp := tmp + IntToStr(InfoList[i].state) + #13;
        end;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin

        {**********************************************************************}
        { ����ȸ���� ����� ������ �����մϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        contactInfo.hp := '010-4324-1111';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // �ѽ���ȣ (�ִ� 20��)
        contactInfo.fax := '02-6442-9799';

        // ����� ��ȸ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        contactInfo.searchRole := '3';


        try
                response := accountCheckService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := accountCheckService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (��ȣ) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (��ǥ�ڼ���) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 100��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 200��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 100��
        corpInfo.bizType := '����';

        // ����, �ִ� 100��
        corpInfo.bizClass := '����';

        // �ּ�, �ִ� 300��
        corpInfo.addr := '����Ư���� ������ ������� 517';

        try
                response := accountCheckService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TAccountCheckChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { ��������ȸ API ���� ���������� Ȯ���մϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := accountCheckService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'����޽��� : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ��Ʈ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#getPartnerURL
        {**********************************************************************}
        
        try
                resultURL := accountCheckService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL : ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ �������� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := accountCheckService.getPaymentURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ��볻�� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := accountCheckService.getUseHistoryURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);

end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� ����� ������ Ȯ���Ѵ�.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := accountCheckService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'����޽��� : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (���̵�) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (����� ����) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (����� ����ó(��ȭ��ȣ)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'hp (����� �޴�����ȣ) : ' + contactInfo.hp + #13;
                tmp := tmp + 'fax (����� �ѽ���ȣ) : ' + contactInfo.fax + #13;
                tmp := tmp + 'email (����� �̸���) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (��� �Ͻ�) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (����� ��ȸ����) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (������ ����) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (��������) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.
