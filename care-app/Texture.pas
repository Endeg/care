unit Texture;

{$I config.inc}

interface

uses
    zglHeader, NamedList;
    
type
    TTexture = class(TNamedItem)
    private
        _tex: zglPTexture;
        function getTexture: zglPTexture;
    public
        property Tex: zglPTexture
            read getTexture;
            
        constructor Create(newName: string);
    end;

implementation

constructor TTexture.Create(newName: string);
begin
    inherited Create(newName);
    _tex := nil;
end;

function TTexture.getTexture: zglPTexture;
begin
    if _tex = nil then begin
        _tex := tex_LoadFromFile(Name);
        tex_Filter(_tex, TEX_FILTER_NEAREST);
    end;
    result := _tex;
end;

end.
