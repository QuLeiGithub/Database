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
 select ename ����,
        floor((sysdate - hiredate) / 365)||'��' ||
        floor(mod((sysdate - hiredate), 365) / 30)||'��'||
        ceil(mod(mod((sysdate-hiredate),365),30))||'��' ��������
   from emp
--��ѯ������һ��Ա���Ĳ�����Ϣ
select distinct deptno from emp

select distinct d.* from dept d right join emp e on d.deptno = e.deptno 

select d.dname,count(empno) ��������
from emp e
right join dept d on d.deptno=e.deptno
group by d.dname,e.deptno
having count(empno)>1

select d.* from dept d where d.deptno in (select distinct deptno from emp where mgr is not null);
--��ѯ���ʱ�SMITHԱ�����ʸߵ�����Ա����Ϣ
select * from emp where sal > (select sal from emp where ename ='SMITH') order by sal
--��ѯ����Ա������������ֱ���ϼ�������
select e.ename ���� , ee.ename �쵼 from emp e  left join  (select ename, empno from emp) ee  on e.mgr = ee.empno
--��ѯ��ְ����������ֱ���ϼ��쵼������Ա����Ϣ
select e.ename Ա��,tem.ename �쵼, e.hiredate Ա����ְʱ��,tem.hiredate �쵼��ְʱ�� from emp e
  left join (select empno, ename, hiredate from emp) tem
    on e.mgr = tem.empno
   and e.hiredate < tem.hiredate
--��ѯ���в��ż���Ա����Ϣ��������Щû��Ա���Ĳ���
select * from dept d  left join emp e on d.deptno = e.deptno
--��ѯ���й���ΪCLERK��Ա�����������䲿������
select e.ename,e.job,d.dname from emp e  join dept d  on e.deptno = d.deptno  where e.job = 'CLERK'

--��ѯ��͹��ʴ���2500�ĸ��ֹ���
select job,min(sal) from emp group by job having  min(sal) > 2500
--��ѯ��͹��ʵ���2000�Ĳ��ż���Ա����Ϣ
select e.* from emp e where e.deptno in (select deptno from emp group by deptno having min(sal) < 2000)

    select *
      from emp
     where deptno in
           (select deptno
              from (select min(sal) min_sal, deptno from emp group by deptno)
             where min_sal < '2000');
--��ѯ��SALES���Ź�����Ա����������Ϣ
select e.ename from emp e join dept d on e.deptno = d.deptno  where d.dname = 'SALES'

--��ѯ���ʸ��ڹ�˾ƽ�����ʵ�����Ա����Ϣ
select * from emp  where sal > (select avg(sal) from emp )
--��ѯ��SMITHԱ��������ͬ����������Ա����Ϣ
select * from emp where job = (select job from emp where ename = 'SMITH')

--�г����ʵ���30�Ų�����ĳ��Ա�����ʵ�����Ա���������͹���
select ename,sal from emp where sal in (select sal from emp where deptno = 20) and deptno <> 20
select ename,sal from emp where sal = any(select sal from emp where deptno = 10) and deptno <> 10
--��ѯ���ʸ���30�Ų����й���������Ա���Ĺ��ʵ�Ա�������͹���
select ename,sal  from emp where sal > (select max(sal) from emp where deptno = 30)
select ename,sal from emp where sal > all(select sal from emp where deptno = 30)
--��ѯÿ�������е�Ա��������ƽ�����ʺ�ƽ����������
select deptno ���� , count(*)  Ա������, avg(sal) ƽ������, avg(floor((sysdate - hiredate) / 365))  from emp group by deptno
--��ѯ����ͬһ�ֹ�����������ͬһ���ŵ�Ա����Ϣ
select distinct e.* from emp e join  emp tem on (e.job = tem.job and e.deptno <> tem.deptno)







