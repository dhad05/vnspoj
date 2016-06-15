type int=longint;
var n: int;
    p: int64;
    s: array[0..50000] of int64;
    m: array[1..50000] of int;

procedure main();
var f: text;
    i,j: int;
    kq: int;
begin
    assign(f,'');
    reset(f);
    readln(f,n,p);
    s[0]:=0;
    for i:=1 to n do readln(f,s[i]);
    close(f);

    for i:=2 to n do s[i]:=s[i-1]+s[i];
    m[1]:=0;
    m[2]:=1;
    for i:=3 to n do begin
        if s[m[i-1]]>s[i-1] then m[i]:=i-1
        else m[i]:=m[i-1];
    end;

    kq:=0;
    for i:=1 to n do begin
        j:=m[i-kq];
        while s[i]-s[j]>=p do begin
            kq:=i-j;
            if j=0 then break;
            j:=m[j];
        end;
    end;
    if kq=0 then kq:=-1;
    writeln(kq);
end;

begin
main();
end.
