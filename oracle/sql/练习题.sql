--��ѯ20�Ų��ŵ�����Ա����Ϣ
select * from emp where deptno=20
--��ѯ���й���ΪCLERK��Ա���Ĺ��š�Ա�����Ͳ�����
select empno,ename,deptno from emp where job = 'CLERK'
--��ѯ����COMM�����ڹ��ʣ�SAL����Ա����Ϣ
select * from emp where nvl(comm,0) > sal
--��ѯ������ڹ��ʵ�20%��Ա����Ϣ
select *  from emp where nvl(comm,0) > sal*0.2
--��ѯ10�Ų����й���ΪMANAGER��20�Ų����й���ΪCLERK��Ա������Ϣ
select * from emp where (job='MANAGER' and deptno=10) or (job='CLERK' and deptno=20);
--��ѯ���й��ֲ���MANAGER��CLERK���ҹ��ʴ��ڻ����2000��Ա������ϸ��Ϣ
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
   
--��ѯ�н����Ա���Ĳ�ͬ����
select distinct job from emp where comm is not null
--��ѯ����Ա�����ʺͽ���ĺ�
select sum(sal)+sum(nvl(comm,0)) ���ʺͽ���� from emp
--��ѯû�н���򽱽����100��Ա����Ϣ
select  * from emp where comm is null or comm <100
--��ѯ���µ�����2����ְ��Ա����Ϣ
select * from emp where trunc(hiredate)+(interval '8' Day) = last_day(hiredate)
select  hiredate, trunc(hiredate)+(interval '1' Day) from emp 
--��ѯԱ��������ڻ����10���Ա����Ϣ
select * from emp where trunc(hiredate)+(interval '35' YEAR) < sysdate
select * from emp where extract(YEAR from hiredate)+35 < extract(YEAR from sysdate) 

select extract(YEAR from hiredate)+35 from emp

--��ѯԱ����Ϣ��Ҫ��������ĸ��д�ķ�ʽ��ʾ����Ա��������
select empno , initcap(ename), job from emp

--��ѯԱ��������Ϊ6���ַ���Ա������Ϣ

select * from emp where lengthB(ename) =6
--��ѯԱ�������в�������ĸ��S��Ա��
select * from emp where ename <> '%S%'

select * from emp where instr(ename,'S',1,1) = 0

select ename, instr(ename,'S',1,1) from emp
--��ѯԱ�������ĵ�2����ĸΪ��M����Ա����Ϣ

select * from emp where ename like '_M%'
--��ѯ����Ա��������ǰ3���ַ�
select substr(ename,0,3) from emp ;
--��ѯ����Ա�������������������ĸ��s�������á�S���滻
select translate(nls_lower(ename),'s','S') from emp;

--��ѯԱ������������ְ���ڣ�������ְ���ڴ��ȵ����������
select ename ����, hiredate ��ְ���� from emp order by hiredate
--��ʾ���е����������֡����ʺͽ��𣬰����ֽ������У���������ͬ�򰴹�����������
select ename ���� , job ����, sal ����,comm ���� from emp order by job desc,sal
--��ʾ����Ա������������ְ����ݺ��·ݣ�����ְ�������ڵ��·��������·���ͬ����ְ���������
select ename ����,
       extract(YEAR from hiredate) year,
       extract(MONTH from hiredate) month
  from emp
 order by month, year
 --��ѯ��2�·���ְ������Ա����Ϣ
 select * from emp where extract(MONTH from hiredate) = 2
 select * from emp where to_char(hiredate,'mm') = 2  
 --��ѯ����Ա����ְ�����Ĺ������ޣ��á�**��**��**�ա�����ʽ��ʾ
 select sysdate-hiredate  from emp 
 
 









