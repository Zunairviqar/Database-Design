-- insert

INSERT INTO customer (customer_id, name, is_borrowing, problematic) VALUES
('zun111','Zunair', 0, 1),
('viq222','Viqar', 1, 1),
('has333','Hasin', 0, 0),
('mar444','Mariam', 1, 1);

INSERT INTO contact_info (contact_id, customer_customer_id, email, phone_number, home_address, date_recorded) VALUES
('1','zun111', 'zunairv@gmail.com', '501463111', 'A2C 101 NYUAD', '2019-12-01 12:30:00'),
('2','viq222', 'viqar@gmail.com', '501463222', 'A2C 202 NYUAD', '2019-12-01 12:30:00'),
('3','has333', 'hasin@gmail.com', '501463333', 'A2C 303 NYUAD', '2019-12-01 12:30:00'),
('4','mar444', 'mariam@gmail.com', '501463444', 'A2C 404 NYUAD', '2019-12-01 12:30:00');

INSERT INTO referral (referral_id, customer_customer_id, customer_customer_id_referred) VALUES
('1','has333', 'mar444'),
('2','zun111', 'mar444');

INSERT INTO manufacturer (manufacturer_id, name, country) VALUES
('1','yamaha', 'Pakistan'),
('2','toyota', 'Sweden'),
('3','honda', 'India');

INSERT INTO scooter_info (scooter_id, scooter_condition, manufacturer_manufacturer_id, model_number, scooter_range, scooter_weight) VALUES
('1','used', 1,'yam001', 15.0, 40),
('2','used', 2, 'toy001', 25.0, 30),
('3','new', 1, 'yam003', 30.0, 30),
('4','slightly-used', 1,'toy002', 30.0, 30);

INSERT INTO transaction (transaction_id, customer_customer_id, scooter_info_scooter_id, scooter_info_manufacturer_manufacturer_id, borrow_date, return_date, date_returned, returned_late, return_damages, completed) VALUES
('1','zun111', '1',1, '2020-01-01', '2020-01-04', '2020-01-03', 1, 'none', 1)
('2','viq222', '2',2,'2020-01-05', '2020-01-09', '2020-01-09', 1, 'none', 1),
('3','has333', '4',1, '2020-01-10', '2020-01-14', NULL,NULL,NULL,0),
('4','zun111', '1',1, '2020-01-11', '2020-01-15', NULL,NULL,NULL,0);

INSERT INTO notes (notes_id, transaction_transaction_id, transaction_customer_customer_id, transaction_scooter_info_scooter_id, transaction_scooter_info_manufacturer_manufacturer_id, category, note) VALUES
('1','2', 'viq222', '2',2, 'return condition', 'handle grips missing'),
('2','2', 'viq222', '2',2, 'malfunction', 'battery issues throughout');
