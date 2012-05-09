unit List;

{$I config.inc}

interface

type
    TListItem = class
    private
        _next: TListItem;
        _prev: TListItem;
    
    public
        property Next: TListItem
            read _next
            write _next;
        property Prev: TListItem
            read _prev
            write _prev;
    end;
    
    TList = class
    private
        _head: TListItem;
        _tail: TListItem;
        
        
    public    
        property Head: TListItem
            read _head
            write _head;
        property Tail: TListItem
            read _tail
            write _tail;
        
        function Count: integer;
        procedure Add(item: TListItem);
        
        constructor Create();
    end;

procedure SwapItems(left, right: TListItem);

implementation

constructor TList.Create();
begin
    _head := nil;
    _tail := nil;
end;

procedure TList.Add(item: TListItem);
begin
    if _head = nil then begin
        _head := item;
        item.Prev := nil;
        item.Next := nil;
        _tail := item;
    end else begin
        _tail.Next := item;
        item.Prev := _tail;
        item.Next := nil;    
        _tail := item;
    end;
end;

function TList.Count: integer;
var
    iter: TListItem;
    itemCount: integer = 0;
begin
    iter := _head;
    while (iter <> nil) do begin
        iter := iter.Next;
        inc(itemCount);
    end;
    
    Result := itemCount;
end;

procedure SwapItems(left, right: TListItem);
var
    tmp: TListItem;
begin
    tmp := left.Prev;
    left.Prev := right.Prev;
    right.Prev := tmp;
    
    tmp := left.Next;
    left.Next := right.Next;
    right.Next := tmp;
end;

end.
