create view best_beers as (select avg(r.rating) as avg_rating , b.name as beer_name, br.name as brewer_name from beers b inner join brewers br on br.id=b.brewer_id inner join ratings r on r.beer_id=b.id group by b.id, br.id order by avg_rating desc);

CREATE VIEW latest_rating as (select avg(r.rating) as latest_rating, b.name as beer_name from beers b inner join ratings r on r.beer_id = b.id where r.created_on > (SELECT CURRENT_TIMESTAMP + INTERVAL '-6 months') group by b.id);

create view similar_beers as(select r.beer_id as beer_id , avg(r.rating) as avg_rating ,u.id as user_id from ratings r inner join beers b on r.beer_id = b.id inner join beer_styles bs on b.style_id=bs.id inner join users u on bs.id = ANY(u.preferences) left outer join ratings r on r.id = u.id where r.beer_id <> b.id group by r.beer_id, u.id order by avg_rating desc);
