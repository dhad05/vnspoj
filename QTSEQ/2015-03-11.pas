//*** QTSEQ spoj (2015-03-11)
uses math;
type int=longint;
var  a: array[1..1000000] of int;
     sum, ti, tj, tjmin, tjmax, kq, kq2, kq1, kq3, numjmin, numjmax: int64;
     n, i: int;
     f: text;

begin
assign(f, 'qtseq.inp');
reset(f);
readln(f, n);
sum:=0;
for i:=1 to n do begin
    read(f, a[i]);
    inc(sum, a[i]);
end;
close(f);

ti:=sum-a[n];
tjmax:=a[n];numjmax:=1;
tjmin:=a[n];numjmin:=1;
kq:=-1;kq1:=0;kq2:=-1;kq3:=0;
for i:=n-1 downto 1 do begin
    if tjmin=tjmax then begin
        kq:=abs(tjmax-ti);
        inc(kq1, numjmax);
    end else begin
        tj:=tjmax-ti;
        if tj=kq then inc(kq1, numjmax)
        else if tj>kq then begin
            kq:=tj;
            kq1:=1;
        end;
        tj:=ti-tjmin;
        if tj=kq2 then inc(kq3, numjmin)
        else if tj>kq2 then begin
            kq2:=tj;
            kq3:=1;
        end;
    end;
    dec(ti, a[i]);
    tj:=sum-ti;
    if tj=tjmax then inc(numjmax)
    else if tj>tjmax then begin
        tjmax:=tj;
        numjmax:=1;
    end;
    if tj=tjmin then inc(numjmin)
    else if tj<tjmin then begin
        tjmin:=tj;
        numjmin:=1;
    end;
end;

if kq>kq2 then writeln(kq, ' ', kq1)
else if kq<kq2 then writeln(kq2, ' ', kq3)
else writeln(kq, ' ', kq1+kq3);
end.