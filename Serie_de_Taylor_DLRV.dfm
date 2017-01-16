object Form1: TForm1
  Left = 147
  Top = 146
  Width = 800
  Height = 501
  Caption = 'Serie de Taylor'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 424
    Top = 104
    Width = 108
    Height = 17
    Caption = 'Valor Verdadero'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 424
    Top = 72
    Width = 69
    Height = 17
    Caption = 'Valor de X'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 296
    Top = 16
    Width = 238
    Height = 30
    Caption = 'SERIE DE TAYLOR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Algerian'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Mensaje: TLabel
    Left = 544
    Top = 56
    Width = 3
    Height = 13
  end
  object txtVal_Verdadero: TEdit
    Left = 544
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 0
    OnEnter = FormCreate
  end
  object Imprimir: TButton
    Left = 696
    Top = 64
    Width = 75
    Height = 33
    Cursor = crHandPoint
    Caption = 'Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = ImprimirClick
  end
  object Salir: TButton
    Left = 696
    Top = 160
    Width = 75
    Height = 33
    Cursor = crHandPoint
    Caption = 'Salir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = SalirClick
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 208
    Width = 753
    Height = 225
    Color = clMenu
    ColCount = 7
    FixedColor = clCream
    FixedCols = 0
    RowCount = 32
    TabOrder = 3
    ColWidths = (
      54
      99
      110
      107
      111
      122
      118)
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 48
    Width = 145
    Height = 145
    TabOrder = 4
    object Label5: TLabel
      Left = 40
      Top = 16
      Width = 67
      Height = 16
      Caption = 'FUNCIONES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object ListBox1: TListBox
      Left = 16
      Top = 40
      Width = 113
      Height = 89
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      Items.Strings = (
        'e^(x)'
        'sen(x)'
        'cos(x)'
        'ln(x)'
        'ArcTan(x)')
      ParentFont = False
      TabOrder = 0
      OnClick = ListBox1Click
    end
  end
  object Borrar: TButton
    Left = 696
    Top = 112
    Width = 75
    Height = 33
    Cursor = crHandPoint
    Caption = 'Borrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BorrarClick
  end
  object txtValorX: TEdit
    Left = 544
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 6
    OnKeyPress = txtValorXKeyPress
  end
end
