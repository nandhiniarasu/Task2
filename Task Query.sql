--1--
select*from authors
select city,count(au_id) number from authors group by city

--2--
select distinct city,au_fname,au_lname from authors where city not in(select city from publishers where pub_name='New Moon Books')

--3--
create proc proc_UpdatedCost(@au_fname varchar(20),@au_lname varchar(40),@price float)
as begin
update titles set price=@price
select au_fname,au_lname,price,title from authors, titles where au_fname=@au_fname
end
exec proc_UpdatedCost Charlene,Locksley,400

--4--

alter function fun_TaxAmount(@qty int)
returns float
as
begin
declare
@tax float
set @tax='0%'
if(@qty>0 and @qty<10)
set @tax='2%'

else if(@qty >=10 and @qty<20)
set @tax='5%'
else if(@qty >=20 and @qty<50)
set @tax='6%'
else 
set @tax='7.5%'
return @tax
end
select title_id,qty,dbo,fun_TaxAmount(qty) as Tax from sales;
