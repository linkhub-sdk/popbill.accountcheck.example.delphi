object frmExample: TfrmExample
  Left = 815
  Top = 460
  Width = 1140
  Height = 493
  Caption = '팝빌 예금주조회 API Delphi SDK Example'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 21
    Top = 20
    Width = 132
    Height = 13
    AutoSize = False
    Caption = '팝빌회원 사업자번호 :'
  end
  object Label2: TLabel
    Left = 302
    Top = 20
    Width = 99
    Height = 13
    AutoSize = False
    Caption = '팝빌회원 아이디 :'
  end
  object GroupBox7: TGroupBox
    Left = 16
    Top = 48
    Width = 1089
    Height = 177
    Caption = '팝빌 기본 API'
    TabOrder = 0
    object GroupBox8: TGroupBox
      Left = 768
      Top = 16
      Width = 144
      Height = 145
      Caption = '연동과금 포인트'
      TabOrder = 0
      object btnGetBalance: TButton
        Left = 9
        Top = 19
        Width = 129
        Height = 25
        Caption = '잔여포인트 조회'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeURL: TButton
        Left = 9
        Top = 50
        Width = 129
        Height = 25
        Caption = '포인트 충전 URL'
        TabOrder = 1
        OnClick = btnGetChargeURLClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 80
        Width = 129
        Height = 25
        Caption = '포인트 결제내역 URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 112
        Width = 129
        Height = 25
        Caption = '포인트 사용내역 URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
    object GroupBox9: TGroupBox
      Left = 920
      Top = 16
      Width = 147
      Height = 122
      Caption = '파트너과금 포인트'
      TabOrder = 1
      object btnGetPartnerPoint: TButton
        Left = 8
        Top = 18
        Width = 127
        Height = 25
        Caption = '파트너포인트 조회'
        TabOrder = 0
        OnClick = btnGetPartnerPointClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 48
        Width = 128
        Height = 25
        Caption = '포인트 충전 URL'
        TabOrder = 1
        OnClick = btnGetPartnerURL_CHRGClick
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 480
    Top = 65
    Width = 144
    Height = 144
    Caption = '담당자 관련'
    TabOrder = 1
    object btnRegistContact: TButton
      Left = 8
      Top = 16
      Width = 129
      Height = 25
      Caption = '담당자 추가'
      TabOrder = 0
      OnClick = btnRegistContactClick
    end
    object btnListContact: TButton
      Left = 7
      Top = 80
      Width = 129
      Height = 25
      Caption = '담당자 목록 조회'
      TabOrder = 1
      OnClick = btnListContactClick
    end
    object btnUpdateContact: TButton
      Left = 7
      Top = 112
      Width = 129
      Height = 25
      Caption = '담당자 정보 수정'
      TabOrder = 2
      OnClick = btnUpdateContactClick
    end
    object btnGetContactInfo: TButton
      Left = 8
      Top = 48
      Width = 129
      Height = 25
      Caption = '담당자 정보 확인'
      TabOrder = 3
      OnClick = btnGetContactInfoClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 332
    Top = 66
    Width = 141
    Height = 118
    Caption = '팝빌 기본 URL'
    TabOrder = 2
  end
  object GroupBox2: TGroupBox
    Left = 160
    Top = 66
    Width = 169
    Height = 151
    Caption = '포인트 관련'
    TabOrder = 3
    object btnGetChargeInfo_ACC: TButton
      Left = 8
      Top = 17
      Width = 153
      Height = 25
      Caption = '성명조회 과금정보 확인'
      TabOrder = 0
      OnClick = btnGetChargeInfo_ACCClick
    end
    object btnGetChargeInfo_DEP: TButton
      Left = 8
      Top = 49
      Width = 153
      Height = 25
      Caption = '실명조회 과금정보 확인'
      TabOrder = 1
      OnClick = btnGetChargeInfo_DEPClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 29
    Top = 67
    Width = 127
    Height = 118
    Caption = '회원 정보'
    TabOrder = 4
    object btnCheckID: TButton
      Left = 8
      Top = 49
      Width = 113
      Height = 25
      Caption = '아이디 중복 확인'
      TabOrder = 0
      OnClick = btnCheckIDClick
    end
  end
  object btnGetUnitCost_ACC: TButton
    Left = 168
    Top = 147
    Width = 153
    Height = 25
    Caption = '성명조회 단가 확인'
    TabOrder = 5
    OnClick = btnGetUnitCost_ACCClick
  end
  object txtCorpNum: TEdit
    Left = 161
    Top = 17
    Width = 123
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 6
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 405
    Top = 17
    Width = 123
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 7
    Text = 'testkorea'
  end
  object btnJoinMember: TButton
    Left = 37
    Top = 147
    Width = 113
    Height = 25
    Caption = '회원 가입'
    TabOrder = 8
    OnClick = btnJoinMemberClick
  end
  object btnCheckIsMember: TButton
    Left = 37
    Top = 84
    Width = 113
    Height = 25
    Caption = '가입여부 확인'
    TabOrder = 9
    OnClick = btnCheckIsMemberClick
  end
  object btnGetAccessURL: TButton
    Left = 341
    Top = 82
    Width = 117
    Height = 25
    Caption = '팝빌 로그인 URL'
    TabOrder = 10
    OnClick = btnGetAccessURLClick
  end
  object GroupBox5: TGroupBox
    Left = 16
    Top = 224
    Width = 1089
    Height = 201
    Caption = '예금주조회 관련 기능 API'
    TabOrder = 11
    object GroupBox10: TGroupBox
      Left = 120
      Top = 25
      Width = 345
      Height = 105
      Caption = '계좌성명조회'
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 32
        Width = 56
        Height = 13
        Caption = '기관코드 :  '
      end
      object Label4: TLabel
        Left = 8
        Top = 64
        Width = 56
        Height = 13
        Caption = '계좌번호 :  '
      end
      object txtBankCode: TEdit
        Left = 72
        Top = 29
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2010'
        TabOrder = 0
      end
      object txtAccountNumber: TEdit
        Left = 72
        Top = 61
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2010'
        TabOrder = 1
      end
      object btnCheckAccountInfo: TButton
        Left = 206
        Top = 27
        Width = 123
        Height = 58
        Caption = '계좌성명조회'
        TabOrder = 2
        OnClick = btnCheckAccountInfoClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 579
      Top = 26
      Width = 345
      Height = 159
      Caption = '계좌실명조회'
      TabOrder = 1
      object Label5: TLabel
        Left = 8
        Top = 32
        Width = 56
        Height = 13
        Caption = '기관코드 :  '
      end
      object Label6: TLabel
        Left = 8
        Top = 64
        Width = 56
        Height = 13
        Caption = '계좌번호 :  '
      end
      object Label7: TLabel
        Left = 8
        Top = 96
        Width = 81
        Height = 13
        Caption = '등록번호 유형 :  '
      end
      object Label8: TLabel
        Left = 8
        Top = 126
        Width = 56
        Height = 13
        Caption = '등록번호 :  '
      end
      object txtBankCodeD: TEdit
        Left = 77
        Top = 29
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2010'
        TabOrder = 0
      end
      object txtAccountNumberD: TEdit
        Left = 77
        Top = 60
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2010'
        TabOrder = 1
      end
      object btnCheckDepositorInfo: TButton
        Left = 210
        Top = 27
        Width = 123
        Height = 58
        Caption = '계좌실명조회'
        TabOrder = 2
        OnClick = btnCheckDepositorInfoClick
      end
      object txtIdentityNumD: TEdit
        Left = 77
        Top = 122
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2010'
        TabOrder = 3
      end
      object cbIdentityNumType: TComboBox
        Left = 98
        Top = 93
        Width = 100
        Height = 21
        ImeName = '한국어 입력 시스템 (IME 2000)'
        ItemHeight = 13
        TabOrder = 4
        Text = 'P'
        OnChange = cbIdentityNumTypeChange
        Items.Strings = (
          'P'
          'B')
      end
    end
  end
  object GroupBox6: TGroupBox
    Left = 632
    Top = 65
    Width = 144
    Height = 119
    Caption = '회사정보 관련'
    TabOrder = 12
    object btnGetCorpInfo: TButton
      Left = 12
      Top = 16
      Width = 121
      Height = 25
      Caption = '회사정보 조회'
      TabOrder = 0
      OnClick = btnGetCorpInfoClick
    end
    object btnUpdateCorpInfo: TButton
      Left = 12
      Top = 48
      Width = 121
      Height = 25
      Caption = '회사정보 수정'
      TabOrder = 1
      OnClick = btnUpdateCorpInfoClick
    end
  end
  object btnGetUnitCost_DEP: TButton
    Left = 168
    Top = 179
    Width = 153
    Height = 25
    Caption = '실명조회 단가 확인'
    TabOrder = 13
    OnClick = btnGetUnitCost_DEPClick
  end
end
