
select * from listings as l 
join users as u on l.hostid = u.userid  
where u.name = "Carla Mendes" ;

select l.city , avg(r.rating) as Average_Rating from reviews as r 
join listings as l on r.listingid = l.listingid 
group by city
order by Average_Rating desc ;

select u.name, u.ContactNumber, sum(b.TotalPrice) as TotalAmount from bookings as b 
join users as u on b.guestid = u.userid
GROUP BY u.Name, u.ContactNumber
order by TotalAmount desc;

SELECT *
FROM Listings
WHERE ListingId NOT IN (
    SELECT ListingId FROM Bookings
);


select * from users;
select * from bookings;
select * from listings ;
ALTER TABLE Users 
CHANGE COLUMN ConatactNumber ContactNumber VARCHAR(50);