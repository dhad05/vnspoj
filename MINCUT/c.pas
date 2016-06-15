const   fi='';
        fo='';
        maxn=1000;
        maxm=1000;
var     m,n,k:longint;
        tong:int64;
        a:array[0..maxm+1,0..maxn+1] of int64;
        s:array[0..maxm+1,0..maxn+1] of int64;

        procedure Chuanbi;
        var     i,j:longint;
                begin
                        fillchar(s,sizeof(s),0);
                        for i:= 1 to m do
                                for j:= 1 to n do
                                        s[i,j]:=s[i-1,j]+s[i,j-1]-s[i-1,j-1]+a[i,j];


                end;

        function gets(i1,j1,i2,j2:longint):int64;
        begin
                gets:=s[i2,j2]-s[i1-1,j2]-s[i2,j1-1]+s[i1-1,j1-1];
        end;


        function BST1c(t:int64;x,y,u,v:longint):int64;
        var dau,cuoi,mid:longint;
                res:int64;
                s:int64;
                begin
                        dau:=y;
                        cuoi:=v-1;
                        while dau<=cuoi do
                                begin
                                        mid:=(dau+cuoi) div 2;
                                        s:=gets(x,y,u,mid);
                                        if 2*s<=t then
                                                begin
                                                        res:=s;
                                                        dau:=mid+1;
                                                end else cuoi:=mid-1;
                                end;
                        exit(res);
                end;


        function BST2c(t:int64;x,y,u,v:longint):int64;
        var dau,cuoi,mid:longint;
                s,res:int64;
                begin
                        dau:=y;
                        cuoi:=v-1;
                        while dau<=cuoi do
                                begin
                                        mid:=(dau+cuoi) div 2;
                                        s:=gets(x,y,u,mid);
                                        if 2*s>=t then
                                                begin
                                                        res:=s;
                                                        cuoi:=mid-1;
                                                end else dau:=mid+1;
                                end;
                        exit(res);
                end;

        function BST1r(t:int64;x,y,u,v:longint):int64;
        var dau,cuoi,mid:longint;
                s,res:int64;
                begin
                        dau:=x;
                        cuoi:=u-1;
                        while dau<=cuoi do
                                begin
                                        mid:=(dau+cuoi) div 2;
                                        s:=gets(x,y,mid,v);
                                        if 2*s<=t then
                                                begin
                                                        res:=s;
                                                        dau:=mid+1;
                                                end else cuoi:=mid-1;
                                end;
                        exit(res);
                end;


        function BST2r(t:int64;x,y,u,v:longint):int64;
        var dau,cuoi,mid:longint;
                s,res:int64;
                begin
                        dau:=x;
                        cuoi:=u-1;
                        while dau<=cuoi do
                                begin
                                        mid:=(dau+cuoi) div 2;
                                        s:=gets(x,y,mid,v);
                                        if 2*s>=t then
                                                begin
                                                        res:=s;
                                                        cuoi:=mid-1;
                                                end else dau:=mid+1;
                                end;
                        exit(res);
                end;



        procedure thuchien(x,y,u,v:longint);
        var     sum,min:int64;
                i:longint;
                begin
                        tong:=gets(x,y,u,v);
                        min:=trunc(1e18);
                        {if k*x*y<=trunc(1e8) then
                        begin
                        for i:=y to v-1 do
                                begin
                                        sum:=gets(x,y,u,i);
                                        if abs(tong-2*sum)<min then min:=abs(tong-2*sum);
                                end;
                        for i:=x to u-1 do
                                begin
                                        sum:=gets(x,y,i,v);
                                        if abs(tong-2*sum)<min then min:=abs(tong-2*sum);
                                end;
                        end
                        else}
                        begin
                       sum:=BST1c(tong,x,y,u,v);
                       if abs(tong-2*sum)<min then min:=abs(tong-2*sum);
                       if min=0 then
                        begin
                                writeln(min);
                                exit;
                        end;
                        sum:=BST2c(tong,x,y,u,v);
                       if abs(tong-2*sum)<min then min:=abs(tong-2*sum);
                       if min=0 then
                        begin
                                writeln(min);
                                exit;
                        end;
                        sum:=BST1r(tong,x,y,u,v);
                       if abs(tong-2*sum)<min then min:=abs(tong-2*sum);
                       if min=0 then
                        begin
                                writeln(min);
                                exit;
                        end;
                        sum:=BST2r(tong,x,y,u,v);
                       if abs(tong-2*sum)<min then min:=abs(tong-2*sum);
                       if min=0 then
                        begin
                                writeln(min);
                                exit;
                        end;
                        end;
                        writeln(min);
                end;


        procedure docfile;
        var     i,j,x,y,u,v:longint;
                begin
                        assign(input,fi); reset(input);
                        assign(output,fo); rewrite(output);
                        readln(m,n,k);
                        for i:= 1 to m do
                        begin
                                for j:= 1 to n do read(a[i,j]);
                                readln;
                        end;
                        chuanbi;
                        for i:= 1 to k do
                                begin
                                        readln(x,y,u,v);
                                        thuchien(x,y,u,v);
                                end;
                        close(input);
                        close(output);
                end;

begin
        docfile;
end.
