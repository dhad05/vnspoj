uses math;
type int=longint;
	 pack=record l,r: int; end;
     mang=array[1..100000] of int;
var n,m: int;
	a, l, r, dup, vitri: mang;
	fa, fdup: mang;

procedure up(var a,fa: mang; i,k: int);
begin
	a[i]:=k;
    while i<=n do begin
    	fa[i]:=max(fa[i],k);
        i:=i+(i and(-i));
    end;
end;
function get(var a,fa: mang; l,r: int): int;
var kq: int;
begin
	kq:=0;
    while l<=r do begin
    	if r-(r and(-r))>=l then begin
        	kq:=max(kq,fa[r]);
            r:=r-(r and(-r));
        end else begin
        	kq:=max(kq,a[r]);
            dec(r);
        end;
    end;
    exit(kq);
end;
function xl(i,l,r: int): int;
var kq,this,j: int;
begin
	kq:=1;
    for j:=i+1 to r do begin
    	this:=get(a, fa, i, j);
        if (j-this+1>0) and
           (get(a, fa,j-this+1, j)=this) and
           (get(dup, fdup, j-this+1, j)<j-this+1) then kq:=max(kq,this);
    end;
    for j:=i-1 downto l do begin
    	this:=get(a, fa, j, i);
        if (j+this-1<=n) and
           (get(a, fa, j, j+this-1)=this) and
           (get(dup, fdup, j,j+this-1)<j) then kq:=max(kq,this);
    end;
    exit(kq);
end;

procedure init();
var i: int;
begin
	for i:=1 to n do begin
    	vitri[i]:=0;
        dup[i]:=0;
        fa[i]:=0;
        fdup[i]:=0;
    end;
    for i:=1 to n do begin
    	up(a,fa,i,a[i]);
        dup[i]:=vitri[a[i]];
        up(dup,fdup,i,dup[i]);
        vitri[a[i]]:=i;
    end;
end;

procedure main();
var i,kq,this: int;	
begin
	readln(n);
    for i:=1 to n do read(a[i]);
    init();
    this:=0;
    for i:=1 to n do if a[i]=1 then begin
    	l[i]:=this+1;
        this:=i;
    end;
    this:=n+1;
    for i:=n downto 1 do if a[i]=1 then begin
    	r[i]:=this-1;
        this:=i;
    end;
    kq:=0; 
    for i:=1 to n do if a[i]=1 then kq:=max(kq,xl(i,l[i],r[i]));
    writeln(kq);
end;

begin
main();
end.
