--创建视图用于查看员工的工资发放情况显示姓名，所属部门，职位以及工资的信息
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
