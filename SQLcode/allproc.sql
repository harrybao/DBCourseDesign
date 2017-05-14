--1创建存储过程对员工信息的录入，并且身份证要进行加密处理
alter proc employinfo
@eid char(6), @name nchar(12),
@sex char(2),@idnum char(18), @card char(20),
@address nchar(50),@phone char(11),@email nchar(40) output 
as
insert into Employee(Emid,Ename,Esex,IDnum,CardNo,Eaddress,Ephone,Email)
values(@eid,@name,@sex, EncryptByasymkey(asymkey_ID('hary'),@idnum),@card,@address,@phone,@email)

exec employinfo 'yw6005',  '巫蒋琴', '女' ,'396523198506254329',
'6212264112244357973','北山路131号','13343312260','wujqin@yeah.net'

SELECT Emid, CONVERT(CHAR, DecryptByasymkey(asymkey_ID('hary'),IDnum,N'0101')) AS IDnum 
FROM Employee WHERE Emid='cw2003'
select * from Employee

--2创建存储过程输入员工编号查看员工的工资信息
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

--3创建存储过程查询员工基本信息
alter proc empinfomion
as
select Emid,Ename,Esex,
CONVERT(CHAR, DecryptByasymkey(asymkey_ID('hary'),IDnum,N'0101')) AS IDnum ,
CardNo,Eaddress,Ephone,Email
 from Employee
 exec empinfomion

 --4创建存储过程带一个参数员工编号信息查询员工基本信息
create proc employeeinfomion
@eid char(6) output
as
select Emid,Ename,Esex,
CONVERT(CHAR, DecryptByasymkey(asymkey_ID('hary'),IDnum,N'0101')) AS IDnum ,
CardNo,Eaddress,Ephone,Email
 from Employee where Emid=@eid
 exec employeeinfomion 'gg1002'

 --5创建存储过程输入两个参数返回用户名和密码，用于用户登录系统
create proc loginuser
@uid char(6),@pwd nchar(20) output
as
select * from Euser where Emid=@uid and Pwd=@pwd

exec loginuser 'gg1001','gg1001'
--6创建存储过程查看所有员工的工资情况
create proc selectallwage
as
select Ename ,Bwage, byear,bpostp,cover,cdebit,cbsence,swage,rwage
from Basapay b,Changepay c,Shouldp s,Realwage r ,Employee e
where b.Emid=c.Emid
and b.Emid=s.Emid
and b.Emid=r.Emid
and b.Emid=e.Emid

exec selectallwage
--7创建存储过程输入月份和员工编码查询实发工资信息
create proc mounthselect 
@mm  int,@eid char(6) output 
as begin 
select * from Realwage where Emid=@eid
and datepart(mm,Rdate)=@mm
end
exec mounthselect '7','yw6003'
--8创建存储过程用于管理员对员工的考勤情况进行输入
create proc attenduserinsert
@eid char(6),@over int,@off int,@leav int 
as
insert into Attend(Emid,Aover,Aoff,Aleave)
values(@eid,@over,@off,@leav)
--9创建存储过程用于修改员工基本工资信息
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

--10创建存储过程用于添加员工的岗位变更
create proc changeEmpPost
@eid char(6),@old nchar(20),@new nchar(20) 
as begin 
insert into Jobchange(Emid,Jold,Jnew)
values(@eid,@old,@new)
end
exec changeEmpPost 'sj5004','实习员','专员'
begin
select * from Basapay
select * from Jobchange
end