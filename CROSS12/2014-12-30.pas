//*** cross12 voi 2012 (2014-12-30)
uses math;
type int=longint;

var n, m: int;
    d, a, f: array[0..10001] of int;
    b: array[0..100001] of char;

function time(d: int): int;
var this, l: int;
begin
    l:=0;
    time:=1;
    while l<m+1-d do begin
        this:=l+d;
        while b[this]='1' do this:=this-1;
        l:=this;
        time:=time+1;
    end;
end;

procedure qsort;
var x, tmp: int;

    procedure sort(l, r: int);
    var i, j: int;
    begin
        i:=l;
        j:=r;
        x:=d[(l+r) div 2];
        while i<=j do begin
            while d[i]>x do i:=i+1;
            while d[j]<x do j:=j-1;
            if i<=j then begin
                tmp:=d[i];
                d[i]:=d[j];
                d[j]:=tmp;
                i:=i+1;
                j:=j-1;
            end;
        end;
        if l<j then sort(l, j);
        if i<r then sort(i, r);
    end;
begin
    sort(1, n);
end;

procedure main;
var i: int;
    kq: int64;
begin
    qsort;
    a[1]:=time(d[1]);
    for i:=2 to n do begin
        if d[i]=d[i-1] then a[i]:=a[i-1]
        else a[i]:=time(d[i]);
    end;

    f[1]:=a[1];
    f[2]:=a[2];
    for i:=3 to n do begin
        f[i]:=min(f[i-2]+2*a[2]+a[i]+a[1], f[i-1]+a[i]+a[1]); //googled
    end;
    writeln(f[n]);
end;

procedure nhap;
var f: text;
    i: int;
begin
    assign(f, '');
    reset(f);
    readln(f, n, m);
    for i:=1 to n do read(f, d[i]);
    readln(f);
    b[0]:='0';
    b[m+1]:='0';
    for i:=1 to m do read(f, b[i]);
    close(f);
end;

begin
nhap;
main;
end.
