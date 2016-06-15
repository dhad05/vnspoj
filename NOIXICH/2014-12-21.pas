//*** noixich spoj (2014-12-21)
var n: integer;
    a: array[1..20000] of integer;

procedure qsort;
var x, tmp: integer;

    procedure sort(l, r: integer);
    var i, j: integer;
    begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2];
        while i<=j do begin
            while a[i]<x do i:=i+1;
            while a[j]>x do j:=j-1;
            if i<=j then begin
                tmp:=a[i];
                a[i]:=a[j];
                a[j]:=tmp;
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

procedure nhap;
var f: text;
    i:integer;
begin
assign(f, 'a.inp');
reset(f);
readln(f, n);
for i:=1 to n do begin
    if seekeoln(f) then readln(f);
    read(f, a[i]);
end;
close(f);
end;

procedure xl;
var kq, i, num1, num, du, this: integer;
begin
    kq:=n-1;
    num1:=0;
    for i:=1 to n do begin
        num1:=num1+a[i];
        num:=n-i;
        num:=num-num1;
        if num>=1 then this:=num1+num-1
        else begin
            du:=-num+1;
            if du<a[i] then this:=n-i+1
            else break;
        end;
        if kq>this then kq:=this;
    end;
    writeln(kq);
end;

begin
    nhap;
    qsort;
    xl;
end.
