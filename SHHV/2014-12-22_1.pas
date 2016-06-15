//*** shhv spoj (2014-12-22_1)

var n: byte;
    a, b, x: array[1..12] of byte;
    m, t: int64;
    f: array[0..12, 0..12] of int64;
    g: array[0..12] of int64;

procedure shift(j: byte);
var i: byte;
begin
    for i:=j to n-1 do x[i]:=x[i+1];
end;
function num(j: byte): byte;
var i: byte;
begin
    for i:=1 to n do if x[i]=j then exit(i);
end;

procedure initf;
var d: int64;
    i, j: byte;
begin
    d:=1;
    fillchar(g, sizeof(g), 0);
    fillchar(f, sizeof(f), 0);
    for i:=1 to n do begin
        g[i]:=g[i-1]+d*i;
        f[i, 0]:=g[i-1];
        for j:=1 to i do begin
            f[i, j]:=f[i, j-1]+d;
        end;
        d:=d*i;
    end;
end;

procedure task1;
var i, j: byte;
begin
    for i:=1 to n do x[i]:=i;
    t:=1;
    for i:=1 to n do begin
        j:=num(a[i]);
        shift(j);
        t:=t+f[n-i+1, j-1]-g[n-i];
    end;
    writeln(t);
end;

procedure task2; //find b from m
var i, j: byte;
begin
    for i:=1 to n do x[i]:=i;
    m:=m+g[n-1];
    for i:=1 to n do begin
        for j:=n-i+1 downto 1 do begin
            if m>f[n-i+1, j-1] then begin
                b[i]:=x[j];
                shift(j);
                m:=m-(f[n-i+1, j]-g[n-i]);
                break;
            end;
        end;
    end;
    for i:=1 to n do write(b[i], ' ');
end;

procedure nhap;
var f: text;
begin
    assign(f, 'shhv.inp');
    reset(f);
    n:=0;
    while not seekeoln(f) do begin
        n:=n+1;
        read(f, a[n]);
    end;
    readln(f);
    read(f, m);
    close(f);
end;

begin
nhap;
initf;
task1;
task2;
end.
