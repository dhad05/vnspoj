//*** spoj nklp (2015-03-16)
type int=longint;
var a: array[0..100001] of int;
    vt: array[0..1000, 0..100001] of int;
    n, m, i, kq, vt1: int;
    f: text;

var min, max, this: int;
    try: byte;

procedure xl(l, r: int; deep: word);
var i, m: int;
begin
min:=r-l+1;
for i:=0 to min do vt[deep, i]:=0;
try:=0;
max:=0;
for i:=l to r do if a[i]<=min then begin
    if vt[deep, a[i]]=0 then begin
        vt[deep, a[i]]:=i;
        if a[i]<=kq then max:=max+1;
    end else if try=0 then begin
        this:=i;
        try:=1;
    end;
end;
if (vt[deep, kq+1]=0)or(max<kq) then exit;

if try=1 then begin
    i:=this;
    vt[deep, 1]:=vt[deep, a[i]];
    this:=a[vt[deep, 1]];
    m:=1;
    for i:=i to r do if a[i]=this then begin
        m:=m+1;
        vt[deep, m]:=i;
    end;
    vt[deep, 0]:=l-1;
    vt[deep, m+1]:=r+1;
    for i:=1 to m do if (vt[deep, i-1]<vt1)and(vt1<vt[deep, i+1]) then
        xl(vt[deep, i-1]+1, vt[deep, i+1]-1, deep+1);
end else begin
    min:=vt[deep, 1];
    max:=vt[deep, 1];
    this:=0;
    for i:=1 to n do begin
        if vt[deep, i]=0 then break;
        if min>vt[deep, i] then min:=vt[deep, i];
        if max<vt[deep, i] then max:=vt[deep, i];
        if max-min=i-1 then this:=i;
    end;
    if kq<this then kq:=this;
end;
end; //end of xl;

begin
assign(f, 'nklp.inp');
reset(f);
readln(f, n);
m:=0;
for i:=1 to n do begin
    read(f, a[i]);
    if a[i]=1 then begin
        m:=m+1;
        vt[0, m]:=i;
    end;
end;
close(f);
vt[0, 0]:=0;
vt[0, m+1]:=n+1;
kq:=0;
for i:=1 to m do begin
    vt1:=vt[0, i];
    xl(vt[0, i-1]+1, vt[0, i+1]-1, 1);
end;
writeln(kq);
end.