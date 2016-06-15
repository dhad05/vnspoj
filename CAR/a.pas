type int=longint;
var a,b: array[1..10000] of int64;
    id: array[1..10000] of int;
    n: int;

procedure qsort();
var xa,xb: int64;
    tmp: int64;
    i: int;
    procedure sort(l,r: int);
    var i,j: int;
    begin
        i:=l;
        j:=r;
        tmp:=l+random(r-l+1);
        xa:=a[tmp];
        xb:=b[tmp];
        while i<=j do begin
            while a[i]*xb>xa*b[i] do inc(i);
            while a[j]*xb<xa*b[j] do dec(j);
            if i<=j then begin
                tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
                tmp:=b[i];b[i]:=b[j];b[j]:=tmp;
                tmp:=id[i];id[i]:=id[j];id[j]:=tmp;
                inc(i); dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
    for i:=1 to n do id[i]:=i;
    sort(1,n);
end;

procedure main();
var f: text;
    d,kq: int64;
    i: int;
begin
    readln(n);
    for i:=1 to n do read(a[i]);
    for i:=1 to n do read(b[i]);
    qsort();
    kq:=0;
    d:=0;
    for i:=1 to n do begin
        d:=d+b[i];
        kq:=kq+d*a[i];
    end;
    writeln(kq);
    for i:=1 to n do write(id[i],' ');
end;

begin
randomize();
main();
end.
