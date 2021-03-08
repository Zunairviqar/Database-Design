-- queries

-- List all people (names are adequate) that have flags in any sort order
select * from customer where problematic = TRUE;

-- List all available scooters in any sort order
select si.scooter_id from scooter_info si
where si.scooter_id NOT IN
(select si.scooter_id from scooter_info si inner join transaction t on t.scooter_info_scooter_id = si.scooter_id where t.completed = 0);

-- List all scooters (scooter model and manufacturer, along with person's name… and when they're due back) that are being borrowed in order of when they're due back ordered by when whey were due increasing (that is, earlier ones appear first, and more recent ones appear later)

select c.name as customer_name, t.return_date as due_back_on, t.scooter_info_scooter_id as scooter_id, si.model_number,  m.name as manufacturer_name from transaction t inner join scooter_info si on si.scooter_id = t.scooter_info_scooter_id inner join customer c on c.customer_id = t.customer_customer_id inner join manufacturer m on m.manufacturer_id = si.manufacturer_manufacturer_id where t.completed = 0 order by t.return_date;

-- List the top 5 people (names and number of refersrals) that have the most referrals sorted by most referrals descending
select customer_customer_id_referred as customer_referred, count(customer_customer_id_referred) as number_of_referrals from referral GROUP BY customer_customer_id_referred DESC limit 5;

-- Given a unique identifier for a person, show all of the dates that person has borrowed a scooter in chronological order (from the first time they borrowed a scooter to the most recent)
select borrow_date, customer_customer_id from transaction where customer_customer_id LIKE '%zun111%';

-- List all of the manufacturers of scooters in your database, even if you don't currently have any of their scooters in your inventory
select * from manufacturer;
