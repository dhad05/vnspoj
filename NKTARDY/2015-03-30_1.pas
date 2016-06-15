//*** fucking nktardy spoj (2015-03-30_1)
type int=longint;
var f: text;
    n, m, i, count: int;
    p, d: array[0..100000] of int64;
    idx, chose: array[0..100000] of int;
    time: int64;

var heap: array[1..100000] of int64;
    sh: array[1..100000] of int;

procedure pop;
var i, j: int;
    tmp: int64;
    tmp1: int;
begin
    heap[1]:=heap[m];
    sh[1]:=sh[m];
    m:=m-1;
    i:=1;
    while i*2<=m do begin
        j:=i*2;
        if j<m then if heap[j+1]>=heap[j] then j:=j+1;
        if heap[j]<=heap[i] then break;
        tmp1:=sh[i];sh[i]:=sh[j];sh[j]:=tmp1;
        tmp:=heap[i];heap[i]:=heap[j];heap[j]:=tmp;
        i:=j;
    end;
end;
procedure push(i: int;w: int64);
var j, tmp1: int;
    tmp: int64;
begin
    m:=m+1;
    heap[m]:=w;
    sh[m]:=i;
    i:=m;
    while i>1 do begin
        j:=i div 2;
        if heap[j]>heap[i] then break;
        tmp1:=sh[i];sh[i]:=sh[j];sh[j]:=tmp1;
        tmp:=heap[i];heap[i]:=heap[j];heap[j]:=tmp;
        i:=j;
    end;

end;

procedure qsort;
var tmp, x: int;

    procedure sort(l, r: int);
    var i, j: int;
    begin
        i:=l;
        j:=r;
        x:=d[(l+r)div 2];
        while i<=j do begin
            while d[i]<x do inc(i);
            while d[j]>x do dec(j);
            if i<=j then begin
                tmp:=p[i];p[i]:=p[j];p[j]:=tmp;
                tmp:=d[i];d[i]:=d[j];d[j]:=tmp;
                tmp:=idx[i];idx[i]:=idx[j];idx[j]:=tmp;
                inc(i);
                dec(j);
            end;
        end;
        if l<j then sort(l, j);
        if i<r then sort(i, r);
    end;
begin
    for i:=1 to n do idx[i]:=i;
    sort(1, n);
end;

begin
assign(f, 'nktardy.inp');
reset(f);
readln(f, n);
for i:=1 to n do read(f, p[i]);
readln(f);
for i:=1 to n do read(f, d[i]);
close(f);
qsort;
fillchar(chose, sizeof(chose), 0);
time:=0;
m:=0;
for i:=1 to n do begin
    time:=time+p[i];

    if time<=d[i] then begin
        chose[i]:=1;
        push(i, p[i]);
    end else begin
        if heap[1]<=p[i] then begin
            chose[i]:=0;
            time:=time-p[i];
        end else begin
            chose[sh[1]]:=0;
            chose[i]:=1;
            time:=time-p[sh[1]];
            pop();
            push(i, p[i]);
        end;
    end;
end;
time:=0;
count:=0;
for i:=1 to n do if chose[i]=1 then begin
    time:=time+p[i];
    if time>d[i] then count:=count+1;
end;
for i:=1 to n do if chose[i]=0 then begin
    time:=time+p[i];
    if time>d[i] then count:=count+1;
end;
writeln(count);
for i:=1 to n do if chose[i]=1 then write(idx[i], ' ');
for i:=1 to n do if chose[i]=0 then write(idx[i], ' ');
writeln;
end.
