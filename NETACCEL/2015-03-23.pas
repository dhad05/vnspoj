//*** NETACCEL spoj (2015-03-23)
var g: text;
    a: array[1..1000, 1..1000] of real;
    f: array[1..15000] of real;
    pow: array[0..10] of real;
    free: array[1..15000] of longint;
    n, m, k, u, v, i, j, imin: longint;
    c, min: real;

begin
assign(g, 'netaccel.inp');
reset(g);
readln(g, n, m,k);
pow[0]:=1.0;                          //init real pow[]
for i:=1 to k do pow[i]:=pow[i-1]*2; //
for i:=1 to n do for j:=1 to n do a[i, j]:=1e9; //init real a[][]
for i:=1 to n do a[i, i]:=0;                   //
for i:=1 to m do begin
    readln(g, u, v, c);
    a[u, v]:=c;
    a[v, u]:=c;
end;
close(g);
m:=n*(k+1)+k;                             // number of node (virtual)
for i:=1 to m do f[i]:=1e9;               //init real f[]
f[1*(k+1)]:=0;                          //we start at (1,0)
fillchar(free, sizeof(free), 0); //init longint free[]
while true do begin
    min:=1e9;
    for i:=1 to m do if (free[i]=0)and(f[i]<min) then begin
        min:=f[i];
        imin:=i;
    end;
    free[imin]:=1;
    if imin=m then break;
    for j:=1 to n do if a[imin div (k+1), j]<>1e9 then begin
        for i:=j*(k+1)+imin mod (k+1) to j*(k+1)+k do begin
            if f[i] > f[imin]+a[imin div (k+1), j] / pow[i mod (k+1)-imin mod (k+1)] then begin
                f[i]:=f[imin]+a[imin div (k+1), j] / pow[i mod (k+1)-imin mod (k+1)];
            end;
        end;
    end;
end;
writeln(f[m]:0:2);   //we end at (n,k)
end.