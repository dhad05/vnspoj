uses math;
type int=longint;
var n,m: int;
    f,a: array[1..10000] of int64;
    c: array[1..100050] of char;
    s,g: array[0..100050] of int;

function calc(r: int): int;
var i,first,last: int;
begin
    g[0]:=0;
    first:=1;
    last:=1;
    s[last]:=0;
    for i:=1 to m+1 do if c[i]='0' then begin
        while (first<=last)and(s[first]<i-r) do inc(first);
        g[i]:=g[s[first]]+1;
        while (first<=last)and(g[s[last]]>=g[i]) do dec(last);
        inc(last);
        s[last]:=i;
    end;
    exit(g[m+1]);
end;

procedure main();
var fi: text;
    i,this,x: int;
    num: array[1..100] of int;
begin
    assign(fi,'');
    reset(fi);
    readln(fi,n,m);
    fillchar(num,sizeof(num),0);
    for i:=1 to n do begin
        read(fi,x);
        inc(num[x]);
    end;
    readln(fi);
    for i:=1 to m do read(fi,c[i]);
    c[m+1]:='0';
    close(fi);
    i:=1;
    for x:=100 downto 1 do begin
        if num[x]=0 then continue;
        this:=calc(x);
        for i:=i to i+num[x]-1 do a[i]:=this;
        inc(i);
    end;
    f[1]:=a[1];
    f[2]:=a[2];
    for i:=3 to n do begin
        f[i]:=f[i-1]+a[1]+a[i];
        f[i]:=min(f[i],f[i-2]+a[1]+a[i]+a[2]*2);
    end;
    writeln(f[n]);
end;

begin
main();
end.