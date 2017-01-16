unit Serie_de_Taylor_DLRV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, ActnList;

type
    TForm1 = class(TForm)
    txtVal_Verdadero: TEdit;
    Label1: TLabel;
    Imprimir: TButton;
    Salir: TButton;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    ListBox1: TListBox;
    Borrar: TButton;
    txtValorX: TEdit;
    Mensaje: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure txtValorXKeyPress(Sender: TObject; var Key: Char);
    procedure BorrarClick(Sender: TObject);

  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
   //ENCABEZADOS DEL STRINGGRIG
      StringGrid1.Cells[0,0]:=' Contador';
      StringGrid1.Cells[1,0]:='           Término';
      StringGrid1.Cells[2,0]:='           Suma';
      StringGrid1.Cells[3,0]:='   Valor Verdadero';
      StringGrid1.Cells[4,0]:='   Error Absoluto';
      StringGrid1.Cells[5,0]:='   Error Relativo';
      StringGrid1.Cells[6,0]:='        Diferencia';
end;

procedure TForm1.ImprimirClick(Sender: TObject);

  //Tipos de Datos
  Type
  Terminos1= array [0..30] of Double;
  Sumas1= array [0..30] of Double;
  Error_Absoluto1= array [0..30] of Double;
  Error_Relativo1= array [0..30] of Double;
  Diferencia1= array [0..30] of Double;

  //Variables
  Var
  Factorial: Double;
  Suma: Double;
  Exponencial: Double;
  I: Integer;
  J: Integer;
  K: Integer;
  Divisor: Double;
  Terminos: Terminos1;
  Sumas: Sumas1;
  Valor_de_Verdad: Double;
  Error_Absoluto: Error_Absoluto1;
  Error_Relativo: Error_Relativo1;
  Diferencia: Diferencia1;
  X_ingresada: Double;
  Signo: Integer;
  Valor_e:Double;
  Seno: Double;
  Coseno: Double;
  Logaritmo_N: Double;
  ArcoTangente: Double;

  //Constantes
  const
  x=10;
  n=30;

  //Inicio del programa
  begin

    //Encerar los vectores
    for I:=0 to n do
      begin
        Terminos[I]:=0;
        Sumas[I]:=0;
        Error_Absoluto[I]:=0;
        Error_Relativo[I]:=0;
        Diferencia[I]:=0;
      end;

    //Asignar valores iniciales a las variables
    Valor_de_Verdad:=0;
    Logaritmo_N:=0;

    //*****************Función E^10********************

    //Ingresa al Proceso si seleccionar la primera opción de la Lista
    if (ListBox1.Selected[0]=True)then
    begin
      //Entra al proceso si se ha ingresado el valor de X
      If (txtValorX.Text<>'') then
      begin
        X_ingresada:=StrtoFloat(txtValorX.Text);
        Valor_e:=Exp(X_ingresada);
        Valor_de_Verdad:=Valor_e;
        txtVal_Verdadero.Text:=FloatToStr(Valor_de_Verdad);
        Suma:=0;

        //Proceso Función E^X
          for I := 0 to n do
          begin
            Factorial:=1;
            Exponencial:=1;
              If I>0 then
              begin
                for J := 1 to I do
                begin
                Factorial:=Factorial*J;
                Exponencial:=Exponencial*X_ingresada;
                end
              end;
            Terminos[I]:= (Exponencial/Factorial);
            Suma:=Suma+Terminos[I];
            Sumas[I]:= Suma;
            Error_Absoluto[I]:=Valor_de_Verdad-Sumas[I];
              if  Error_Absoluto[I]<0 then
              begin
                  Error_Absoluto[I]:=Error_Absoluto[I]*(-1);
              end;
            Error_Relativo[I]:=Error_Absoluto[I]/Valor_de_Verdad;
            Diferencia[I]:=Error_Absoluto[I]-Error_Relativo[I];
          end;
        end;
     end;


    //**************Función SENO(x)**************

    //Ingresa al Proceso si seleccionar la segunda opción de la Lista
    if (ListBox1.Selected[1]=True)then
    begin
      //Entra al Proceso si se ingresa el valor de X
      If (txtValorX.Text<>'') then
      begin
          X_ingresada:=Strtofloat(txtValorX.Text);
          Seno:=Sin(X_ingresada);
          Valor_de_Verdad:=Seno;
          txtVal_Verdadero.Text:=FloatToStr(Valor_de_Verdad);
          Suma:=0;

            //Proceso de la Función SEN(X)
            for I := 0 to n do
            begin
              Factorial:=1;
              Exponencial:=1;
              Signo:=1;
                for J := 1 to ((2*I)+1) do
                begin
                  Factorial:=Factorial*J;
                  Exponencial:=Exponencial*X_ingresada;
                    if I Mod 2=1 then
                    begin
                      Signo:=-1;
                    end;
                end;
              Terminos[I]:= Signo*(Exponencial/Factorial);
              Suma:=Suma+Terminos[I];
              Sumas[I]:= Suma;
              Error_Absoluto[I]:=Valor_de_Verdad-Sumas[I];
                if  Error_Absoluto[I]<0 then
                begin
                    Error_Absoluto[I]:=Error_Absoluto[I]*(-1);
                end;
                if Valor_de_Verdad<>0 then
                begin
                    Error_Relativo[I]:=Error_Absoluto[I]/Valor_de_Verdad;
                    Diferencia[I]:=Error_Absoluto[I]-Error_Relativo[I];
                end;
                if Valor_de_Verdad=0 then
                 begin
                    Error_Relativo[I]:=0;
                    Diferencia[I]:=0;
                 end;
            end;
      end;
  end;


  //**************Función COSENO(x)**************

    //Ingresa al Proceso si seleccionar la tercera opción de la Lista
    if (ListBox1.Selected[2]=True)then
    begin
      // Entra al proceso si se ingresa X
      If (txtValorX.Text<>'') then
      begin
          X_ingresada:=Strtofloat(txtValorX.Text);
          Coseno:=Cos(X_ingresada);
          Valor_de_Verdad:=Coseno;
          txtVal_Verdadero.Text:=FloatToStr(Valor_de_Verdad);
          Suma:=0;

             //Proceso de la Función COS(X)
            for I := 0 to n do
            begin
              Factorial:=1;
              Exponencial:=1;
              Signo:=1;
                for J := 1 to (2*I) do
                begin
                  Factorial:=Factorial*J;
                  Exponencial:=Exponencial*X_ingresada;
                    if I Mod 2=1 then
                    begin
                      Signo:=-1;
                    end;
                end;
              Terminos[I]:= Signo*(Exponencial/Factorial);
              Suma:=Suma+Terminos[I];
              Sumas[I]:= Suma;
              Error_Absoluto[I]:=Valor_de_Verdad-Sumas[I];
                if  Error_Absoluto[I]<0 then
                begin
                  Error_Absoluto[I]:=Error_Absoluto[I]*(-1);
                end;
                if Valor_de_Verdad<>0 then
                begin
                    Error_Relativo[I]:=Error_Absoluto[I]/Valor_de_Verdad;
                    Diferencia[I]:=Error_Absoluto[I]-Error_Relativo[I];
                end;
                if Valor_de_Verdad=0 then
                begin
                    Error_Relativo[I]:=0;
                    Diferencia[I]:=0;
                end;
            end;
      end;
  end;

  //**************Función LN(x)**************

    //Ingresa al Proceso si seleccionar la cuarta opción de la Lista
    if (ListBox1.Selected[3]=True)then
    begin
        //Entra al proceso si se ingresa X
        If (txtValorX.Text<>'') then
        begin
          If (txtValorX.Text>'0') then
          begin
            X_ingresada:=Strtofloat(txtValorX.Text);
            Logaritmo_N:= Ln(X_ingresada);
            Valor_de_Verdad:=Logaritmo_N;
            txtVal_Verdadero.Text:=FloatToStr(Valor_de_Verdad);
            Suma:=0;

              //Proceso de la Función Ln(X)
              for I := 1 to n do
              begin
                Exponencial:=1;
                Signo:=1;
                  for J := 1 to I do
                  begin
                    Exponencial:=Exponencial*(X_ingresada-1);
                      If I Mod 2=0 then
                      begin
                        Signo:=-1;
                      end
                  end;
                Divisor:=I;
                Terminos[I]:= Signo*(Exponencial/Divisor);
                Suma:=Suma+Terminos[I];
                Sumas[I]:= Suma;
                Error_Absoluto[I]:=Valor_de_Verdad-Sumas[I];
                  if  Error_Absoluto[I]<0 then
                  begin
                    Error_Absoluto[I]:=Error_Absoluto[I]*(-1);
                  end;
                  if Valor_de_Verdad<>0 then
                  begin
                    Error_Relativo[I]:=Error_Absoluto[I]/Valor_de_Verdad;
                    Diferencia[I]:=Error_Absoluto[I]-Error_Relativo[I];
                  end;
                  if Valor_de_Verdad=0 then
                  begin
                    Error_Relativo[I]:=0;
                    Diferencia[I]:=0;
                  end;
              end;
          end;
      end;
  end;

  //**************Función ArcoTangente(x)**************

    //Ingresa al Proceso si seleccionar la quinta opción de la Lista
    if (ListBox1.Selected[4]=True)then
    begin
      //Entra al proceso si se ingresa X
      If (txtValorX.Text<>'') then
      begin
          X_ingresada:=Strtofloat(txtValorX.Text);
          ArcoTangente:=ArcTan(X_ingresada);
          Valor_de_Verdad:=ArcoTangente;
          txtVal_Verdadero.Text:=FloatToStr(Valor_de_Verdad);
          Suma:=0;

            //Proceso de la Función ARCTAN(X)
            for I := 0 to n do
            begin
              Exponencial:=1;
              Signo:=1;
                for J := 1 to ((2*I)+1) do
                begin
                  Exponencial:=Exponencial*X_ingresada;
                    if I Mod 2=1 then
                    begin
                        Signo:=-1;
                    end;
                end;
              Divisor:=I;
              Terminos[I]:= Signo*(Exponencial/((2*Divisor)+1));
              Suma:=Suma+Terminos[I];
              Sumas[I]:= Suma;
              Error_Absoluto[I]:=Valor_de_Verdad-Sumas[I];
                if  Error_Absoluto[I]<0 then
                begin
                  Error_Absoluto[I]:=Error_Absoluto[I]*(-1);
                end;
                if Valor_de_Verdad<>0 then
                begin
                    Error_Relativo[I]:=Error_Absoluto[I]/Valor_de_Verdad;
                    Diferencia[I]:=Error_Absoluto[I]-Error_Relativo[I];
                end;
                if Valor_de_Verdad=0 then
                begin
                    Error_Relativo[I]:=0;
                    Diferencia[I]:=0;
                end;
            end;
      end;
  end;

  //Mostar Resultados

  if ((ListBox1.Selected[0]=True) or (ListBox1.Selected[1]=True)or (ListBox1.Selected[2]=True)or (ListBox1.Selected[3]=True) or (ListBox1.Selected[4]=True))then
  begin
    //Si es no LN natural y X tiene un valor asignado muestra los datos
    if (ListBox1.Selected[3]=False) and (txtValorX.Text<>'') then
    begin
      for K:= 0 to n do
        begin
          StringGrid1.Cells[0,K+1]:=FloatToStr(K);
          StringGrid1.Cells[1,K+1]:=FloatToStr(Terminos[K]);
          StringGrid1.Cells[2,K+1]:=FloatToStr(Sumas[K]);
          StringGrid1.Cells[3,K+1]:=FloatToStr(Valor_de_Verdad);
          StringGrid1.Cells[4,K+1]:=FloatToStr(Error_Absoluto[K]);
          StringGrid1.Cells[5,K+1]:=FloatToStr(Error_Relativo[K]);
          StringGrid1.Cells[6,K+1]:=FloatToStr(Diferencia[K]);
        end;
    end;

  //Si es LN natural y X tiene un valor mayor a cero muestra los datos
  If  (ListBox1.Selected[3]=True) and (txtValorX.Text>'0')then
  begin
    StringGrid1.Cells[0,1]:='0';
    StringGrid1.Cells[1,1]:='0';
    StringGrid1.Cells[2,1]:='0';
    StringGrid1.Cells[3,1]:=FloatToStr(Logaritmo_N);
    StringGrid1.Cells[4,1]:=FloatToStr(Logaritmo_N);;
    StringGrid1.Cells[5,1]:='1';
    StringGrid1.Cells[6,1]:=FloatToStr(Logaritmo_N-1);

    for K:= 1 to n do
      begin
          StringGrid1.Cells[0,K+1]:=FloatToStr(K);
          StringGrid1.Cells[1,K+1]:=FloatToStr(Terminos[K]);
          StringGrid1.Cells[2,K+1]:=FloatToStr(Sumas[K]);
          StringGrid1.Cells[3,K+1]:=FloatToStr(Valor_de_Verdad);
          StringGrid1.Cells[4,K+1]:=FloatToStr(Error_Absoluto[K]);
          StringGrid1.Cells[5,K+1]:=FloatToStr(Error_Relativo[K]);
          StringGrid1.Cells[6,K+1]:=FloatToStr(Diferencia[K]);
      end;
  end;
  end;
  if ((ListBox1.Selected[0]=False) and (ListBox1.Selected[1]=False)and (ListBox1.Selected[2]=False)and (ListBox1.Selected[3]=False) and (ListBox1.Selected[4]=False))then
  begin
      showmessage('Debe Seleccionar una función');
  end;

  //Si no se ingresa un valor a la X para calcular, se muestra un mensaje
  If (txtValorX.Text='') then
  begin
    showmessage('Debe ingresar un Valor a X');
  end;
