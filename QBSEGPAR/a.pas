uses math;
type int=longint;
const inf=1000000000;
var n,m,z: int;
    a,s,f: array[0..15000] of int;

procedure qsort();
var x,tmp,i: int;
    procedure sort(l,r: int);
    var i,j: int;
    begin
        i:=l; j:=r;
        x:=s[l+random(r-l+1)];
        while i<=j do begin
            while s[i]<x do inc(i);
            while s[j]>x do dec(j);
            if i<=j then begin
                tmp:=s[i]; s[i]:=s[j]; s[j]:=tmp;
                inc(i); dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
    for i:=1 to n do s[i]:=a[i];
    sort(1,n);
    z:=1;
    for i:=2 to n do if s[i]<>s[i-1] then begin
        inc(z);
        s[z]:=s[i];
    end;
end;

function get(i: int): int;
begin
    get:=f[i];
    while i<=z do begin
        get:=max(get,f[i]);
        i:=i+(i and(-i));
    end;
end;
procedure up(i,k: int);
begin
    while i>0 do begin
        f[i]:=max(f[i],k);
        i:=i-(i and(-i));
    end;
end;

function find(k: int): int;
var l,r,i: int;
begin
    l:=1;
    r:=z-1;
    while l<=r do begin
        i:=(l+r) div 2;
        if s[i]>=k then r:=i-1
        else l:=i+1;
    end;
    exit(l);
end;

function check(k: int): boolean;
var i,this: int;
begin
    for i:=1 to z do f[i]:=-inf;
    for i:=1 to n do begin
        this:=get(find(a[i]-k))+1;
        if a[i]<=k then this:=max(this,1);
        up(find(a[i]),this);
    end;
    if this<m then exit(false);
    for i:=1 to z do f[i]:=-inf;
    for i:=1 to n do begin
        this:=-get(find(a[i]-k))+1;
        if a[i]<=k then this:=min(this,1);
        up(find(a[i]),-this);
    end;
    if this>m then exit(false);
    exit(true);
end;

procedure main();
var i,l,r: int;
begin
    readln(n,m);
    for i:=1 to n do readln(a[i]);
    for i:=2 to n do a[i]:=a[i-1]+a[i];
    qsort();
    l:=-inf;
    r:=inf;
    while l<=r do begin
        i:=(l+r) div 2;
        if check(i) then r:=i-1
        else l:=i+1;
    end;
    writeln(l);
end;

begin
randomize();
main();
end.