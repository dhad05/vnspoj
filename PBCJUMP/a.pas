uses math;
type int=longint;
var n: int;
    a: array[1..1000000] of int;
var first,last: int;
    f,s: array[1..1000000] of int;

procedure pop(i: int);
begin
    while (first<=last)and(s[first]<i) do begin
        inc(first);
    end;
end;

procedure push(i: int);
begin
    while (first<=last)and(f[s[last]]>f[i]) do begin
        dec(last);
    end;
    while (first<=last)and(f[s[last]]=f[i])and(a[s[last]]<=a[i]) do begin
        dec(last);
    end;
    inc(last);
    s[last]:=i;
end;


function calc(x: int): int;
var i,j: int;
begin
    first:=1;
    last:=1;
    s[first]:=1;
    f[1]:=0;
    for i:=2 to n do begin
        pop(i-x);
        j:=s[first];
        f[i]:=f[j]+int(a[j]<=a[i]);
        push(i);
    end;
    exit(f[n]);
end;

procedure main();
var f:text;
    i,q: int;
begin
    assign(f,'');
    reset(f);
    readln(f,n);
    for i:=1 to n do read(f,a[i]);
    readln(f,q);
    for q:=q downto 1 do begin
        readln(f,i);
        writeln(calc(i));
    end;
    close(f);

end;

begin
main();
end.