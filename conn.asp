<%@Language=VBScript codepage=65001 %>
<% response.buffer=true
dim conn
dim connstr
dim db

ADMIN_GRADE = 3
USER_GRADE = 2

db="database\data39839234dklsddfsa8762.accdb"
Set conn = Server.CreateObject("ADODB.Connection")
'connstr="Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" & Server.MapPath(db)
connstr="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath(db) & ";Persist Security Info=False;"
'=====mdb专用====='
'connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
conn.open connstr

sub closeconn()
	conn.close
	set conn=nothing
end sub
%>
