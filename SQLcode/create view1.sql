--������ͼ���ڲ鿴Ա���Ĺ��ʷ��������ʾ�������������ţ�ְλ�Լ����ʵ���Ϣ
create view employeeJobforWage
as
select e.Ename ,Bname,Bpost Bwage, byear,bpostp,cover,cdebit,cbsence,swage,rwage
from Basapay b, Changepay c,Shouldp s,Realwage r ,Employee e,Branch q
where b.Emid=c.Emid
and b.Emid=s.Emid
and b.Emid=r.Emid
and b.Emid=e.Emid
and b.Brid=q.Brid

select * from employeeJobforWage
