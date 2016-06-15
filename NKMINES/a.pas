uses math;
type int=longint;
var m,n: int;
    a,b,r,c: array[1..200,1..200] of int;

function sum(i,j: int): int;
var u,v: int;
begin
    sum:=-b[i,j];
    for u:=max(1,i-1) to min(m,i+1) do for v:=max(1,j-1) to min(n,j+1) do begin
        sum:=sum+b[u,v];
    end;
end;

function try(i,j: int): boolean;
var i1,j1: int;
begin
    if (i=m)and(j=n) then begin
        b[i,j]:=0;
        b[i,j]:=a[i-1,j-1]-sum(i-1,j-1);
        if (b[i,j]<0)or(b[i,j]>1) then begin
            b[i,j]:=0;
            exit(false);
        end;
        exit(true);
    end;

    if j=n then begin
        i1:=i+1;
        j1:=1;
    end else begin
        i1:=i;
        j1:=j+1;
    end;
    i1:=r[i,j]; j1:=c[i,j];

    if (i=1)or(j=1) then begin
        b[i,j]:=0; if try(i1,j1) then exit(true);
        b[i,j]:=1; if try(i1,j1) then exit(true);
        exit(false);
    end;

    b[i,j]:=0;
    b[i,j]:=a[i-1,j-1]-sum(i-1,j-1);
    if (b[i,j]<0)or(b[i,j]>1) then begin
        b[i,j]:=0;
        exit(false);
    end;
    if (j=n)and(a[i-1,j]<>sum(i-1,j)) then begin
        b[i,j]:=0;
        exit(false);
    end;
    if (i=m)and(a[i,j-1]<>sum(i,j-1)) then begin
        b[i,j]:=0;
        exit(false);
    end;

    if try(i1,j1) then exit(true);
    b[i,j]:=0;
    exit(false);
end;

procedure ran();
var i,j: int;
begin
    n:=200;
    m:=200;
    for i:=1 to m do for j:=1 to n do b[i,j]:=random(2);
    for i:=1 to m do for j:=1 to n do a[i,j]:=sum(i,j);
    fillchar(b,sizeof(b),0);
end;

procedure main();
var f: text;
    i,j,u,v,t: int;
    count: int;
    x: array[1..200,1..200] of int;
begin
    assign(f,'');
    reset(f);
    readln(f,m,n);
    for i:=1 to m do for j:=1 to n do read(f,a[i,j]);
    close(f);
    u:=1;v:=1;
    count:=0;
    for t:=3 to m+n do for i:=1 to t-1 do begin
        j:=t-i;
        if (i<=m)and(j<=n) then begin
            r[u,v]:=i;
            c[u,v]:=j;
            inc(count);
            x[u,v]:=count;
            u:=i;
            v:=j;
        end;
    end;

    for i:=0 to 1 do begin
        b[1,1]:=i;
        if try(1,2) then break;
    end;
    for i:=1 to m do begin
        for j:=1 to n do write(b[i,j],' ');
        writeln;
    end;
end;

begin
randomize();
main();
end.
