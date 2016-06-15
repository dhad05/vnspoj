var s: string;
	i, l: longint;
    kq: longint;

begin
readln(s);
i:=1;
l:=length(s);
kq:=0;
while i<=l do begin
	if s[i]='I' then begin
    	if i<l then begin
        	if s[i+1]='V' then begin
            	kq:=kq+4;
                i:=i+1;
            end else if s[i+1]='X' then begin
            	kq:=kq+9;
                i:=i+1;
            end else kq:=kq+1;
        end else kq:=kq+1;
    end else
	if s[i]='X' then begin
    	if i<l then begin
        	if s[i+1]='L' then begin
            	kq:=kq+40;
                i:=i+1;
            end else if s[i+1]='C' then begin
            	kq:=kq+90;
                i:=i+1;
            end else kq:=kq+10;
        end else kq:=kq+10;
    end else
    if s[i]='C' then begin
    	if i<l then begin
        	if s[i+1]='D' then begin
            	kq:=kq+400;
                i:=i+1;
            end else if s[i+1]='M' then begin
            	kq:=kq+900;
                i:=i+1;
            end else kq:=kq+100;
        end else kq:=kq+100;
    end else
    if s[i]='V' then begin
    	kq:=kq+5;
    end else
    if s[i]='L' then begin
    	kq:=kq+50;
    end else
    if s[i]='D' then begin
    	kq:=kq+500;
    end else
	if s[i]='M' then begin
    	kq:=kq+1000;
    end;
    i:=i+1;
end;
writeln(kq); 
end.