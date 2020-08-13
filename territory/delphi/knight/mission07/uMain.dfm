object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'fMain'
  ClientHeight = 500
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PgcMain: TPageControl
    Left = 0
    Top = 0
    Width = 483
    Height = 500
    ActivePage = TsEmail
    Align = alClient
    TabOrder = 0
    object TsEmail: TTabSheet
      Caption = 'Email'
      object GpbRecipient: TGroupBox
        Left = 3
        Top = 0
        Width = 468
        Height = 97
        TabOrder = 0
        object LblTo: TLabel
          Left = 38
          Top = 12
          Width = 12
          Height = 13
          Caption = 'To'
        end
        object LblCc: TLabel
          Left = 38
          Top = 39
          Width = 12
          Height = 13
          Caption = 'Cc'
        end
        object LblBcc: TLabel
          Left = 34
          Top = 66
          Width = 16
          Height = 13
          Caption = 'Bcc'
        end
        object EdtTo: TEdit
          Left = 56
          Top = 9
          Width = 401
          Height = 21
          Hint = 'use commas to separate email '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = 'messias.acb@gmail.com'
        end
        object EdtCc: TEdit
          Left = 56
          Top = 36
          Width = 401
          Height = 21
          Hint = 'use commas to separate email '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object EdtBcc: TEdit
          Left = 56
          Top = 63
          Width = 401
          Height = 21
          Hint = 'use commas to separate email '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
      end
      object GpbBody: TGroupBox
        Left = 3
        Top = 103
        Width = 468
        Height = 218
        TabOrder = 1
        object LblSubject: TLabel
          Left = 14
          Top = 12
          Width = 36
          Height = 13
          Caption = 'Subject'
        end
        object EdtSubject: TEdit
          Left = 56
          Top = 9
          Width = 401
          Height = 21
          TabOrder = 0
          Text = 'test'
        end
        object MmoBody: TMemo
          Left = 56
          Top = 36
          Width = 401
          Height = 173
          Lines.Strings = (
            '<!DOCTYPE html>'
            '<html>'
            '<head>'
            '    <meta charset="iso-8859-1"/>'
            '    <title>Document</title>'
            '</head>'
            '<body>'
            '    <p>Texto em negrito com <b>bold</b> e '
            '<strong>strong</strong>.</p>'
            
              '    <p>Texto em it'#225'lico com <i>italics<i> e <em>emphasis</em>.</' +
              'p>'
            '    <p>Texto <sup>sobrescrito</sup> e <sub>subscrito</sub>.</p>'
            '    <p>Texto <ins>inserido</ins> e <del>exclu'#237'do</del>.</p>'
            
              '    <p>Texto <small>pequeno</small> e <mark>destacado</mark>.</p' +
              '>'
            '</body>'
            '</html>')
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object GpbAttach: TGroupBox
        Left = 3
        Top = 327
        Width = 468
        Height = 109
        TabOrder = 2
        object LblAttach: TLabel
          Left = 18
          Top = 12
          Width = 32
          Height = 13
          Caption = 'Attach'
        end
        object MmoAttachment: TMemo
          Left = 56
          Top = 9
          Width = 401
          Height = 90
          Hint = 'Enter the location of the file, separating the files by line'
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = True
          TabOrder = 0
          WordWrap = False
        end
      end
      object BtnSend: TButton
        Left = 3
        Top = 442
        Width = 469
        Height = 25
        Caption = 'Send'
        TabOrder = 3
        OnClick = BtnSendClick
      end
    end
    object tsSettings: TTabSheet
      Caption = 'Settings'
      ImageIndex = 1
      object GpbServer: TGroupBox
        Left = 0
        Top = 0
        Width = 475
        Height = 97
        Align = alTop
        TabOrder = 0
        object LblUser: TLabel
          Left = 35
          Top = 39
          Width = 22
          Height = 13
          Caption = 'User'
        end
        object LblPassword: TLabel
          Left = 12
          Top = 63
          Width = 46
          Height = 13
          Caption = 'Password'
        end
        object LblServer: TLabel
          Left = 26
          Top = 12
          Width = 32
          Height = 13
          Caption = 'Server'
        end
        object LblPort: TLabel
          Left = 382
          Top = 12
          Width = 20
          Height = 13
          Caption = 'Port'
        end
        object LblNickname: TLabel
          Left = 252
          Top = 66
          Width = 45
          Height = 13
          Caption = 'Nickname'
        end
        object EdtPassword: TEdit
          Left = 64
          Top = 63
          Width = 182
          Height = 21
          PasswordChar = '*'
          TabOrder = 3
          Text = 'Wuq87976'
        end
        object EdtUser: TEdit
          Left = 64
          Top = 36
          Width = 400
          Height = 21
          TabOrder = 2
          Text = 'brasil@poligraph.onmicrosoft.com'
        end
        object EdtServer: TEdit
          Left = 64
          Top = 9
          Width = 312
          Height = 21
          TabOrder = 0
          Text = 'smtp.office365.com'
        end
        object EdtPort: TEdit
          Left = 408
          Top = 9
          Width = 56
          Height = 21
          NumbersOnly = True
          TabOrder = 1
          Text = '587'
        end
        object EdtNickname: TEdit
          Left = 303
          Top = 63
          Width = 161
          Height = 21
          TabOrder = 4
          Text = 'Messias Bueno'
        end
      end
      object GpbSSL: TGroupBox
        Left = 0
        Top = 103
        Width = 471
        Height = 74
        TabOrder = 1
        object LblSSLMode: TLabel
          Left = 12
          Top = 40
          Width = 46
          Height = 13
          Caption = 'SSL Mode'
        end
        object LblSSLMethod: TLabel
          Left = 3
          Top = 13
          Width = 55
          Height = 13
          Caption = 'SSL Version'
        end
        object CbbSSLMethod: TComboBox
          Left = 64
          Top = 9
          Width = 182
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 5
          TabOrder = 0
          Text = 'TLS v1.2'
          Items.Strings = (
            'SSL v2'
            'SSL v2.3'
            'SSL v3'
            'TLS v1'
            'TLS v1.1'
            'TLS v1.2')
        end
        object CbbSSLMode: TComboBox
          Left = 64
          Top = 37
          Width = 182
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 1
          TabOrder = 1
          Text = 'Client'
          Items.Strings = (
            'Unassigned'
            'Client'
            'Server'
            'Both')
        end
      end
      object BtnTestConnect: TButton
        Left = 0
        Top = 183
        Width = 471
        Height = 25
        Caption = 'Test Connect'
        TabOrder = 2
        OnClick = BtnTestConnectClick
      end
    end
  end
end
