//*** parigame voi 2011 (2014-12-31)
type int=integer;

var n: int;
    d, c: array[0..500, 0..500] of int64;
    f: array[0..500, 0..500] of boolean;

procedure main;forward;

procedure nhap;
var f: text;
    k, t, i, j: int;
    x: int64;
begin
    assign(f, '');
    reset(f);
    readln(f, t);
    for i:=0 to n do begin
        d[i,0]:=0;
        d[0,i]:=0;
        c[i,0]:=0;
        c[0,i]:=0;
    end;
    for k:=1 to t do begin
        readln(f, n);
        for i:=1 to n do begin
            for j:=1 to n do begin
                read(f, x);
                d[i,j]:=d[i,j-1]+x;
                c[i,j]:=c[i-1,j]+x;
            end;
            readln(f);
        end;
        main;
    end;
    close(f);
end;

procedure main;
var i,j: int;
begin
    for i:=0 to n do begin
        f[i,0]:=false;
        f[0,i]:=false;
    end;
    for i:=1 to n do for j:=1 to n do begin
        f[i,j]:=false;
        if not odd(d[i,j]) then f[i,j]:=f[i,j] or (not f[i-1,j]);
        if not odd(c[i,j]) then f[i,j]:=f[i,j] or (not f[i,j-1]);
    end;
    if f[n,n] then writeln('YES') else writeln('NO');
end;

begin
nhap;
end.
