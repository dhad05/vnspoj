//*** bwpoints voi 2011 (2014-12-26_4)
type int=longint;

var a: array[1..200000] of int;
    b: array[1..200000] of byte;
    n: int;

procedure qsort;
var tmp, x: int;
    tt: byte;

    procedure sort(l, r: int);
    var i, j: int;
    begin
        i:=l;
        j:=r;
        x:=a[(l+r)div 2];
        while i<=j do begin
            while a[i]<x do i:=i+1;
            while a[j]>x do j:=j-1;
            if i<=j then begin
                tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
                tt:=b[i];b[i]:=b[j];b[j]:=tt;
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

procedure xl;
var i, count: int;
begin
    i:=1;
    count:=0;
    while i<n do begin
        if b[i]<>b[i+1] then begin
            count:=count+1;
            i:=i+2;
        end else i:=i+1;
    end;
    writeln(count);
end;

procedure nhap;
var f: text;
    i: int;
begin
    assign(f, '');
    reset(f);
    readln(f, n);
    for i:=1 to n do begin
        read(f, a[i]);
        b[i]:=0;
    end;
    readln(f);
    n:=n*2;
    for i:=(n shr 1)+1 to n do begin
        read(f, a[i]);
        b[i]:=1;
    end;
    close(f);
end;

begin
nhap;
qsort;
xl;
end.
