//*** spoj C11PRIME 2015-02-27
uses math;
var prime: boolean;
    n, p, i, m, q: int64;

operator **(p, q: int64) z: int64;
begin
    z:=1;
    while q>0 do begin
        if z>1000000000000000000 div p then exit(0);
        z:=z*p;
        q:=q-1;
    end;
end;

begin
readln(n);
q:=62;
while q>=1 do begin
    p:=round(exp(ln(n)/q));
    if p**q=n then begin
        m:=round(sqrt(p));
        i:=2;
        prime:=true;
        while i<=m do begin
            if p mod i=0 then begin
                prime:=false;
                break;
            end;
            i:=i+1;
        end;
        if prime then writeln(p, ' ', q)
        else writeln(0);
        halt;
    end;
    q:=q-1;
end;
writeln(0);
end.
