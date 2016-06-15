uses math;
type int=longint;
var m,n,nkq: int;
    a: array[1..50] of int64;
    b,y,x: array[1..50] of int;
    kq: real;
    k: int;

procedure init;
var i,j: int;
    prime:array[1..50] of boolean;
begin
    for i:=2 to 50 do prime[i]:=true;
    for i:=2 to 50 do if prime[i] then begin
        j:=i*2;
        while j<=50 do begin
            prime[j]:=false;
            j:=j+i;
        end;
    end;
    m:=0;
    for i:=2 to 50 do if prime[i] then begin
        inc(m);
        a[m]:=i;
    end;
    for i:=1 to m do begin
        b[i]:=1;
        while (b[i]+1)*ln(a[i])/ln(10)<18 do inc(b[i]);
    end;
end;

procedure calc();
var i: int;
    this: real;
begin
    this:=0;
    for i:=1 to n do this:=this+x[i]*ln(a[i]);
    if this<kq then begin
        kq:=this;
        nkq:=n;
        for i:=1 to n do y[i]:=x[i];
    end;
end;

procedure dq(k: int);
var i: int;
begin
    if k=1 then exit();
    if n>=m then exit();
    inc(n);
    for i:=b[n] downto 2 do begin
        if k mod i =0 then begin
            x[n]:=i-1;
            dq(k div i);
        end;
    end;
    x[n]:=k-1;
    calc();
    dec(n);
end;

procedure xl;
var i: int;
    z: int64;
begin
    readln(k);
    n:=0;
    kq:=18*ln(10);
    dq(k);
    z:=1;
    for i:=1 to nkq do z:=z*(a[i]**y[i]);
    writeln(z);
end;

begin
init();
xl();
end.
