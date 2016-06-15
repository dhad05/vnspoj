//2015-03-02 VODIVIDE
type int=longint;
var f: text;
    a, b, c, idx, pair, ii: array[0..5000] of int;
    n, i, j, k: int;
    kq: int64;

procedure qsort;
var x, tmp: int;
    procedure sort(l, r: int);
    var i, j: int;
    begin
        x:=a[(l+r)div 2];
        i:=l;
        j:=r;
        while i<=j do begin
            while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then begin
                tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
                tmp:=b[i];b[i]:=b[j];b[j]:=tmp;
                tmp:=ii[i];ii[i]:=ii[j];ii[j]:=tmp;
                inc(i);
                dec(j);
            end;
        end;
        if l<j then sort(l, j);
        if i<r then sort(i, r);
    end;
begin
    for x:=1 to n do ii[x]:=x;
    sort(1, n);
end;

procedure makeidx;
var x, tmp: int;
    procedure sort(l, r: int);
    var i, j: int;
    begin
        x:=c[(l+r)div 2];
        i:=l;
        j:=r;
        while i<=j do begin
            while c[i]>x do inc(i);
            while c[j]<x do dec(j);
            if i<=j then begin
                tmp:=c[i];c[i]:=c[j];c[j]:=tmp;
                tmp:=idx[i];idx[i]:=idx[j];idx[j]:=tmp;
                inc(i);
                dec(j);
            end;
        end;
        if l<j then sort(l, j);
        if i<r then sort(i, r);
    end;
begin
    for i:=1 to n do begin
        idx[i]:=i;
        c[i]:=b[i];
    end;
    sort(1, n);
end;

begin
fillchar(pair, sizeof(pair), 0);
kq:=0;

assign(f, 'divide.inp');
reset(f);
readln(f, n);
for i:=1 to n do read(f, a[i]);
for i:=1 to n do read(f, b[i]);
close(f);

qsort;
makeidx;
//for i:=1 to n do write(a[i]:2, ' ');writeln;
//for i:=1 to n do write(b[i]:2, ' ');writeln;
//for i:=1 to n do write(idx[i], ' ');writeln;
for i:=1 to n do if pair[idx[i]]=0 then begin
    k:=0;
    for j:=idx[i]+1 to n do if pair[j]=0 then begin
        if (k=0)or(b[j]<b[k]) then k:=j;
    end;
    if k<>0 then begin
        pair[idx[i]]:=k;
        pair[k]:=idx[i];
        kq:=kq+b[idx[i]];
    end;
end;
//for i:=1 to n do write(pair[i], ' ');writeln;
writeln(kq);
for i:=1 to n do if i<pair[i] then writeln(ii[i], ' ', ii[pair[i]]);
end.