unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btn_cargar: TButton;
    btn_aprobados: TButton;
    btn_promedio: TButton;
    combox_estu: TComboBox;
    edt_name: TEdit;
    edt_nota: TEdit;
    lbl_promedio: TLabel;
    lbl_aprobado: TLabel;
    lbl_name: TLabel;
    lbl_nota: TLabel;
    lbl_datos: TLabel;
    procedure btn_cargarClick(Sender: TObject);
    procedure btn_aprobadosClick(Sender: TObject);
    procedure btn_promedioClick(Sender: TObject);
    procedure combox_estuSelect(Sender: TObject);
  private

  public

  end;

const
     max=5;
var
  Form1: TForm1;
  nombres:array[1..max] of string;
  notas:array[1..max] of integer;
  i: integer=1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btn_cargarClick(Sender: TObject);
var
   nota:integer;
   nombre:string;
begin
     nota:=strtoint(edt_nota.text);
     nombre:=edt_name.text;

     notas[i]:=nota;
     nombres[i]:=nombre;
     if i<=5 then
     begin
        lbl_datos.caption:=lbl_datos.caption + nombres[i]+ ', ' +inttostr(notas[i])+#13#10;
        combox_estu.items.add(nombres[i]);
     end
     else
     begin
         showmessage('La cantidad permitida es de solo 5 estudiantes');
     end;
     i:=i+1;
end;

procedure TForm1.btn_aprobadosClick(Sender: TObject);
var
   i,cant_apro:integer;
begin
     cant_apro:=0;

     for i:=1 to max do
     begin
         if notas[i]>=7 then
            cant_apro:=cant_apro+1;
     end;

     lbl_aprobado.caption:=lbl_aprobado.caption + ' ' + inttostr(cant_apro);

end;

procedure TForm1.btn_promedioClick(Sender: TObject);
var
   i,suma:integer;
   promedio:real;
begin
  suma:=0;

  for i:=1 to max do
  begin
       suma:=suma+notas[i];
  end;
  promedio:=suma/max;

  lbl_promedio.caption:=lbl_promedio.caption + ' ' + floattostr(promedio);
end;

procedure TForm1.combox_estuSelect(Sender: TObject);
var
   posicion: integer;
begin
     if combox_estu.ItemIndex <> -1 then
     begin
          posicion := combox_estu.ItemIndex + 1;
          showmessage(nombres[posicion] + ', sacó un ' + inttostr(notas[posicion]));
     end;
end;
end.

