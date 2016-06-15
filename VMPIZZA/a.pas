type int=longint;
var n: int;
    s,t: array[0..100000] of int;
    a,b,sa,sb,f: array[0..100000] of int64;
    first,last: int64;

function time(i,j: int): int;
begin
    exit(((f[j]-sa[j])-(f[i]-sa[i]))div(sb[i]-sb[j])+
        +int(((f[j]-sa[j])-(f[i]-sa[i]))mod(sb[i]-sb[j])<>0));
end;

procedure main();
var fi: text;
    i,j: int;
    q: int64;
    x,y,z: int;
begin
    assign(fi,'');
    reset(fi);
    readln(fi,n,q);
    fillchar(a,sizeof(a),0);
    fillchar(b,sizeof(b),0);
    for i:=1 to n do begin
        readln(fi,x,y,z);
        a[x]:=a[x]+y;
        b[x]:=b[x]+z;
    end;
    close(fi);
    for i:=100000 downto 1 do if a[i]<>0 then begin
        n:=i;
        break;
    end;
    sa[0]:=0;
    sb[0]:=0;
    for i:=1 to n do sa[i]:=sa[i-1]+a[i]+b[i]*int64(i);
    for i:=1 to n do sb[i]:=sb[i-1]+b[i];
    f[0]:=0;
    first:=1;
    last:=1;
    s[last]:=0;
    t[last]:=-1000000;
    for i:=1 to n do if a[i]<>0 then begin
        while (first<last)and(t[first+1]<=i) do inc(first);
        j:=s[first];
        f[i]:=sa[i]-sb[i]*int64(i)+(f[j]-sa[j]+sb[j]*int64(i))-q;
        while (first<=last)and(time(s[last],i)<=t[last]) do dec(last);
        inc(last);
        s[last]:=i;
        t[last]:=time(s[last-1],i)
    end;
    writeln(f[n]);
end;

begin
main();
end.
