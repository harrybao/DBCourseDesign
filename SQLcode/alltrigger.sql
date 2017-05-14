--1创建触发器，当录入员工信息时自动在用户登录表中建立相应的账号和密码
CREATE TRIGGER greatelogin
ON Employee FOR INSERT
AS
DECLARE @uid CHAR(6)
SELECT @uid=Emid FROM inserted
INSERT INTO Euser values(@uid,@uid)
SELECT * FROM Euser

----2当考勤登记表中添加一条新的记录，自动填充个人所得税
alter trigger updatedebit
on attend for insert
as begin
declare @eid char(6),@sh money
select @eid=Emid from inserted
select @sh=swage from shouldp where Emid=@eid
update Changepay
set Cdebit=case
 when @sh<=3500 then 0
 when @sh>3500 and @sh<=5000  then (@sh-3500)*0.03 
 when @sh>5000 and @sh<=8000  then (@sh-3500)*0.1 
 when @sh>8000 and @sh<=12500  then (@sh-3500)*0.2 
 when @sh>12500 and @sh<=38500  then (@sh-3500)*0.25
 when @sh>38500 and @sh<=58500  then (@sh-3500)*0.3 
 when @sh>38500 and @sh<=83500  then (@sh-3500)*0.35 
 when @sh>83500 then (@sh-3500)*0.45
 end
end

--3当考勤登记表中添加一条新的记录，“应发工资”和“实发工资”自动填充
alter trigger updatespayandrpay
on attend for  insert
as begin
declare @eid char(6),@cover money,@cdebit money,@cbsence money,
@bwage money,@byear money,@bpostp money ,@date date
select @eid=emid,@date=adate from inserted
select @cover=Cover, @cdebit =Cdebit,@cbsence=Cbsence from Changepay
where Emid=@eid
select @bwage=Bwage,@byear=Byear,@bpostp=Bpostp   from Basapay
where Emid=@eid
insert into  Shouldp
values(@date,@eid,@bwage+@byear+@bpostp+@cover-@cbsence)
insert into Realwage
values(@date,@eid,(@bwage+@byear+@bpostp+@cover-@cbsence)-@cdebit)
End;

--4当考勤表添加一条记录，自动修改出勤天数，变动工资表中的“加班工资”“考勤扣款”自动更新
alter trigger attendinsert
on Attend after  insert 
as begin 
declare @eid char(6),@new1 int,@new2 int,@date date
select @eid=Emid,@new1= Aover,@new2=Aleave ,@date=adate from inserted
update attend 
set afate=20-@new2
insert Changepay(Cdate,Emid, Cover,Cbsence) 
values(@date,@eid,@new1*150,@new2*100)
End;
--5创建触发器当在岗位变更表插入数据时，修改基本工资表中员工岗位信息
create trigger updatebasapay
on jobchange for insert
as begin
declare @eid char(6),@new nchar(20)
select @eid=Emid,@new=Jnew from inserted
update Basapay 
set Bpost=@new 
where Emid=@eid
end


--创建数据库主密钥和非对称密钥用于数据加密
create master key encryption by password = '0808'
create asymmetric key hary --名称
with algorithm = rsa_512     --加密算法
encryption by password ='0101'