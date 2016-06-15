uses math;
type int=longint;
var n: int;
	s: array[1..100] of ansistring;
    a: array[1..100,1..26] of char;
    num: array['a'..'z'] of int;
    m: array[1..100] of int;

procedure init();
var i,k: int;
	c: char;
begin
	for k:=1 to n do begin
    	fillchar(num,sizeof(num),0);
        for i:=1 to length(s[k]) do begin	
        	inc(num[s[k,i]]);
        end;
        m[k]:=0;
        for c:='a' to 'z' do if num[c]>0 then begin
        	inc(m[k]);
            a[k,m[k]]:=c;
        end;
    end;
end;

function check(k: int;i,j: char): boolean;
var x: int;
begin
	if m[k]>2 then exit(false);
    for x:=1 to m[k] do if (a[k,x]<>i)and(a[k,x]<>j) then exit(false);
    exit(true);
end;

procedure main();
var i,j: char;
	k,kq,this: int;
begin            	
	readln(n);
    for k:=1 to n do readln(s[k]);
    init();
    kq:=0;
    for i:='a' to 'z' do for j:=chr(ord(i)+1) to 'z' do begin
    	this:=0;
		for k:=1 to n do begin
        	if check(k,i,j) then this:=this+length(s[k]);
        end;	
        kq:=max(kq,this);
    end;
    writeln(kq);
end;

begin
main();
end.