{******************************************************************************}
{ 팝빌 예금주조회 API Delphi SDK Example
{
{ - 업데이트 일자 : 2021-01-13
{ - 연동 기술지원 연락처 : 1600-9854
{ - 연동 기술지원 이메일 : code@linkhubcorp.com
{ - SDK 튜토리얼 : https://docs.popbill.com/accountcheck/tutorial/delphi
{
{ <테스트 연동개발 준비사항>
{ (1) 31, 34번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를
{    링크허브 가입시 메일로 발급받은 인증정보로 수정
{
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Popbill, PopbillAccountCheck;

const
        {**********************************************************************}
        { - 인증정보(링크아이디, 비밀키)는 파트너의 연동회원을 식별하는        }
        {   인증에 사용되므로 유출되지 않도록 주의하시기 바랍니다              }
        { - 상업용 전환이후에도 인증정보는 변경되지 않습니다.                  }
        {**********************************************************************}

         //링크아이디.
        LinkID = 'TESTER';

        // 파트너 통신용 비밀키. 유출 주의.
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
    btnGetChargeInfo_ACC: TButton;
    btnGetChargeInfo_DEP: TButton;
    GroupBox1: TGroupBox;
    btnCheckID: TButton;
    btnGetUnitCost_ACC: TButton;
    btnGetUnitCost_DEP: TButton;
    txtCorpNum: TEdit;
    txtUserID: TEdit;
    btnJoinMember: TButton;
    btnCheckIsMember: TButton;
    btnGetAccessURL: TButton;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    GroupBox10: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    txtBankCode: TEdit;
    txtAccountNumber: TEdit;
    btnCheckAccountInfo: TButton;
    GroupBox11: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    txtBankCodeD: TEdit;
    txtAccountNumberD: TEdit;
    btnCheckDepositorInfo: TButton;
    Label7: TLabel;
    txtIdentityNumD: TEdit;
    Label8: TLabel;
    cbIdentityNumType: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCheckAccountInfoClick(Sender: TObject);
    procedure btnCheckDepositorInfoClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCost_ACCClick(Sender: TObject);
    procedure btnGetUnitCost_DEPClick(Sender: TObject);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnGetPartnerPointClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnGetChargeInfo_ACCClick(Sender: TObject);
    procedure btnGetChargeInfo_DEPClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);
    procedure cbIdentityNumTypeChange(Sender: TObject);
  private
    IdentityNumType : String;
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
        IdentityNumType := 'P';

        //예금주조회 모듈 초기화.
        accountCheckService := TAccountCheckService.Create(LinkID,SecretKey);

        // 연동환경 설정, true-개발용, false-상업용
        accountCheckService.IsTest := true;

        // Exception 처리 설정, true-사용, false-미사용, 기본값(true)
        accountCheckService.IsThrowException := true;

        // 인증토큰 IP제한기능 사용여부, true-사용, false-미사용, 기본값(true)
        accountCheckService.IPRestrictOnOff := true;

        //로컬시스템 시간 사용여부, true-사용, false-미사용, 기본값(true)
        accountCheckService.UseLocalTimeYN := false;
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
        { 1건의 예금주성명을 조회합니다.
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
                tmp := 'bankCode (기관코드) : '+ accountInfo.bankCode + #13;
                tmp := tmp + 'accountNumber (계좌번호) : '+ accountInfo.accountNumber + #13;
                tmp := tmp + 'accountName (예금주 성명) : '+ accountInfo.accountName + #13;
                tmp := tmp + 'checkDate (확인일시) : '+ FloatToStr(accountInfo.checkDate) + #13;
                tmp := tmp + 'result (응답코드) : '+ accountInfo.result + #13;
                tmp := tmp + 'resultMessage (응답메시지) : '+ accountInfo.resultMessage + #13#13;

                accountInfo.Free;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnCheckDepositorInfoClick(Sender: TObject);
var
        dePositorInfo : TDepositorCheckInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 1건의 예금주실명을 조회합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#CheckDepositorInfo
        {**********************************************************************}

        try
                dePositorInfo := accountCheckService.CheckDepositorInfo(txtCorpNum.text, txtBankCodeD.text, txtAccountNumberD.text, IdentityNumType, txtIdentityNumD.text);
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
                tmp := 'bankCode (기관코드) : '+ dePositorInfo.bankCode + #13;
                tmp := tmp + 'accountNumber (계좌번호) : '+ dePositorInfo.accountNumber + #13;
                tmp := tmp + 'accountName (예금주 성명) : '+ dePositorInfo.accountName + #13;
                tmp := tmp + 'checkDate (확인일시) : '+ FloatToStr(dePositorInfo.checkDate) + #13;
                tmp := tmp + 'identityNumType (등록번호 유형) : '+ dePositorInfo.identityNumType + #13;
                tmp := tmp + 'identityNum (등록번호) : '+ dePositorInfo.identityNum + #13;
                tmp := tmp + 'result (응답코드) : '+ dePositorInfo.result + #13;
                tmp := tmp + 'resultMessage (응답메시지) : '+ dePositorInfo.resultMessage + #13#13;

                dePositorInfo.Free;
                ShowMessage(tmp);
        end;
end;


procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { 파트너의 연동회원으로 회원가입을 요청합니다.
        { - 아이디 중복확인은 btnCheckIDClick 프로시져를 참조하시기 바랍니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#JoinMember
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '1234567890';

        // 대표자성명, 최대 100자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 200자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 100자
        joinInfo.BizType := '업태';

        // 종목, 최대 100자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 50자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // 담당자명, 최대 100자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 휴대폰번호, 최대 20자
        joinInfo.ContactHP := '010-000-1111';

        // 담당자 팩스번호, 최대 20자
        joinInfo.ContactFAX := '02-6442-9700';

        // 담당자 메일, 최대 100자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := accountCheckService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end   
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 파트너의 연동회원으로 가입된 사업자번호인지 확인합니다.
        { - LinkID는 파트너를 식별하는 인증정보(32번라인)에 설정되어 있습니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#CheckIsMember
        {**********************************************************************}

        try
                response := accountCheckService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end   
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 회원가입(JoinMember API)을 호출하기 전 아이디 중복을 확인합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#CheckID
        {**********************************************************************}
        
        try
                response := accountCheckService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end             
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다.
        { - 과금방식이 연동과금이 아닌 파트너과금인 경우 파트너 잔여포인트
        {   확인(GetPartnerBalance API) 기능 이용하시기 바랍니다
        { - https://docs.popbill.com/accountcheck/delphi/api#GetBalance
        {**********************************************************************}
        
        try
                balance := accountCheckService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));     
        end   

end;

procedure TfrmExample.btnGetUnitCost_ACCClick(Sender: TObject);
var
        unitcost : Single;
        serviceType : String;
begin
        {**********************************************************************}
        { 계좌성명조회 단가를 확인합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetUnitCost
        {**********************************************************************}
        serviceType := '성명';
        try
                unitcost := accountCheckService.GetUnitCost(txtCorpNum.text, serviceType);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('조회단가 : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetUnitCost_DEPClick(Sender: TObject);
var
        unitcost : Single;
        serviceType : String;
begin
        {**********************************************************************}
        { 계좌실명조회 단가를 확인합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetUnitCost
        {**********************************************************************}
        serviceType := '실명';
        try
                unitcost := accountCheckService.GetUnitCost(txtCorpNum.text, serviceType);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('조회단가 : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 팝빌(www.popbill.com)에 로그인된 팝업 URL을 반환합니다.
        { - URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetAccessURL
        {**********************************************************************}

        try
                resultURL := accountCheckService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end   

end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전 URL을 반환합니다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetChargeURL
        {**********************************************************************}
        
        try
                resultURL := accountCheckService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end         
end;

procedure TfrmExample.btnGetPartnerPointClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다. 과금방식이 파트너과금이 아닌
        { - 연동과금인 경우 연동회원 잔여포인트 확인(GetBalance API)를
        {   이용하시기 바랍니다
        { - https://docs.popbill.com/accountcheck/delphi/api#GetPartnerBalance
        {**********************************************************************}
        
        try
                balance := accountCheckService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
        end   
        
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원의 담당자를 신규로 등록합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#RegistContact
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 50자 미만)
        joinInfo.id := 'testkorea';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // [필수] 담당자명(한글이나 영문 100자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처 (최대 20자)
        joinInfo.tel := '070-4304-2991';

        // 휴대폰번호 (최대 20자)
        joinInfo.hp := '010-1111-2222';

        // 팩스번호 (최대 20자)
        joinInfo.fax := '02-6442-9700';

        // [필수] 이메일 (최대 100자)
        joinInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        joinInfo.searchRole := '3';

        try
                response := accountCheckService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end   
        
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원의 담당자 목록을 확인합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#ListContact
        {**********************************************************************}

        try
                InfoList := accountCheckService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                tmp := 'id(아이디) | email(이메일) | hp(휴대폰) | personName(성명) | searchRole(담당자 권한) | ';
                tmp := tmp + 'tel(연락처) | fax(팩스) | mgrYN(관리자 여부) | regDT(등록일시) | state(상태)' + #13;

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
        end     
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin

        {**********************************************************************}
        { 연동회원의 담당자 정보를 수정합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명 (최대 100자)
        contactInfo.personName := '테스트 담당자';

        // 연락처 (최대 20자)
        contactInfo.tel := '070-4304-2991';

        // 휴대폰번호 (최대 20자)
        contactInfo.hp := '010-4324-1111';

        // 이메일 주소 (최대 100자)
        contactInfo.email := 'test@test.com';

        // 팩스번호 (최대 20자)
        contactInfo.fax := '02-6442-9799';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        contactInfo.searchRole := '3';


        try
                response := accountCheckService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end    
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := accountCheckService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
                tmp := tmp + 'CeoName (대표자성명) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end    
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 100자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 200자
        corpInfo.corpName := '상호';

        // 업태, 최대 100자
        corpInfo.bizType := '업태';

        // 종목, 최대 100자
        corpInfo.bizClass := '종목';

        // 주소, 최대 300자
        corpInfo.addr := '서울특별시 강남구 영동대로 517';

        try
                response := accountCheckService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end      
end;

procedure TfrmExample.btnGetChargeInfo_ACCClick(Sender: TObject);
var
        chargeInfo : TAccountCheckChargeInfo;
        serviceType : String;
        tmp : String;
begin
        {**********************************************************************}
        { 계좌성명조회 API 서비스 과금정보를 확인합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetChargeInfo
        {**********************************************************************}

        serviceType := '성명';
        
        try
                chargeInfo := accountCheckService.GetChargeInfo(txtCorpNum.text, serviceType);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetChargeInfo_DEPClick(Sender: TObject);
var
        chargeInfo : TAccountCheckChargeInfo;
        serviceType : String;
        tmp : String;
begin
        {**********************************************************************}
        { 계좌실명조회 API 서비스 과금정보를 확인합니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetChargeInfo
        {**********************************************************************}

        serviceType := '실명';
        
        try
                chargeInfo := accountCheckService.GetChargeInfo(txtCorpNum.text, serviceType);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 파트너 포인트 충전 URL을 반환합니다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := accountCheckService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end
end;

procedure TfrmExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 결제내역 팝업 URL을 반환한다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := accountCheckService.getPaymentURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 사용내역 팝업 URL을 반환한다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := accountCheckService.getUseHistoryURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end
end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자 정보를 확인한다.
        { - https://docs.popbill.com/accountcheck/delphi/api#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := accountCheckService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if accountCheckService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(accountCheckService.LastErrCode) + #10#13 +'응답메시지 : '+ accountCheckService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (아이디) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (담당자 성명) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (담당자 연락처(전화번호)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'hp (담당자 휴대폰번호) : ' + contactInfo.hp + #13;
                tmp := tmp + 'fax (담당자 팩스번호) : ' + contactInfo.fax + #13;
                tmp := tmp + 'email (담당자 이메일) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (등록 일시) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (담당자 권한) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (관리자 여부) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (계정상태) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

procedure TfrmExample.cbIdentityNumTypeChange(Sender: TObject);
begin
        IdentityNumType := cbIdentityNumType.Text;
end;

end.