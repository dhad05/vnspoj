type int=longint;
var n: int;
	a: array[1..10] of string;

function sub(s: string;l,r: int): string;
var kq: string;
begin
	kq:='';
    for l:=l to r do kq:=kq+s[l];
    exit(kq);
end;
function check(s: string): boolean;
var kq: boolean;
	i: int;
begin
	kq:=true;
	for i:=2 to n do kq:=kq and (pos(s, a[i])<>0);
    exit(kq);
end;

function calc(): string;
var kq, this: string;
	l,i: int;
begin
	kq:='';
    for l:=length(a[1]) downto 1 do begin
    	if l<length(kq) then break;
    	for i:=l to length(a[1]) do begin
        	this:=sub(a[1],i-l+1,i);
            if check(this) then begin
            	if kq='' then kq:=this
                else if kq>this then kq:=this;
            end;
        end;
    end;
    exit(kq);
end;

procedure main();
var t,i,x,m: int;
	s: string;
begin
	readln(t);
    for t:=t downto 1 do begin
    	readln(n);
        readln(s);
        x:=0;
        m:=0;
        for i:=1 to length(s) do begin
        	if s[i]=' ' then begin
            	inc(m);
                a[m]:=sub(s,x+1,i-1);
                x:=i;
            end;
        end;
        if m<n then a[n]:=sub(s,x+1,length(s)); 
        writeln(calc());
    end;
end;

begin
main();
end.