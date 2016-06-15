//*** robocon voi 2012 (2014-12-29)
//*** 60%

type int=integer;

const inf=30000;

var n: int;
    b: array[0..501, 0..501] of shortint;
    min1, max1, min2, max2: array[0..501, 0..501] of int;

function fmin(a, b, c: int): int;
begin
    fmin:=a;
    if b<fmin then fmin:=b;
    if c<fmin then fmin:=c;
end;
function fmax(a, b, c: int): int;
begin
    fmax:=a;
    if b>fmax then fmax:=b;
    if c>fmax then fmax:=c;
end;

procedure calc;
var i, j: int;
begin
    for i:=0 to n+1 do for j:=0 to n+1 do begin
        min1[i,j]:=inf;
        min2[i, j]:=inf;
        max1[i, j]:=-1;
        max2[i, j]:=-1;
    end;
    min1[0,0]:=0;
    for i:=1 to n do for j:=1 to n do if b[i, j]<>1 then begin
        min1[i, j]:=fmin(min1[i-1, j], min1[i, j-1], min1[i-1, j-1])+1;
        max1[i, j]:=fmax(max1[i-1, j], max1[i, j-1], max1[i-1, j-1])+1;
    end;

    min2[0,n+1]:=0;
    for i:=1 to n do for j:=n downto 1 do if b[i, j]<>1 then begin
        min2[i, j]:=fmin(min2[i-1, j], min2[i, j+1], min2[i-1, j+1])+1;
        max2[i, j]:=fmax(max2[i-1, j], max2[i, j+1], max2[i-1, j+1])+1;
    end;

    {for i:=1 to n do for j:=1 to n do if b[i, j]<>1 then begin
        min1[i,j]:=min1[i,j]-1;
        min2[i,j]:=min2[i,j]-1;
        max1[i,j]:=max1[i,j]-1;
        max2[i,j]:=max2[i,j];
    end;                    }

    {for i:=1 to n do begin
        for j:=1 to n do write(min2[i,j], ' ');
        writeln;
    end;}
end;

function xxx(i, j: int): int;
var x1, x2, y1, y2: int;
begin
    if b[i, j]=1 then exit(inf);
    if (max1[i, j]<0)or(max2[i, j]<0) then exit(inf);
    if (min1[i,j]>=inf)or(min2[i,j]>=inf) then exit(inf);

    if min1[i, j]<=min2[i, j] then begin
        x1:=min1[i,j];
        y1:=max1[i,j];
        x2:=min2[i,j];
        y2:=max2[i,j];
    end else begin
        x1:=min2[i,j];
        y1:=max2[i,j];
        x2:=min1[i,j];
        y2:=max1[i,j];
    end;

    if (x1<=x2)and(x2<=y1) then exit(x2) else exit(inf);
end;

procedure xl;
var i, j, min, this: int;
begin
    min:=inf;
    for i:=1 to n do for j:=1 to n do begin
        this:=xxx(i, j);
        if min>this then min:=this;
    end;
    writeln(min-1);
end;

procedure nhap;
var f: text;
    i, j, t, k: int;
begin
    assign(f, 'robocon.inp');
    reset(f);
    readln(f, n, k);
    fillchar(b, sizeof(b), 0);
    for t:=1 to k do begin
        readln(f, i, j);
        b[i, j]:=1;
    end;
    close(f);
end;

begin
nhap;
calc;
xl;
end.