end;

procedure TForm1.SalirClick(Sender: TObject);
begin
   Close;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin

    if (ListBox1.Selected[0]=True)then
    begin
        txtVal_Verdadero.Text:='';
        Mensaje.Caption:='';
        txtValorX.Enabled:=True;
        txtValorX.SetFocus;
    end;

    if (ListBox1.Selected[1]=True)then
    begin
        txtVal_Verdadero.Text:='';
        Mensaje.Caption:='';
        txtValorX.Enabled:=True;
        txtValorX.SetFocus;
    end ;

    if (ListBox1.Selected[2]=True)then
    begin
        txtVal_Verdadero.Text:='';
        Mensaje.Caption:='';
        txtValorX.Enabled:=True;
        txtValorX.SetFocus;
    end;

    if (ListBox1.Selected[3]=True)then
    begin
        txtVal_Verdadero.Text:='';
        Mensaje.Caption:='Ingrese un número > 0';
        txtValorX.Enabled:=True;
        txtValorX.SetFocus;
    end;

    if (ListBox1.Selected[4]=True)then
    begin
        txtVal_Verdadero.Text:='';
        Mensaje.Caption:='';
        txtValorX.Enabled:=True;
        txtValorX.SetFocus;
    end;

end;

procedure TForm1.txtValorXKeyPress(Sender: TObject; var Key: Char);
begin
      if ((key<chr(16))or (key>chr(16)))and((key<chr(44))or (key>chr(45)))and((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;

      if txtValorX.Text='Ingrese un número' then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;

end;

procedure TForm1.BorrarClick(Sender: TObject);

  Var
  K: Integer;

begin
      txtValorX.Text:='';
      txtVal_Verdadero.Text:='';
      for K:=0 to 30 do
      begin
        StringGrid1.Cells[0,K+1]:='';
        StringGrid1.Cells[1,K+1]:='';
        StringGrid1.Cells[2,K+1]:='';
        StringGrid1.Cells[3,K+1]:='';
        StringGrid1.Cells[4,K+1]:='';
        StringGrid1.Cells[5,K+1]:='';
        StringGrid1.Cells[6,K+1]:='';
      end;
end;

end.




