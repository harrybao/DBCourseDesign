use salarysystem
--添加约束出勤天数在0-20天之间
alter table attend
 add constraint ck_1 check( afate>0 and afate<=20) 
 --约束添加考勤信息的时间为默认时间
 alter table attend
 add constraint ck_10 default(getdate()) for adate
 --员工性别限制为只能输入男女
 alter table employee
 add constraint ck_2 check( esex in ('男','女'))
 --电话号码只能输入数据
  alter table employee
 add constraint ck_3 check(ephone  
 like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

  alter table employee
 add unique (idnum)
 --银行卡号只能输入数字
 alter table employee
 add constraint ck_4 check(cardno  
 like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]
 [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
 --邮箱输入必须带@字符
  alter table employee
 add constraint ck_5 check(email like '%@%')
 --基本工资大于3000
 alter table basapay
 add constraint ck_6 check( bwage>3000)
 alter table basapay
 add constraint ck_7 check( byear>300 and byear<2000)
 alter table basapay
 add constraint ck_8 check( bpostp>500 and bpostp<3000)
 --部门名唯一约束
 alter table branch
add unique (bname)
--密码的长度不能小于六位
alter table euser
add constraint ck_9 check( len(pwd)>=6)
--加班工资，个人所得税，缺勤扣款，加班天数，休假天数，请假天数默认为0
 alter table changepay
 add constraint ck_11 default(0) for cover
  alter table changepay
 add constraint ck_12 default(0) for cdebit
  alter table changepay
 add constraint ck_13 default(0) for cbsence
 alter table attend
 add constraint ck_15 default(0) for aover
  alter table attend
 add constraint ck_16 default(0) for aoff
  alter table attend
 add constraint ck_17 default(0) for aleave
   alter table attend
 add constraint ck_18 default(20) for afate
 alter table jobchange
 add constraint ck_14 default(getdate()) for jdate
alter table basapay
 add constraint fk foreign key(brid) references branch(brid)