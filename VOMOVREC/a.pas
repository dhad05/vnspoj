uses math;
const inf=2100000000;
type int=longint;
	 pack=record
     	x,y: int64;
     end;
     hv=record
     	a,b: pack;
     end;
var n: int;
	a: array[1..100000] of hv;

function giao(var a,b: hv): hv;
begin
	with a do begin
    	if (a.x=a.y)and(a.y=b.x)and(b.x=b.y)then exit();
    end;
	giao.a.x:=max(a.a.x,b.a.x);
    giao.a.y:=max(a.a.y,b.a.y);
    giao.b.x:=min(a.b.x,b.b.x);
    giao.b.y:=min(a.b.y,b.b.y);
    if (giao.a.x>giao.b.x)
    or (giao.a.y>giao.b.y) then begin
    	fillchar(giao,sizeof(giao),0);
    end;
end;

function check(k: int64): boolean;
var i: int;
	this: hv;
begin
	for i:=1 to n do with a[i] do begin
    	a.x:=a.x-k;
        a.y:=a.y-k;
        b.x:=b.x+k;
        b.y:=b.y+k;
    end;	
    this:=a[1];
    for i:=2 to n do this:=giao(this,a[i]);
{    with this do begin
    	writeln(a.x,' ',a.y);
        writeln(b.x,' ',b.y);
    end;}
    exit((this.b.x-this.a.x)*(this.b.y-this.a.y)>=1);
end;
procedure reset(k: int64);
var i: int;
begin
	for i:=1 to n do with a[i] do begin
    	a.x:=a.x+k;
        a.y:=a.y+k;
        b.x:=b.x-k;
        b.y:=b.y-k;
    end;	
end;

procedure main();
var i: int;
	l,r,j: int64;
begin
	readln(n);
    for i:=1 to n do with a[i] do begin
    	readln(a.x,a.y,b.x,b.y);
    end;
    l:=0; r:=inf;
    while l<=r do begin
    	j:=(l+r) div 2;
    	if check(j) then r:=j-1
        else l:=j+1;
        reset(j);
    end;
    writeln(l);
end;

begin
main();
end.