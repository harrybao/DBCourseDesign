use salarysystem
--���Լ������������0-20��֮��
alter table attend
 add constraint ck_1 check( afate>0 and afate<=20) 
 --Լ����ӿ�����Ϣ��ʱ��ΪĬ��ʱ��
 alter table attend
 add constraint ck_10 default(getdate()) for adate
 --Ա���Ա�����Ϊֻ��������Ů
 alter table employee
 add constraint ck_2 check( esex in ('��','Ů'))
 --�绰����ֻ����������
  alter table employee
 add constraint ck_3 check(ephone  
 like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

  alter table employee
 add unique (idnum)
 --���п���ֻ����������
 alter table employee
 add constraint ck_4 check(cardno  
 like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]
 [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
 --������������@�ַ�
  alter table employee
 add constraint ck_5 check(email like '%@%')
 --�������ʴ���3000
 alter table basapay
 add constraint ck_6 check( bwage>3000)
 alter table basapay
 add constraint ck_7 check( byear>300 and byear<2000)
 alter table basapay
 add constraint ck_8 check( bpostp>500 and bpostp<3000)
 --������ΨһԼ��
 alter table branch
add unique (bname)
--����ĳ��Ȳ���С����λ
alter table euser
add constraint ck_9 check( len(pwd)>=6)
--�Ӱ๤�ʣ���������˰��ȱ�ڿۿ�Ӱ��������ݼ��������������Ĭ��Ϊ0
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