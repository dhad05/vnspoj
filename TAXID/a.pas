uses math;
type int=longint;
var m,n,k,p,q: int;
    c: array[1..70] of int;
    x: array[0..70] of char;
    mark: array[1..10000] of int;
procedure init();
var i: int;
begin
    for i:=0 to 9 do x[i]:=chr(i+ord('0'));
    for i:=1 to 26 do x[9+i] :=chr(ord('a')+i-1);
end;
function chuyen(u: int): string;
begin
    if u=0 then exit('');
    chuyen:=chuyen(u div 36)+x[u mod 36];
end;

procedure main();
var i,j,this,p1,kq,z: int;
begin
    init;
    readln(n,m,p,q);
    k:=(m-1) div 2;
    for i:=1 to k do read(c[i]);
    fillchar(mark,sizeof(mark),0);
    for i:=1 to n do begin
        j:=i;
        this:=0;
        while j>0 do begin
            this:=max(this,j mod 36);
            j:=j div 36;
        end;
        for j:=1 to k do if this<c[j] then begin	
        	mark[i]:=j;
            break;
        end;
    end;
    if p mod 2=0 then p1:=p div 2
    else p1:=p div 2+1;
    if p1>k then p1:=0;
    z:=0;
    for i:=1 to n do z:=z+int(mark[i]=p1);
    writeln('z: ',z);
    if p mod 2 =0 then begin
        for i:=n downto 1 do if mark[i]=p1 then begin
            dec(q);
            if q=0 then begin
                kq:=i;
                break;
            end;
        end;
    end else begin
        for i:=1 to n do if mark[i]=p1 then begin
            dec(q);
            if q=0 then begin
                kq:=i;
                break;
            end;
        end;
    end;            
    writeln(kq);
    writeln(chuyen(kq));
end;

begin
main();
end.
