select
* 
from hotel_reservation;

# 1. What is the total number of reservations in the dataset?
select 
Count(*) as Total_Reservation 
FROM hotel_reservation;

#2. Which meal plan is the most popular among guests?
select
type_of_meal_plan,
count(type_of_meal_plan) as total_no
FROM hotel_reservation
group by type_of_meal_plan
order by total_no desc
limit 1;

# 3. What is the average price per room for reservations involving children?
select 
round(avg(avg_price_per_room),2)
FROM hotel_reservation
where no_of_children > 0;

# 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
select 
count(*) as Total_reservation, 
substring(arrival_date, 7, 4) as year
FROM hotel_reservation
where substring(arrival_date, 7, 4) = '2017' or '2018'
group by year;

# 5. What is the most commonly booked room type?
select 
room_type_reserved,
count(room_type_reserved) as Total_no
FROM hotel_reservation
group by room_type_reserved
order by Total_no desc
limit 1;

# 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select
count(*) as total_reservation_on_weekend_nights
from hotel_reservation
where no_of_weekend_nights > 0;

# 7. What is the highest and lowest lead time for reservations?
select
max(lead_time) as max_lead_time,
min(lead_time) as min_lead_time
from hotel_reservation;

# 8. What is the most common market segment type for reservations?
select
market_segment_type,
count(*) as total_no
from hotel_reservation
group by market_segment_type
order by total_no desc
limit 1;

# 9. How many reservations have a booking status of "Confirmed"?
select
booking_status,
count(*) as Total_confirmed_status
from hotel_reservation
where booking_status = 'Not_canceled';

# 10. What is the total number of adults and children across all reservations?
select
sum(no_of_adults) as total_adults,
sum(no_of_children) as total_children
from hotel_reservation;

# 11. What is the average number of weekend nights for reservations involving children?
select
round(avg(no_of_weekend_nights)) as weekend_nights_with_children
from hotel_reservation
where no_of_children > 0;

# 12. How many reservations were made in each month of the year?
select
substring(arrival_date, 4, 2) as month,
count(*) as total_reservation
from hotel_reservation
group by substring(arrival_date, 4, 2)
order by month asc;

# 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select
room_type_reserved,
round(avg(no_of_week_nights + no_of_weekend_nights),2) as avg_nights
from hotel_reservation
group by room_type_reserved;

# 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
select
room_type_reserved as most_common_room_type_reserved,
count(room_type_reserved) as total_reservation,
round(avg(avg_price_per_room)) as avg_price
from hotel_reservation
where no_of_children > 0
group by room_type_reserved
order by total_reservation desc;

# 15. Find the market segment type that generates the highest average price per room.
select
market_segment_type,
round(avg(avg_price_per_room),2) as avg_price
from hotel_reservation
group by market_segment_type
order by avg_price desc
limit 1;














