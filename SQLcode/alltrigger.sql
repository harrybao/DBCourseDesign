--1��������������¼��Ա����Ϣʱ�Զ����û���¼���н�����Ӧ���˺ź�����
CREATE TRIGGER greatelogin
ON Employee FOR INSERT
AS
DECLARE @uid CHAR(6)
SELECT @uid=Emid FROM inserted
INSERT INTO Euser values(@uid,@uid)
SELECT * FROM Euser

----2�����ڵǼǱ������һ���µļ�¼���Զ�����������˰
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

--3�����ڵǼǱ������һ���µļ�¼����Ӧ�����ʡ��͡�ʵ�����ʡ��Զ����
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

--4�����ڱ����һ����¼���Զ��޸ĳ����������䶯���ʱ��еġ��Ӱ๤�ʡ������ڿۿ�Զ�����
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
--5�������������ڸ�λ������������ʱ���޸Ļ������ʱ���Ա����λ��Ϣ
create trigger updatebasapay
on jobchange for insert
as begin
declare @eid char(6),@new nchar(20)
select @eid=Emid,@new=Jnew from inserted
update Basapay 
set Bpost=@new 
where Emid=@eid
end


--�������ݿ�����Կ�ͷǶԳ���Կ�������ݼ���
create master key encryption by password = '0808'
create asymmetric key hary --����
with algorithm = rsa_512     --�����㷨
encryption by password ='0101'