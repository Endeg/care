unit NamedList;

{$I config.inc}

interface

uses
    List;

type
    TNamedItem = class(TListItem)
    private
        _name: string;
        _hash: longint;
    public
        property Name: string
            read _name;
        property Hash: longint
            read _hash;
            
        constructor Create(itemName: string);
    end;

    TNamedList = class(TList)
    
    public
        function Find(name: string): TNamedItem;
    end;

implementation

function hashString(inStr: string): longint;
var
    i: integer;
begin
    result := 0;
    
    for i:=0 to length(inStr) do begin
        inc(result, ord(inStr[i]));
        inc(result, result shl 10);
        result := result xor (result shr 6);
    end;
    inc(result, result shl 3);
    result := result xor (result shr 11);
    inc(result, result shl 15);
end;

constructor TNamedItem.Create(itemName: string);
begin
    inherited Create;
    _name := itemName;
    
    _hash := hashString(_name);
end;


function TNamedList.Find(name: string): TNamedItem;
var
    iter: TListItem;
    hash: longint;
begin
    result := nil;

    hash := hashString(name);
    iter := Head;
    
    while iter <> nil do begin
        
        if TNamedItem(iter).Hash = hash then begin
            result := TNamedItem(iter);
            break;
        end;
        
        iter := iter.Next;
    end;
end;

end.
