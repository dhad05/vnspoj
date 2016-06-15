//*** ALAKE spoj (2015-03-27)
type int=longint;
     link=^node;
     node=record
        next, prev: link;
        id: int;
        w, h: int64;
     end;
const inf=1232100000000;

var f: text;
    n: int;
    a, b: link;
    kq: array[0..100001] of int64;

function newlink(id: int; w, h: int64; prev, next: link): link;forward;

procedure nhap;
var i, w, h: int;
    t: link;
begin
    assign(f, 'alake.inp');
    reset(f);
    readln(f, n);
    if n=0 then exit;
    a:=newlink(0, 0, inf, nil, nil);
    t:=a;
    for i:=1 to n do begin
        readln(f, w, h);
        newlink(i, w, h, t, nil);
        t:=t^.next;
    end;
    b:=newlink(n+1, 0, inf, t, nil);
    close(f);
end;

function newlink(id: int; w, h: int64; prev, next: link): link;
begin
    new(newlink);
    newlink^.id:=id;
    newlink^.w:=w;
    newlink^.h:=h;
    newlink^.next:=next;
    newlink^.prev:=prev;
    if next<>nil then next^.prev:=newlink;
    if prev<>nil then prev^.next:=newlink;
end;

procedure xl;
var t, k: link;
    time: int64;
    i, c: int;
begin
    t:=a^.next;
    k:=a;
    while t<>b do begin
        if t^.h<k^.h then k:=t;
        t:=t^.next;
    end;
    c:=0;
    time:=0;
    while true do begin
        kq[k^.id]:=time+k^.w;
        c:=c+1;
        if c=n then break;
        if k^.prev^.h<k^.next^.h then begin
            t:=k^.prev;
            t^.next:=k^.next;
            k^.next^.prev:=t;
        end else begin
            t:=k^.next;
            t^.prev:=k^.prev;
            k^.prev^.next:=t;
        end;
        time:=time+k^.w*(t^.h-k^.h);
        t^.w:=t^.w+k^.w;
        k:=t;
        if (k^.next^.h<k^.prev^.h)and(k^.next^.h<k^.h) then begin
            while k^.h>k^.next^.h do k:=k^.next;
        end else if (k^.prev^.h<k^.next^.h)and(k^.prev^.h<k^.h) then begin
            while k^.prev^.h<k^.h do k:=k^.prev;
        end;
    end;
    for i:=1 to n do writeln(kq[i]);
end;

begin
nhap;
if n<>0 then xl;
end.