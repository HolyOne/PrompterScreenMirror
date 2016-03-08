unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Mirror;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;

    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private

    { Private declarations }
  public
        mn: TMirrorDrawer;
    { Public declarations }
  end;

var
  Form2: TForm2;

  PrmMonitor: Tmonitor;
  SecMonitor: Tmonitor;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.FormCreate(Sender: TObject);
var
  i: integer;
  flagchar: string;
begin
  mn := nil;
  PrmMonitor := nil;
  SecMonitor := nil;

  for I := 0 to Screen.MonitorCount - 1 do
  begin
    flagchar := '   ';
    if not(Screen.Monitors[i].Primary) then
    begin
      if (SecMonitor = nil) then
      begin
        SecMonitor := Screen.Monitors[i];
        flagchar := '(S)';
      end;
    end
    else
      flagchar := '(P)';

    Memo1.Lines.Add('Mon' + inttostr(Screen.Monitors[i].MonitorNum) + flagchar +
      ' X:' + inttostr(Screen.Monitors[i].Left) + #9'Y:' +
      inttostr(Screen.Monitors[i].Top) + #9'W:' +
      inttostr(Screen.Monitors[i].Width) + #9'H:' +
      inttostr(Screen.Monitors[i].Height))

  end;

  PrmMonitor := Screen.PrimaryMonitor;

  mn := TMirrorDrawer.Create(PrmMonitor, SecMonitor); // PrmMonitor

end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  mn.Terminate;

end;

procedure TForm2.FormShow(Sender: TObject);
begin

  with PrmMonitor do
  begin
    self.Left := Left + (Width div 2) - (self.Width div 2);
    self.Top := Top + (Height div 2) - (self.Height div 2)
  end

end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  mn.Suspend;
end;

procedure TForm2.Button3Click(Sender: TObject);

begin

  {
    if( assigned(mn)) then begin
    mn.Terminate;
    freeandnil(mn);

    end; }

  mn.Resume;

  // bmp.Free;
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  mindex: integer;

begin

  // PrmMonitor:=nil;
  // SecMonitor:=nil;
  mn.UseHalfTone := CheckBox2.Checked;

  if Screen.MonitorCount > 1 then
  begin

    with SecMonitor do
    begin

      // Form1.left := left +(width div 2) -(Form1.width div 2);
      // Form1.top := top +(height div 2) -(Form1.height div 2);
      Form1.Show;

      Form1.Left := Left + (Width div 2) - (Form1.Width div 2);
      Form1.Top := Top + (Height div 2) - (Form1.Height div 2);

      Form1.WindowState := wsMaximized;
      mn.Resume;
    end

  end
  else
  begin

    Form1.Show;
    mn.Resume;
  end;
  label1.Caption:='Active';
  label1.Font.Color:=clgreen;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  mn.IncludeMouse := CheckBox1.Checked;
  CheckBox1.Invalidate;
  CheckBox1.repaint;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
if( Assigned(mn)) then mn.UseHalfTone:=(sender as tcheckbox).checked;
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
begin
  if( Assigned(mn)) then mn.VerticalInvert:=(sender as tcheckbox).checked;
end;
  {
procedure swapbmp(bmp: Tbitmap);
var
  b: Tbitmap;
  X, Y: Integer;
  SrcRect, DstRect: TRect;

begin
  // Assumes that Image1 holds the bitmap to be flipped
  X := bmp.Width;
  Y := bmp.Height;
  SrcRect := Rect(0, 0, X, Y);
  DstRect := Rect(X, 0, 0, Y); // <===== Mark this !!!

  b := Tbitmap.Create();

  b.Width := X;
  b.Height := Y;
  // DummyImage.Canvas.CopyMode := cmSrcCopy
  b.Canvas.CopyRect(DstRect, bmp.Canvas, SrcRect);
  // Write it back to the original bitmap
  bmp.Assign(b);
  b.Free;
end;   }

end.
