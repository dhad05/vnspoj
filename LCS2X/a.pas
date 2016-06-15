uses math;
type int=longint;
var m,n: int;
    a,b,x,y: array[1..1500] of int;
    //f: array[1..1500,1..1500] of int;

function xl(): int;
var i,j,this,kq: int;
begin
    kq:=0;
    fillchar(x,sizeof(x),0);
    fillchar(y,sizeof(y),0);
    for i:=1 to m do for j:=1 to n do begin
        if a[i]=b[j] then begin
            this:=x[i]+1;
            if b[j]*2<=a[i] then x[i]:=max(x[i],y[j]);
            kq:=max(kq,this);
            y[j]:=this;
        end else if b[j]*2<=a[i] then begin
            x[i]:=max(x[i],y[j]);
        end;
    end;
    exit(kq);
end;

{function dq(): int;
var i,j,k,l: int;
begin
    dq:=0;
    fillchar(f,sizeof(f),0);
    for i:=1 to n do for j:=1 to n do if a[i]=b[j] then begin
        f[i,j]:=0;
        for k:=i-1 downto 1 do for l:=j-1 downto 1 do if a[k]=b[l] then begin
            if a[k]*2<=a[i] then f[i,j]:=max(f[i,j],f[k,l]);
        end;
        f[i,j]:=f[i,j]+1;
        dq:=max(dq,f[i,j]);
    end;
end;}

procedure main();
var fi: text;
    t,i: int;
begin
    assign(fi,'');
    reset(fi);
    readln(fi,t);
    for t:=t downto 1 do begin
        readln(fi,m,n);
        for i:=1 to m do read(fi,a[i]);
        for i:=1 to n do read(fi,b[i]);
        writeln(xl());
    end;
    close(fi);
end;

begin
main();
end.
