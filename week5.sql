delimiter //
create procedure week5()
begin
declare sql_error int default false;
declare continue handler for sqlexception set sql_error = true;
start transaction;

insert into orders values (null,"2023-01-01", 01, 60, 1);
set @last_id = last_insert_id();
insert into orders_detail values (null, "50%", 1, @last_id, 1);

insert into orders values (null,"2023-01-02", 01, 85, 1);
set @last_id = last_insert_id();
insert into orders_detail values (null, "25%", 1, @last_id, 4);

insert into orders values (null,"2023-01-03", 01, 70, 1);
set @last_id = last_insert_id();
insert into orders_detail values (null, "50%", 1, @last_id, 2);

if sql_error = false then commit; select "Success";
else rollback; select "Fail";
end if;
end //
delimiter ;

call week5();


select member_name,level_of_sweetness,count(*)as Count
from members join orders using(idmembers)
join orders_detail using(idorders)
group by member_name,level_of_sweetness
order by level_of_sweetness;
 



