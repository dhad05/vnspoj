uses math;
type int=longint;
var x,y,m,b,n: int;
    fi: text;

var a: array[0..50] of int;
    f: array[-1..50,-1..50] of int;

function vc(): int;
var this,kq,curr: int;
    procedure try(i: int);
    begin
        if i>n then begin
            if (curr=m)and(x<=this)and(this<=y) then begin
                inc(kq);
            end;
            exit();
        end;
        if curr=m then begin
            try(i+1);
            exit();
        end;
        if m-curr=n-i+1 then begin
            inc(curr);
            this:=this+(b**i);
            try(i+1);
            this:=this-(b**i);
            dec(curr);
            exit();
        end;
        try(i+1);
        inc(curr);
        this:=this+(b**i);
        try(i+1);
        this:=this-(b**i);
        dec(curr);
    end;
begin
    this:=1;
    n:=0;
    while this<=y do begin
        this:=this*b;
        inc(n);
    end;
    kq:=0;
    curr:=0;
    this:=0;
    try(0);
    exit(kq);
end;

function calc(x: int): int;
var i,j,y,kq: int;
    boo: boolean;
begin
    if x=0 then exit(0);
    fillchar(f,sizeof(f),0);
    y:=1;
    n:=0;
    while y<=x do begin
        y:=y*b;
        inc(n);
    end;
    if m>n+1 then exit(0);
    y:=x;
    for i:=0 to n do begin
        a[i]:=y mod b;
        y:=y div b;
    end;       //for i:=0 to n do write(a[i],' ');writeln;
    for i:=n downto 0 do begin
        if a[i]>1 then begin
            for y:=i downto 0 do a[y]:=1;
            break;
        end;
    end;
    y:=0;
    for i:=0 to n do y:=y+a[i];
    for i:=0 to n do if (y>m)and(a[i]=1) then begin
        dec(a[i]);
        dec(y);
    end;
    if y<m then begin
        boo:=false;
        for i:=0 to n do if a[i]=1 then begin
            a[i]:=0;
            dec(y);
            if m<=y+i then begin
                boo:=true;
                break;
            end;
        end;
        if boo then for i:=i-1 downto 0 do begin
            a[i]:=1;
            inc(y);
            if y=m then break;
        end;
    end;
    if y<m then exit(0);
               //for i:=0 to n do write(a[i],' ');writeln;
    f[0,0]:=1;
    for i:=1 to n+1 do begin
        for j:=0 to n+1 do begin
            f[i,j]:=f[i-1,j]+f[i-1,j-1];
        end;
    end;
    kq:=1;
    y:=m;
    for i:=n downto 0 do begin
        if a[i]=1 then begin
            kq:=kq+f[i,y];
            dec(y);
        end;
    end;
    exit(kq);
end;

begin
assign(fi,'');
reset(fi);
readln(fi,x,y,m,b);
close(fi);
{randomize();
x:=1;
y:=random(1000000000)+1;
b:=random(8)+2;
m:=random(trunc(ln(y)/ln(b)))+1;}
//x:=1;
//for y:=1 to 1000000000 do for b:=2 to 9 do for m:=1 to 25 do
//if calc(y)-calc(x-1)<>vc() then writeln(x,' ',y,' ',m,' ',b);
writeln(calc(y)-calc(x-1));
//writeln(vc());
end.
