//*** voi 2013 stmerge (2014-12-26_1)
type int=longint;

const inf=high(int64);

var f, c: array[0..1000, 0..1000] of int64;
    n, m: int;

procedure main; forward;

procedure nhap;
var f: text;
    k, t: int;
    i, j: int;
begin
    assign(f, '');
    reset(f);
    readln(f, t);
    for k:=1 to t do begin
        readln(f, m, n);
        for i:=1 to m do begin
            for j:=1 to n do read(f, c[i, j]);
            readln(f);
        end;
        main;
    end;
    close(f);
end;

procedure main;
var i, j, u, v: int;
begin
    for i:=1 to n do begin
        f[0, i]:=0;
    end;
    for i:=1 to m do begin
        f[i, 0]:=0;
    end;

    for i:=1 to m do begin
        for j:=1 to n do begin
            f[i, j]:=inf;
            for u:=i-1 downto 0 do begin
                for v:=j-1 downto 0 do begin
                    if f[i, j]>f[u, v]+c[u, v+1]+c[u+1, j] then begin
                        f[i, j]:=f[u, v]+c[u, v+1]+c[u+1, j];
                    end;
                    if f[i, j]>f[u, v]+c[u+1, v]+c[i, v+1] then begin
                        f[i, j]:=f[u, v]+c[u+1, v]+c[i, v+1];
                    end;
                end;
            end;
        end;
    end;
    writeln(f[m, n]);
end;

begin
nhap;
end.

