object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 398
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCenter: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 357
    Align = alClient
    TabOrder = 0
  end
  object PnlBottom: TPanel
    Left = 0
    Top = 357
    Width = 631
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BtnOpen: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = BtnOpenClick
    end
    object BtnSave: TButton
      Left = 89
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 1
      OnClick = BtnSaveClick
    end
    object Button1: TButton
      Left = 170
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 631
    Height = 357
    ActivePage = TabSheetBrowser
    Align = alClient
    TabOrder = 2
    object TabSheetBrowser: TTabSheet
      Caption = 'Browser'
      OnShow = TabSheetBrowserShow
      object Browser: TWebBrowser
        Left = 0
        Top = 0
        Width = 623
        Height = 240
        Align = alClient
        TabOrder = 0
        OnBeforeNavigate2 = BrowserBeforeNavigate2
        OnDocumentComplete = BrowserDocumentComplete
        ExplicitTop = -2
        ExplicitHeight = 329
        ControlData = {
          4C00000064400000CE1800000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      object MemoDebug: TMemo
        Left = 0
        Top = 240
        Width = 623
        Height = 89
        Align = alBottom
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object TabSheetCode: TTabSheet
      Caption = 'Code'
      ImageIndex = 1
      object MemoCode: TSynMemo
        Left = 0
        Top = 0
        Width = 623
        Height = 329
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        CodeFolding.GutterShapeSize = 11
        CodeFolding.CollapsedLineColor = clGrayText
        CodeFolding.FolderBarLinesColor = clGrayText
        CodeFolding.IndentGuidesColor = clGray
        CodeFolding.IndentGuides = True
        CodeFolding.ShowCollapsedLine = False
        CodeFolding.ShowHintMark = True
        UseCodeFolding = False
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Highlighter = SynMultiSyn1
        TabWidth = 4
        WantTabs = True
        FontSmoothing = fsmNone
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 80
    Top = 144
  end
  object SynHTMLSyn1: TSynHTMLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 152
    Top = 144
  end
  object SynPasSyn1: TSynPasSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 72
    Top = 200
  end
  object SynMultiSyn1: TSynMultiSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Schemes = <
      item
        Highlighter = SynHTMLSyn1
      end
      item
        CaseSensitive = False
        StartExpr = '<script type="text/pascal">'
        EndExpr = '</script>'
        Highlighter = SynPasSyn1
      end
      item
        Highlighter = SynJScriptSyn1
      end
      item
        StartExpr = '<style'
        EndExpr = '</style>'
        Highlighter = SynCssSyn1
      end>
    DefaultHighlighter = SynHTMLSyn1
    Left = 160
    Top = 72
  end
  object SynJScriptSyn1: TSynJScriptSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 80
    Top = 72
  end
  object IFPS3CE_Controls1: TPSImport_Controls
    EnableStreams = True
    EnableGraphics = True
    EnableControls = True
    Left = 328
    Top = 40
  end
  object IFPS3CE_DateUtils1: TPSImport_DateUtils
    Left = 328
    Top = 96
  end
  object IFPS3CE_Std1: TPSImport_Classes
    EnableStreams = True
    EnableClasses = True
    Left = 328
    Top = 152
  end
  object IFPS3CE_ComObj1: TPSImport_ComObj
    Left = 328
    Top = 200
  end
  object IFPS3DllPlugin1: TPSDllPlugin
    Left = 432
    Top = 96
  end
  object SaveDialog: TSaveDialog
    Left = 144
    Top = 200
  end
  object ApplicationEvents: TApplicationEvents
    Left = 144
    Top = 264
  end
  object ce: TPSScriptDebugger
    CompilerOptions = [icAllowNoBegin, icAllowUnit, icAllowNoEnd]
    OnCompile = ceCompile
    OnExecute = ceExecute
    Plugins = <
      item
        Plugin = PSImport_Classes1
      end
      item
        Plugin = IFPS3CE_DateUtils1
      end
      item
        Plugin = IFPS3CE_ComObj1
      end
      item
        Plugin = IFPS3CE_Std1
      end
      item
        Plugin = IFPS3CE_Controls1
      end
      item
        Plugin = PSImport_StdCtrls1
      end
      item
        Plugin = PSImport_Forms1
      end
      item
        Plugin = IFPS3DllPlugin1
      end>
    UsePreProcessor = False
    OnIdle = ceIdle
    Left = 516
    Top = 160
  end
  object SynCssSyn1: TSynCssSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 60
    Top = 264
  end
  object PSImport_Classes1: TPSImport_Classes
    EnableStreams = True
    EnableClasses = True
    Left = 324
    Top = 256
  end
  object PSImport_Forms1: TPSImport_Forms
    EnableForms = True
    EnableMenus = True
    Left = 428
    Top = 224
  end
  object PSImport_StdCtrls1: TPSImport_StdCtrls
    EnableExtCtrls = True
    EnableButtons = True
    Left = 428
    Top = 160
  end
end
