type int=longint;
const inf=2100000000;
var a: array[0..20,0..20] of int;
    f: array[0..1 shl 20-1] of int;
    n,k,current,_: int;
    g: array[0..1 shl 20-1] of int64;

function tat(k,i: int): int;
begin
    exit(k-(1 shl(i-1)));
end;

procedure try(i,m: int);
var fmax,this: int;
    gmax: int64;
begin
    if i=n+1 then begin
        fmax:=-inf;
        gmax:=0;
        for i:=1 to n do if k and (1 shl(i-1))<>0 then begin
            this:=f[tat(k,i)]+a[m,i];
            if fmax<this then begin
                fmax:=this;
                gmax:=g[tat(k,i)];
            end else if fmax=this then gmax:=gmax+g[tat(k,i)];
        end;
        if f[k]<fmax then begin
            f[k]:=fmax;
            g[k]:=gmax;
        end else if f[k]=fmax then begin
            g[k]:=g[k]+gmax;
        end;
        exit();
    end;
    if current=m then begin
        try(i+1,m);
        exit();
    end;
    if m-current=n-i+1 then begin
        inc(current);
        k:=k+(1 shl (i-1));
        try(i+1,m);
        k:=k-(1 shl (i-1));
        dec(current);
        exit();
    end;
    try(i+1,m);
    inc(current);
    k:=k+(1 shl (i-1));
    try(i+1,m);
    k:=k-(1 shl (i-1));
    dec(current);
end;

procedure main();
var fi: text;
    i,j: int;
begin
    assign(fi,'');
    reset(fi);
    readln(fi,n);
    for i:=1 to n do for j:=1 to n do read(fi,a[i,j]);
    close(fi);
    _:=1 shl n-1;
    for j:=0 to _ do begin
        f[j]:=-inf;
        g[j]:=0;
    end;
    f[0]:=0;
    g[0]:=1;
    k:=0;
    current:=0;
    for i:=1 to n do try(1,i);
    writeln(f[_],' ',g[_]);
end;

begin
main();
end.

