//*** spoj: TAYTRUC 2015-02-27_1
uses math;
type int=longint;

var n, m, i, j, k: int;
    x, g: array[0..10000] of int;
    f: text;

begin
    assign(f, 'taytruc.inp');
    reset(f);
    readln(f, n, m);
    x[0]:=0;
    for i:=1 to n do begin
        readln(f, x[i]);
        x[i]:=x[i-1]+x[i];
    end;
    close(f);
    g[0]:=0;
    g[1]:=0;
    for i:=2 to n do begin
        g[i]:=0;
        for j:=1 to m do begin
            if i-j*2>=0 then g[i]:=max(g[i], g[i-j*2]+x[i-j]-x[i-j*2]);
            if i-j*2+1>=0 then g[i]:=max(g[i], g[i-j*2+1]+x[i-j]-x[i-j*2+1]);
        end;
    end;
    writeln(g[n]);
end.
