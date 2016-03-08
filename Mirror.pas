unit Mirror;

interface

uses
  forms, windows, sysutils, graphics, System.Classes, Unit1;

type
  // THalfToneOption =(AutoHalftone,  UseHalftone, NoHalftone);
  TMirrorDrawer = class(TThread)
  private
    bmp: Tbitmap;
    Icon: TIcon;

    procedure ScreenShot2(var destBitmap: Tbitmap);
    procedure DrawCursor(ScreenShotBitmap: Tbitmap);

  protected
    procedure Execute; override;
  public
    IncludeMouse: Boolean;
    Monitor: TMonitor;
    MirrorMonitor: TMonitor;
    UseHalfTone: Boolean;
       VerticalInvert: Boolean;
    // HalfToneMode: THalfToneOption;
    constructor Create(mon: TMonitor; monmirr: TMonitor);
    destructor Destroy; override;

  end;

implementation

constructor TMirrorDrawer.Create(mon: TMonitor; monmirr: TMonitor);
begin

  Monitor := mon;
  if (monmirr = nil) then
    MirrorMonitor := mon
  else
    MirrorMonitor := monmirr;

  self.FreeOnTerminate := true;
  inherited Create(true);

  UseHalfTone := false;

  bmp := Tbitmap.Create;

  bmp.PixelFormat := TPixelformat.pf16bit;
  bmp.SetSize(MirrorMonitor.width, MirrorMonitor.height);

end;

procedure TMirrorDrawer.ScreenShot2(var destBitmap: Tbitmap);
var
  wOrig, hOrig: integer;
  DC: HDC;
  hWin: Cardinal;
  r: TRect;
  w, h: integer;
  pt: Tpoint;
begin
  w := destBitmap.width;
  h := destBitmap.height;
  hWin := GetDesktopWindow;

  DC := GetDC(hWin);
  // wOrig := GetDeviceCaps (DC, HORZRES) ;
  // hOrig := GetDeviceCaps (DC, VERTRES) ;

  wOrig := Monitor.width;
  hOrig := Monitor.height;

  if (UseHalfTone) then
  begin

    GetBrushOrgEx(destBitmap.Canvas.Handle, pt);
    SetStretchBltMode(destBitmap.Canvas.Handle, HALFTONE);
    SetBrushOrgEx(destBitmap.Canvas.Handle, pt.x, pt.y, @pt);

  end;
  try

  if(VerticalInvert) then

      StretchBlt(destBitmap.Canvas.Handle,
      0 ,
      h,
      w,
      -h  ,
      DC,
      Monitor.Left,
      Monitor.Top,
      wOrig  ,
      hOrig ,
      SRCCOPY)

      else

       StretchBlt(destBitmap.Canvas.Handle,
      w ,
      0,
      -w,
       h  ,
      DC,
      Monitor.Left,
      Monitor.Top,
      wOrig  ,
      hOrig ,
      SRCCOPY) ;

  finally
    ReleaseDC(hWin, DC);
  end;
end;

procedure TMirrorDrawer.DrawCursor(ScreenShotBitmap: Tbitmap);
var
  r: TRect;
  CI: TCursorInfo;

  II: TIconInfo;
begin
  r := ScreenShotBitmap.Canvas.ClipRect;
  Icon := TIcon.Create;
  try
    CI.cbSize := SizeOf(CI);
    if GetCursorInfo(CI) then
      if CI.Flags = CURSOR_SHOWING then
      begin
        Icon.Handle := CopyIcon(CI.hCursor);
        if GetIconInfo(Icon.Handle, II) then
        begin
          ScreenShotBitmap.Canvas.Draw(ci.ptScreenPos.x - Integer(II.xHotspot) -
            r.Left, ci.ptScreenPos.y - Integer(II.yHotspot) - r.Top, Icon);
        end;
      end;
  finally
    Icon.Free;
  end;
end;

procedure TMirrorDrawer.Execute;
begin
  NameThreadForDebugging('TMirrorDrawer');

  if (UseHalfTone) then
    UseHalfTone := ((Monitor.width <> MirrorMonitor.width) or
      (Monitor.height <> MirrorMonitor.height));

  while not self.Terminated do
  begin


    // bmp.Canvas.Lock;

    // bmp.Canvas.Unlock;

    Synchronize(
      procedure
      begin

        ScreenShot2(bmp);

        if (IncludeMouse) then
          DrawCursor(bmp);
        Form1.Image1.Picture.Assign(bmp);
        // Form1.Image1.Invalidate;
        // Form1.Image1.Picture.BitMap.Assign(bmp );
      end);

    sleep(4);

  end;
  { Place thread code here }
end;

destructor TMirrorDrawer.Destroy;
begin
  if (assigned(bmp)) then
    bmp.Free;
  inherited Destroy;
end;

end.
