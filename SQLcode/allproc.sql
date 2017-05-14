--1�����洢���̶�Ա����Ϣ��¼�룬�������֤Ҫ���м��ܴ���
alter proc employinfo
@eid char(6), @name nchar(12),
@sex char(2),@idnum char(18), @card char(20),
@address nchar(50),@phone char(11),@email nchar(40) output 
as
insert into Employee(Emid,Ename,Esex,IDnum,CardNo,Eaddress,Ephone,Email)
values(@eid,@name,@sex, EncryptByasymkey(asymkey_ID('hary'),@idnum),@card,@address,@phone,@email)

exec employinfo 'yw6005',  '�׽���', 'Ů' ,'396523198506254329',
'6212264112244357973','��ɽ·131��','13343312260','wujqin@yeah.net'

SELECT Emid, CONVERT(CHAR, DecryptByasymkey(asymkey_ID('hary'),IDnum,N'0101')) AS IDnum 
FROM Employee WHERE Emid='cw2003'
select * from Employee

--2�����洢��������Ա����Ų鿴Ա���Ĺ�����Ϣ
create proc selectwage
@eid char(6) output
as
select Bwage, byear,bpostp,cover,cdebit,cbsence,swage,rwage
from Basapay b,Changepay c,Shouldp s,Realwage r 
where b.Emid=c.Emid
and b.Emid=s.Emid
and b.Emid=r.Emid
and b.Emid=@eid
exec selectwage 'gg1001'

--3�����洢���̲�ѯԱ��������Ϣ
alter proc empinfomion
as
select Emid,Ename,Esex,
CONVERT(CHAR, DecryptByasymkey(asymkey_ID('hary'),IDnum,N'0101')) AS IDnum ,
CardNo,Eaddress,Ephone,Email
 from Employee
 exec empinfomion

 --4�����洢���̴�һ������Ա�������Ϣ��ѯԱ��������Ϣ
create proc employeeinfomion
@eid char(6) output
as
select Emid,Ename,Esex,
CONVERT(CHAR, DecryptByasymkey(asymkey_ID('hary'),IDnum,N'0101')) AS IDnum ,
CardNo,Eaddress,Ephone,Email
 from Employee where Emid=@eid
 exec employeeinfomion 'gg1002'

 --5�����洢���������������������û��������룬�����û���¼ϵͳ
create proc loginuser
@uid char(6),@pwd nchar(20) output
as
select * from Euser where Emid=@uid and Pwd=@pwd

exec loginuser 'gg1001','gg1001'
--6�����洢���̲鿴����Ա���Ĺ������
create proc selectallwage
as
select Ename ,Bwage, byear,bpostp,cover,cdebit,cbsence,swage,rwage
from Basapay b,Changepay c,Shouldp s,Realwage r ,Employee e
where b.Emid=c.Emid
and b.Emid=s.Emid
and b.Emid=r.Emid
and b.Emid=e.Emid

exec selectallwage
--7�����洢���������·ݺ�Ա�������ѯʵ��������Ϣ
create proc mounthselect 
@mm  int,@eid char(6) output 
as begin 
select * from Realwage where Emid=@eid
and datepart(mm,Rdate)=@mm
end
exec mounthselect '7','yw6003'
--8�����洢�������ڹ���Ա��Ա���Ŀ��������������
create proc attenduserinsert
@eid char(6),@over int,@off int,@leav int 
as
insert into Attend(Emid,Aover,Aoff,Aleave)
values(@eid,@over,@off,@leav)
--9�����洢���������޸�Ա������������Ϣ
create proc updateEmployWage
@eid char(6),@wage money,@year money,@post money
as begin
update Basapay
set Bwage=@wage 
where Emid=@eid
update Basapay
set Byear=@year 
where Emid=@eid
update Basapay
set Bpostp=@post
where Emid=@eid
end
select * from Basapay
exec updateEmployWage 'cw2001','10000','1100','1200'

--10�����洢�����������Ա���ĸ�λ���
create proc changeEmpPost
@eid char(6),@old nchar(20),@new nchar(20) 
as begin 
insert into Jobchange(Emid,Jold,Jnew)
values(@eid,@old,@new)
end
exec changeEmpPost 'sj5004','ʵϰԱ','רԱ'
begin
select * from Basapay
select * from Jobchange
end