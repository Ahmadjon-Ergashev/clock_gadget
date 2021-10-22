unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
var soat,minut,sekund,x,y:integer;s:string;alfa:real;
begin
form1.Caption:=timetostr(now);
s:=timetostr(now);
soat:=strtoint(copy(s,1,pos(':',s)-1));delete(s,1,pos(':',s));
minut:=strtoint(copy(s,1,pos(':',s)-1));delete(s,1,pos(':',s));
sekund:=strtoint(copy(s,1,length(s)));
//tozalash
image1.Canvas.Pen.Color:=clwhite;
image1.Canvas.Ellipse(100,100,500,500);
//soat
image1.Canvas.pen.Width:=8;image1.Canvas.Pen.Color:=clgreen;
alfa:=3*pi/2+soat*2*pi/12+minut*2*pi/720;
x:=300+trunc(130*cos(alfa));
y:=300+trunc(130*sin(alfa));
image1.Canvas.MoveTo(300,300);
image1.Canvas.LineTo(x,y);image1.Canvas.Ellipse(x-8,y-8,x+8,y+8);
//minut
image1.Canvas.Pen.Width:=6;image1.Canvas.Pen.Color:=clyellow;
alfa:=3*pi/2+minut*2*pi/60+sekund*2*pi/3600;
x:=300+trunc(180*cos(alfa));
y:=300+trunc(180*sin(alfa));
image1.Canvas.MoveTo(300,300);
image1.Canvas.LineTo(x,y);image1.Canvas.Ellipse(x-5,y-5,x+5,y+5);
//sekund
image1.Canvas.Pen.Width:=2;image1.Canvas.Pen.Color:=clred;
alfa:=3*pi/2+sekund*2*pi/60;
x:=300+trunc(195*cos(alfa));
y:=300+trunc(195*sin(alfa));
image1.Canvas.MoveTo(300,300);
image1.Canvas.LineTo(x,y);image1.Canvas.pen.Width:=5;
image1.Canvas.MoveTo(300,300);

image1.Canvas.Ellipse(x-3,y-3,x+3,y+3);
image1.Canvas.Ellipse(290,290,310,310);
end;

procedure TForm1.FormCreate(Sender: TObject);
var alfa:real;i,x,y:integer;
begin
image1.Canvas.Brush.Color:=claqua;
//image1.Canvas.Rectangle(-5,-5,610,610);
image1.Canvas.pen.Width:=10;
image1.Canvas.Pen.Color:=clblue;
image1.Canvas.ellipse(10,10,590,590);
image1.Canvas.Font.Size:=30;
image1.Canvas.Font.Color:=clpurple;
image1.Canvas.Pen.Width:=4;
alfa:=3*pi/2+pi/6; i:=1;
while alfa<=3*pi/2+2*pi do begin
x:=290+trunc(255*cos(alfa));
y:=275+trunc(250*sin(alfa));
if i>9 then begin x:=x-13;end;
image1.Canvas.TextOut(x,y,inttostr(i));inc(i);
alfa:=alfa+pi/6;
end;alfa:=0;i:=0;
while alfa<=2*pi do begin
x:=300+trunc(220*cos(alfa));
y:=300+trunc(220*sin(alfa));
if i mod 5<>0 then image1.Canvas.Ellipse(x-2,y-2,x+2,y+2) else begin
image1.Canvas.MoveTo(x,y);
image1.Canvas.LineTo(300+trunc(210*cos(alfa)),300+trunc(210*sin(alfa)));end;
alfa:=alfa+2*pi/60;
inc(i);
end;
end;
procedure TForm1.FormShow(Sender: TObject);
begin
showwindow(Application.Handle, sw_hide);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
aboutbox.show;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  const cod=$f012;
begin
ReleaseCapture;
perform(WM_SYSCOMMAND,cod,0);
end;

end.
