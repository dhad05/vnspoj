type int=longint;
var n,m: int;
    a,b,c: array[1..200001] of int;

procedure sort(l,r: int);
var tmp,x,i,j: int;
begin
    i:=l; j:=r;
    x:=c[l+random(r-l+1)];
    while i<=j do begin
        while c[i]<x do inc(i);
        while c[j]>x do dec(j);
        if i<=j then begin
            tmp:=c[i];c[i]:=c[j];c[j]:=tmp;
            inc(i); dec(j);
        end;
    end;
    if l<j then sort(l,j);
    if i<r then sort(i,r);
end;

function find(i,k: int): int;
var l,r,j: int;
begin
    l:=b[i];
    r:=b[i+1]-1;
    while l<=r do begin
        j:=(l+r) div 2;
        if c[j]<=k then l:=j+1
        else r:=j-1;
    end;
    exit(r-b[i]+1);
end;

function check(t: int): boolean;
var i,this: int;
begin
    this:=0;
    for i:=n downto 1 do begin
        t:=t-a[i];
        this:=this+find(i,t);
        if this>=m then exit(true);
    end;
    exit(false);
end;

procedure main();
var fi: text;
    i,j,this: int;
    l,r: int64;
begin
    assign(fi,'');
    reset(fi);
    readln(fi,n,m);
    this:=1;
    for i:=1 to n do begin
        read(fi,a[i]);
        read(fi,b[i]);
        for this:=this to this+b[i]-1 do read(fi,c[this]);
        this:=this+1;
        b[i]:=this-b[i];
    end;
    b[n+1]:=this;
    close(fi);


    for i:=1 to n do sort(b[i],b[i+1]-1);
    l:=1;
    r:=high(int);
    while l<=r do begin
        i:=(l+r) div 2;
        if check(i) then r:=i-1
        else l:=i+1;
    end;
    writeln(l);
end;

begin
main();
end.