uses math;
type int=longint;
var n: int;
    a,s,l,r: array[0..100000] of int;


procedure init();
var i: int;
    top: int;
begin
    top:=0;
    s[top]:=0;
    for i:=1 to n-1 do begin
        while (top>0)and(a[s[top]]<=a[i]) do dec(top);
        l[i]:=s[top]+1;
        inc(top);
        s[top]:=i;
    end;
    top:=0;
    s[top]:=n;
    for i:=n-1 downto 1 do begin
        while (top>0)and(a[s[top]]<a[i]) do dec(top);
        r[i]:=s[top]-1;
        inc(top);
        s[top]:=i;
    end;
end;

function calc(u,v: int): int64;
var i: int;
    kq: int64;
begin
    kq:=0;
    for i:=u to v do begin
        kq:=kq+int64(a[i])*int64(min(r[i],v)-i+1)*int64(i-max(l[i],u)+1);
    end;
    exit(kq);
end;
procedure main();
var f: text;
    u,v,i,m: int;
begin
    assign(f,'');
    reset(f);
    readln(f,n,m);
    for i:=1 to n do read(f,a[i]);
    for i:=1 to n-1 do a[i]:=abs(a[i]-a[i+1]);
    init();
    for i:=1 to m do begin
        readln(f,u,v);
        writeln(calc(u,v-1));
    end;
    close(f);
end;

begin
main();
end.