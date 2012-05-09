unit ResMngr; {More like texture manager right now}

{$I config.inc}

interface

uses
	zglHeader, NamedList, Texture;

function GetTexture(name: string): TTexture;

implementation

var
    textures: TNamedList;

function GetTexture(name: string): TTexture;
begin
    result := TTexture(textures.Find(name));
    if result <> nil then exit;
    result := TTexture.Create(name);
    textures.Add(result);
end;

initialization

textures := TNamedList.Create();

end.
