select * from olympics;

-- Sports or events that Turkey has won the most medals -- 
select year, event, count(medal) from olympics
where team = "Turkey" and medal <> "NA"
group by year, event
order by count(medal) desc;

-- Events which are played the most in summer olympics games
select event, count(event) as number_of_times_played from olympics
where season = "Summer"
group by event
order by count(event) desc;

-- Countries which have won the most silver and bronze medals and at least one gold medal --

select team, sum(Silver), sum(Bronze), sum(Gold) from ( select *,
    case medal when "Silver" then 1 else 0 end as Silver,
    case medal when "Bronze" then 1 else 0 end as Bronze,
    case medal when "Gold" then 1 else 0 end as Gold
    from olympics
) as countMedals
group by team
having sum(Gold) > 0
order by sum(Silver) desc;

-- The player who won the most gold medals -- 
select name, sum(Gold) from(
   select *, 
   case medal when "Gold" then 1 else 0 end as Gold
   from olympics
) goldMed
group by name
order by sum(Gold) desc;

-- Sport that has the maximum events -- 
select sport, count(*) from olympics
group by Sport 
order by count(*) desc;

-- The year which has the maximum events -- 
select year, count(event) from olympics
group by year
order by count(event) desc;
