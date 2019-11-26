--查询20号部门的所有员工信息
select * from emp where deptno=20
--查询所有工种为CLERK的员工的工号、员工名和部门名
select empno,ename,deptno from emp where job = 'CLERK'
--查询奖金（COMM）高于工资（SAL）的员工信息
select * from emp where nvl(comm,0) > sal
--查询奖金高于工资的20%的员工信息
select *  from emp where nvl(comm,0) > sal*0.2
--查询10号部门中工种为MANAGER和20号部门中工种为CLERK的员工的信息
select * from emp where (job='MANAGER' and deptno=10) or (job='CLERK' and deptno=20);
--查询所有工种不是MANAGER和CLERK，且工资大于或等于2000的员工的详细信息
select * from emp where job not in ('MANAGER','CLERK') and sal >= 2000;
select *
  from emp
 where job != 'MANAGER'
   and job != 'CLERK'
   and sal >= 2000;
   
select *
  from emp
 where job <> 'MANAGER'
   and job <> 'CLERK'
   and sal >= 2000;
   
--查询有奖金的员工的不同工种
select distinct job from emp where comm is not null
--查询所有员工工资和奖金的和
select sum(sal)+sum(nvl(comm,0)) 工资和奖金和 from emp
--查询没有奖金或奖金低于100的员工信息
select  * from emp where comm is null or comm <100
--查询各月倒数第2天入职的员工信息
select * from emp where trunc(hiredate)+(interval '8' Day) = last_day(hiredate)
select  hiredate, trunc(hiredate)+(interval '1' Day) from emp 
--查询员工工龄大于或等于10年的员工信息
select * from emp where trunc(hiredate)+(interval '35' YEAR) < sysdate
select * from emp where extract(YEAR from hiredate)+35 < extract(YEAR from sysdate) 

select extract(YEAR from hiredate)+35 from emp

--查询员工信息，要求以首字母大写的方式显示所有员工的姓名
select empno , initcap(ename), job from emp

--查询员工名正好为6个字符的员工的信息

select * from emp where lengthB(ename) =6
--查询员工名字中不包含字母“S”员工
select * from emp where ename <> '%S%'

select * from emp where instr(ename,'S',1,1) = 0

select ename, instr(ename,'S',1,1) from emp
--查询员工姓名的第2个字母为“M”的员工信息

select * from emp where ename like '_M%'
--查询所有员工姓名的前3个字符
select substr(ename,0,3) from emp ;
--查询所有员工的姓名，如果包含字母“s”，则用“S”替换
select translate(nls_lower(ename),'s','S') from emp;

--查询员工的姓名和入职日期，并按入职日期从先到后进行排列
select ename 姓名, hiredate 入职日期 from emp order by hiredate
--显示所有的姓名、工种、工资和奖金，按工种降序排列，若工种相同则按工资升序排列
select ename 姓名 , job 工种, sal 工资,comm 奖金 from emp order by job desc,sal
--显示所有员工的姓名、入职的年份和月份，若入职日期所在的月份排序，若月份相同则按入职的年份排序
select ename 姓名,
       extract(YEAR from hiredate) year,
       extract(MONTH from hiredate) month
  from emp
 order by month, year
 --查询在2月份入职的所有员工信息
 select * from emp where extract(MONTH from hiredate) = 2
 select * from emp where to_char(hiredate,'mm') = 2  
 --查询所有员工入职以来的工作期限，用“**年**月**日”的形式表示
 select sysdate-hiredate  from emp 
 
 









