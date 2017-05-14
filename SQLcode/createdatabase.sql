--创建数据库
CREATE DATABASE SalarySystem
ON
(
NAME=SalarySystem,
FILENAME='D:\WorkSqlServer\SalarySystem.mdf'
)
LOG ON(
NAME=SalarySystem_log,
FILENAME='D:\WorkSqlServer\SalarySystem_log.ldf'
)