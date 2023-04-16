-- 1

alter table nguoi_an 
add   primary key(ten);

alter table lui_toi 
add   primary key(ten, quanPizza);

alter table an 
add   primary key(ten, quanPizza);

alter table phuc_vu 
add   primary key (quanpizza, pizza, gia);

alter      table lui_toi 
add        foreign key (ten) 
references nguoi_an(ten);

alter      table an 
add        foreign key (ten) 
references nguoi_an(ten);

alter table phuc_vu 
add  check (gia > 0);

-- 2

select pizza 
from   phuc_vu
where  quanpizza = 'Pizza Hut';

-- 3

select distinct pizza 
from   phuc_vu;

-- 4

select distinct quanpizza 
from   phuc_vu
where  lower(quanPizza) like '%m%';

-- 5

select   n.ten, n.tuoi 
from     lui_toi l
join     nguoi_an n on l.ten = n.ten
where    quanpizza = 'Dominos'
order by n.tuoi desc;

-- 6

select   quanpizza, count(*)
from     phuc_vu
group by quanpizza;

-- 7
SELECT quanPizza, pizza, gia
FROM   PHUC_VU
WHERE  (pizza, gia) IN (
    SELECT   pizza, MAX(gia) AS gia
    FROM     PHUC_VU
    GROUP BY pizza
);

-- 8

select distinct quanpizza 
from   phuc_vu
where  pizza in (
    select pizza 
    from   an
    where  ten = 'Ian'
);

-- 9

select distinct quanpizza, pizza
from   phuc_vu
where  pizza in (
    select distinct pizza 
    from   phuc_vu 
    minus (
        select pizza 
        from   an
        where  ten = 'Eli'
    )
); 

-- 10

select quanPizza 
from   phuc_vu
minus (
    select distinct quanpizza
    from   phuc_vu
    where  pizza in (
        select distinct pizza 
        from   phuc_vu 
        minus (
            select pizza 
            from  an
            where ten = 'Eli'
        )
    )
); 

-- 11
select distinct quanpizza
from   phuc_vu
where  gia > (
    select max(gia)
    from   phuc_vu
    where  quanpizza = 'New York Pizza'
);

-- 12

select   quanpizza, max(gia)
from     phuc_vu
group by quanpizza having max(gia) < 10;

-- 13

select pizza
from   phuc_vu
where  quanpizza = 'New York Pizza'
intersect (
    select pizza
    from   phuc_vu
    where  quanpizza = 'Dominos'
);

-- 14

select pizza
from   phuc_vu
where  quanpizza = 'Little Caesars'
minus (
    select pizza
    from   phuc_vu
    where  quanpizza = 'Pizza Hut'
);

-- 15

select quanpizza
from   phuc_vu
where  pizza = all (
    select distinct pizza
    from   phuc_vu
);

-- 16

select   p.quanpizza
from     an a
join     phuc_vu p on a.pizza = p.pizza
where    a.ten = 'Gus'
group by p.quanpizza having count(*) >= 2;

-- 17

select   p.quanpizza
from     an a
join     phuc_vu p on a.pizza = p.pizza
where    a.ten = 'Ian'
group by p.quanpizza having count(*) = (
    select count(*)
    from   an
    where  ten = 'Ian'
);

-- 18

select   ten, count(distinct quanpizza)
from     lui_toi
group by ten having count(*) >= 3;

-- 19

select   quanpizza, count(*) 
from     phuc_vu
group by quanpizza;

-- 20

select   a1.ten
from     an a1
join     an a2 on a1.pizza = a2.pizza
where    a2.ten = 'Hil' and a1.ten <> 'Hil'
group by a1.ten having count(*) = (
    select count(*)
    from   an
    where  ten = 'Hil'
);
