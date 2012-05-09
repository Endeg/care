program CareApp;

uses
    zglHeader, ResMngr, Texture;

const
    DEFAULT_WIDTH = 320;
    DEFAULT_HEIGHT = 240;
    DEFAULT_FULLSCREEN = FALSE;

var
    t: TTexture;

procedure Draw;
var
    i: integer;
begin
    //TODO: Lua callback
    for i:=0 to 7 do {c}ssprite2d_Draw(t.Tex, random(DEFAULT_WIDTH), random(DEFAULT_HEIGHT), 64, 64, 0);
end;

procedure Load;
begin
    //TODO: Lua callback
    Randomize;
    log_Add('Jolly good load event!');
    t := GetTexture('things.png');
end;
	
procedure Update(dt: Double);
begin
    //TODO: lua callback
end;
    
procedure Quit;
begin
    //TODO: Lua callback
    log_Add('Jolly good quit event!');
end;
 
procedure Setup;
begin
    zgl_Reg(SYS_LOAD, @Load);
    zgl_Reg(SYS_DRAW, @Draw);
    zgl_Reg(SYS_UPDATE, @Update);
    zgl_Reg(SYS_EXIT, @Quit);

    //TODO: Lua callback
    
    scr_setOptions(DEFAULT_WIDTH, DEFAULT_HEIGHT, REFRESH_DEFAULT, DEFAULT_FULLSCREEN, True);
end;

//Now I don't forget where should I put Lua callbacks!

begin
    zglLoad(libZenGL);
    Setup;
    zgl_Init();
end.
