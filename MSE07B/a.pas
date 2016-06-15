type int=longint;
var a,b,va,vb,p: array[0..10000000] of int;
	ma,mb: int;

function geta(i: int): int;
var tmp,j: int;
begin
	geta:=a[i];
    a[i]:=a[ma];
    dec(ma);
    va[a[i]]:=i;
    while i>1 do begin
    	j:=i div 2;
        if a[j]>a[i] then break;
        va[a[j]]:=i;va[a[i]]:=j;
        tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
        i:=j;
    end;
    while i*2<=ma do begin
    	j:=i*2;
        if (j<ma)and(a[j+1]>a[j]) then j:=j+1;
        if a[i]>a[j] then break;
        va[a[j]]:=i;va[a[i]]:=j;
        tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
        i:=j;
    end;
end;
function getb(i: int): int;
var tmp,j: int;
begin
	getb:=b[i];
    b[i]:=b[mb];
    dec(mb);
    vb[b[i]]:=i;
    while i>1 do begin
    	j:=i div 2;
        if b[j]<b[i] then break;
        vb[b[j]]:=i;vb[b[i]]:=j;
        tmp:=b[i];b[i]:=b[j];b[j]:=tmp;
        i:=j;
    end;
    while i*2<=mb do begin
    	j:=i*2;
        if (j<mb)and(b[j+1]<b[j]) then j:=j+1;
        if b[i]<b[j] then break;
        vb[b[j]]:=i;vb[b[i]]:=j;
        tmp:=b[i];b[i]:=b[j];b[j]:=tmp;
        i:=j;
    end;
end;

procedure pusha(tt: int);
var i,j,tmp: int;
begin
	inc(ma);
    a[ma]:=tt;
    va[tt]:=ma;
    i:=ma;
    while i>1 do begin
    	j:=i div 2;
        if a[j]>a[i] then break;
        va[a[j]]:=i;va[a[i]]:=j;
        tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
        i:=j;
    end;
end;
procedure pushb(tt: int);
var i,j,tmp: int;
begin
	inc(mb);
    b[mb]:=tt;
    vb[tt]:=mb;
    i:=mb;
    while i>1 do begin
    	j:=i div 2;
        if b[j]<b[i] then break;
        vb[b[j]]:=i;vb[b[i]]:=j;
        tmp:=b[i];b[i]:=b[j];b[j]:=tmp;
        i:=j;
    end;
end;

procedure main();
var t,ten,tt,i: int;
begin
	ma:=0;mb:=0;
	while not seekeof() do begin
    	read(t);
        if t=0 then break;
        if t=1 then begin
        	read(ten,tt);
            p[tt]:=ten;
            pusha(tt);
            pushb(tt);
        end;
    	if t=2 then begin
        	if ma>0 then writeln(p[getb(vb[geta(1)])])
            else writeln(0);
        end;
        if t=3 then begin
        	if mb>0 then writeln(p[geta(va[getb(1)])])
            else writeln(0);
        end;
        readln;
    end;
end;

begin
main();
end.

