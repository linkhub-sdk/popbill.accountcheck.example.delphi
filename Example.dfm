object frmExample: TfrmExample
  Left = 561
  Top = 475
  Width = 1140
  Height = 390
  Caption = '�˺� ��������ȸ API Delphi SDK Example'
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
    Caption = '�˺�ȸ�� ����ڹ�ȣ :'
  end
  object Label2: TLabel
    Left = 302
    Top = 20
    Width = 99
    Height = 13
    AutoSize = False
    Caption = '�˺�ȸ�� ���̵� :'
  end
  object GroupBox7: TGroupBox
    Left = 16
    Top = 48
    Width = 1089
    Height = 177
    Caption = '�˺� �⺻ API'
    TabOrder = 0
    object GroupBox8: TGroupBox
      Left = 768
      Top = 16
      Width = 144
      Height = 145
      Caption = '�������� ����Ʈ'
      TabOrder = 0
      object btnGetBalance: TButton
        Left = 9
        Top = 19
        Width = 129
        Height = 25
        Caption = '�ܿ�����Ʈ ��ȸ'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeURL: TButton
        Left = 9
        Top = 50
        Width = 129
        Height = 25
        Caption = '����Ʈ ���� URL'
        TabOrder = 1
        OnClick = btnGetChargeURLClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 80
        Width = 129
        Height = 25
        Caption = '����Ʈ �������� URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 112
        Width = 129
        Height = 25
        Caption = '����Ʈ ��볻�� URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
    object GroupBox9: TGroupBox
      Left = 920
      Top = 16
      Width = 147
      Height = 122
      Caption = '��Ʈ�ʰ��� ����Ʈ'
      TabOrder = 1
      object btnGetPartnerPoint: TButton
        Left = 8
        Top = 18
        Width = 127
        Height = 25
        Caption = '��Ʈ������Ʈ ��ȸ'
        TabOrder = 0
        OnClick = btnGetPartnerPointClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 48
        Width = 128
        Height = 25
        Caption = '����Ʈ ���� URL'
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
    Caption = '����� ����'
    TabOrder = 1
    object btnRegistContact: TButton
      Left = 8
      Top = 16
      Width = 129
      Height = 25
      Caption = '����� �߰�'
      TabOrder = 0
      OnClick = btnRegistContactClick
    end
    object btnListContact: TButton
      Left = 7
      Top = 48
      Width = 129
      Height = 25
      Caption = '����� ��� ��ȸ'
      TabOrder = 1
      OnClick = btnListContactClick
    end
    object btnUpdateContact: TButton
      Left = 7
      Top = 80
      Width = 129
      Height = 25
      Caption = '����� ���� ����'
      TabOrder = 2
      OnClick = btnUpdateContactClick
    end
    object btnGetContactInfo: TButton
      Left = 8
      Top = 112
      Width = 129
      Height = 25
      Caption = '����� ���� Ȯ��'
      TabOrder = 3
      OnClick = btnGetContactInfoClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 332
    Top = 66
    Width = 141
    Height = 118
    Caption = '�˺� �⺻ URL'
    TabOrder = 2
  end
  object GroupBox2: TGroupBox
    Left = 165
    Top = 66
    Width = 148
    Height = 119
    Caption = '����Ʈ ����'
    TabOrder = 3
    object btnGetChargeInfo: TButton
      Left = 8
      Top = 16
      Width = 128
      Height = 25
      Caption = '�������� Ȯ��'
      TabOrder = 0
      OnClick = btnGetChargeInfoClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 29
    Top = 67
    Width = 127
    Height = 118
    Caption = 'ȸ�� ����'
    TabOrder = 4
    object btnCheckID: TButton
      Left = 8
      Top = 49
      Width = 113
      Height = 25
      Caption = '���̵� �ߺ� Ȯ��'
      TabOrder = 0
      OnClick = btnCheckIDClick
    end
  end
  object btnGetUnitCost: TButton
    Left = 173
    Top = 115
    Width = 128
    Height = 25
    Caption = '��ȸ �ܰ� Ȯ��'
    TabOrder = 5
    OnClick = btnGetUnitCostClick
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
    Caption = 'ȸ�� ����'
    TabOrder = 8
    OnClick = btnJoinMemberClick
  end
  object btnCheckIsMember: TButton
    Left = 37
    Top = 84
    Width = 113
    Height = 25
    Caption = '���Կ��� Ȯ��'
    TabOrder = 9
    OnClick = btnCheckIsMemberClick
  end
  object btnGetAccessURL: TButton
    Left = 341
    Top = 82
    Width = 117
    Height = 25
    Caption = '�˺� �α��� URL'
    TabOrder = 10
    OnClick = btnGetAccessURLClick
  end
  object GroupBox5: TGroupBox
    Left = 16
    Top = 224
    Width = 569
    Height = 97
    Caption = '��������ȸ ���� ��� API'
    TabOrder = 11
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 60
      Height = 13
      Caption = '����ڵ� :  '
    end
    object Label4: TLabel
      Left = 24
      Top = 48
      Width = 60
      Height = 13
      Caption = '���¹�ȣ :  '
    end
    object txtBankCode: TEdit
      Left = 92
      Top = 21
      Width = 121
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 0
      Text = '0004'
    end
    object btnCheckAccountInfo: TButton
      Left = 222
      Top = 15
      Width = 123
      Height = 58
      Caption = '��������ȸ ��ȸ'
      TabOrder = 1
      OnClick = btnCheckAccountInfoClick
    end
    object txtAccountNumber: TEdit
      Left = 92
      Top = 45
      Width = 121
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 2
      Text = '94324511758'
    end
  end
  object GroupBox6: TGroupBox
    Left = 632
    Top = 65
    Width = 144
    Height = 119
    Caption = 'ȸ������ ����'
    TabOrder = 12
    object btnGetCorpInfo: TButton
      Left = 12
      Top = 16
      Width = 121
      Height = 25
      Caption = 'ȸ������ ��ȸ'
      TabOrder = 0
      OnClick = btnGetCorpInfoClick
    end
    object btnUpdateCorpInfo: TButton
      Left = 12
      Top = 48
      Width = 121
      Height = 25
      Caption = 'ȸ������ ����'
      TabOrder = 1
      OnClick = btnUpdateCorpInfoClick
    end
  end
end
