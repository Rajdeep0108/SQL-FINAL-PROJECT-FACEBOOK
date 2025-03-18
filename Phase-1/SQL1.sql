
-- PROJECT OF SQL

#FACEBOOK DATABASE

-- DATABASE RELATED QUERIES --
-- CREATE FACEBOOK DATABASE 
CREATE DATABASE FACEBOOK ;

-- SHOW ALL DATABASES
SHOW DATABASES;

-- SHOW DATABASES THAT MATCH A SPECIFIC PATTERN 
SHOW DATABASES LIKE 'FACE%';  


-- SHOW DATABASES THAT MATCH A SPECIFIC CONDITION
SHOW DATABASES WHERE `Database` LIKE 'FACE%';  -- Shows databases that start with 'FACE'
SHOW DATABASES WHERE `Database` NOT LIKE 'FACE%';  -- Shows databases that do not start with 'FACE'
SHOW DATABASES WHERE `Database` = 'FACEBOOK';  -- Shows the 'FACEBOOK' database
SHOW DATABASES WHERE `Database` != 'FACEBOOK';  -- Shows databases that are not 'FACEBOOK'
SHOW DATABASES WHERE `Database` IN ('FACEBOOK', 'NewFACEBOOK');  -- Shows 'FACEBOOK' and 'FACEBOOK' databases
SHOW DATABASES WHERE `Database` NOT IN ('FACEBOOK', 'NewFACEBOOK');  -- Shows databases that are not 'FACEBOOK' or 'FACEBOOK'


-- CREATE FACEBOOK DATABASE IF IT DOES NOT EXISTS 
CREATE DATABASE IF NOT EXISTS FACEBOOK; 

-- DROP FACEBOOK DATABASE
DROP DATABASE FACEBOOK ;

-- DROP FACEBOOK DATABASE IF IT EXISTS 
DROP DATABASE IF EXISTS FACEBOOK ;

-- CREATE FACEBOOK DATABASE IF IT DOES NOT EXISTS 
CREATE DATABASE IF NOT EXISTS FACEBOOK ;

-- USE FACEBOOK DATABASE 
USE FACEBOOK ;

-- SELECT THE CURRENT DATABASE 
SELECT DATABASE();  -- Returns the name of the current database

-- TABLE 1 USERS 
CREATE TABLE users (
-- unique identifier for each user
user_id INT PRIMARY KEY AUTO_INCREMENT,
-- username of each users
username VARCHAR(50) NOT NULL,
-- email_id for each users
email VARCHAR(100) NOT NULL UNIQUE,
-- password fo each users 
password VARCHAR(100) NOT NULL,
-- created_at for each users 
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  );

INSERT INTO users (username, email, password) VALUES
    ('rohan_sharma', 'rohan.sharma@example.com', 'password123'),
    ('priya_gupta', 'priya.gupta@example.com', 'password456'),
    ('karan_singh', 'karan.singh@example.com', 'password789'),
    ('riya_jain', 'riya.jain@example.com', 'password321'),
    ('amit_kumar', 'amit.kumar@example.com', 'password654'),
    ('soniya_sharama', 'sonia.sharma@example.com', 'password987'),
    ('vikram_singh', 'vikram.singh@example.com', 'password111'),
    ('ritu_gupta', 'ritu.gupta@example.com', 'password222'),
    ('suresh_kumar', 'suresh.kumar@example.com', 'password333'),
    ('anita_sharma', 'anita.sharma@example.com', 'password444');
    
-- see table data
select * from users;


    
-- TABLE 2 PROFILES
 
CREATE TABLE profiles (
-- unique identifier for each profiles
id INT AUTO_INCREMENT PRIMARY KEY,
-- First name of the profiles
first_name VARCHAR(50),
-- last name of the profile
last_name VARCHAR(50),
-- email of the profile
email VARCHAR(100),
-- birthdate of each profile 
birthdate DATE,
-- city of the profile
city VARCHAR(50),
-- bio of each profiles
bio TEXT,
-- status of each profile 
status varchar (20) not null check (status in ('updated','not-updated')));

INSERT INTO profiles
(first_name, last_name, email, birthdate, city, bio,status)
VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '1990-01-15', 'New York', 'Enjoys hiking and photography.','updated'),
('Bob', 'Smith', 'bob.smith@example.com', '1985-03-22', 'Los Angeles', 'Tech enthusiast and coffee lover.','not-updated'),
('Carol', 'Taylor', 'carol.taylor@example.com', '1992-07-08', 'Chicago', 'Passionate about music and art.','updated'),
('David', 'Wilson', 'david.wilson@example.com', '1988-11-12', 'Miami', 'Loves beach vacations and reading.','not-updated'),
('Eve', 'Anderson', 'eve.anderson@example.com', '1995-09-10', 'Seattle', 'Enjoys outdoor adventures and coding.','updated'),
('Frank', 'Thomas', 'frank.thomas@example.com', '1980-02-28', 'Austin', 'Food blogger and chef.','not-updated'),
('Grace', 'Lee', 'grace.lee@example.com', '1993-05-20', 'Boston', 'Yoga instructor and wellness advocate.','updated'),
('Henry', 'Walker', 'henry.walker@example.com', '1987-12-05', 'San Francisco', 'Startup founder and traveler.','updated'),
('Ivy', 'Hall', 'ivy.hall@example.com', '1996-04-18', 'Denver', 'Pet lover and nature enthusiast.','not-updated'),
('Jack', 'Young', 'jack.young@example.com', '1983-06-30', 'Houston', 'Avid gamer and tech reviewer.','updated');

-- see table data
select * from profiles ;


-- TABLE 3 POSTS 

CREATE TABLE posts (
-- unique identifier for each posts
post_id INT AUTO_INCREMENT PRIMARY KEY,
-- user_id for each posts
user_id INT,
-- content for each post
content TEXT,
-- post_date of each posts
post_date DATETIME,
 -- Foreign key referencing the post table
FOREIGN KEY (user_id) REFERENCES users(user_id));

-- Insert records into posts
INSERT INTO posts (user_id, content, post_date) VALUES
(1, 'Loving the sunny weather today', NOW()),
(2, 'Just finished reading a great book', NOW()),
(3, 'Anyone up for a hike this weekend', NOW()),
(4, 'Back to work after a great vacation', NOW()),
(5, 'Check out my latest blog post', NOW()),
(6, 'Feeling grateful today', NOW()),
(7, 'Coffee is life', NOW()),
(8, 'Exploring the city', NOW()),
(9, 'Workout time', NOW()),
(10, 'Who else loves sunsets', NOW());

-- see table data
select * from posts ;



-- TABLE 4 COMMENTS 
CREATE TABLE comments (
-- unique identifier for each comments
comment_id INT AUTO_INCREMENT PRIMARY KEY,
-- post_id for each comments
post_id INT,
-- user id for each comments
user_id INT,
-- comment_text for each comments
comment_text TEXT,
-- comment_date for each comments
comment_date DATETIME,
 -- Foreign key referencing the comments table
FOREIGN KEY (post_id) REFERENCES posts(post_id),
 -- Foreign key referencing the comments table
FOREIGN KEY (user_id) REFERENCES users(user_id));

-- Insert records into comments
INSERT INTO comments (post_id, user_id, comment_text, comment_date) VALUES
(1, 2, 'Absolutely agree', NOW()),
(2, 3, 'What book was it', NOW()),
(3, 4, 'Count me in', NOW()),
(4, 5, 'Welcome back', NOW()),
(5, 6, 'Will check it out', NOW()),
(6, 7, 'Same here', NOW()),
(7, 8, 'True that', NOW()),
(8, 9, 'Where to', NOW()),
(9, 10, 'Good luck', NOW()),
(10, 1, 'Love sunsets too', NOW());

-- see table data
select * from comments ;


-- TABLE 5 LIKES TABLE  

CREATE TABLE likes (
-- unique identifier for each comments
like_id INT AUTO_INCREMENT PRIMARY KEY,
-- post id for each likes
post_id INT,
-- user id for each likes
user_id INT,
-- like_date for each likes
like_date DATETIME,
 -- Foreign key referencing the likes table
FOREIGN KEY (post_id) REFERENCES posts(post_id),
 -- Foreign key referencing the likes table
FOREIGN KEY (user_id) REFERENCES users(user_id));

-- Insert records into likes
INSERT INTO likes (post_id, user_id, like_date) VALUES
(1, 3, NOW()),
(2, 4, NOW()),
(3, 5, NOW()),
(4, 6, NOW()),
(5, 7, NOW()),
(6, 8, NOW()),
(7, 9, NOW()),
(8, 10, NOW()),
(9, 1, NOW()),
(10, 2, NOW());

-- see table data
select * from likes ;


-- TABLE 6 Friendships 
CREATE TABLE friendships (
-- unique identifier for each friendships
friendship_id INT AUTO_INCREMENT PRIMARY KEY,
-- user_id1 for each friendships
user_id1 INT,
-- user_id2 for each friendships
user_id2 INT,
-- friendship_date for each friendships
friendship_date DATE,
 -- Foreign key referencing the friendships table
FOREIGN KEY (user_id1) REFERENCES users(user_id),
 -- Foreign key referencing the friendships table
FOREIGN KEY (user_id2) REFERENCES users(user_id));

-- Insert records into friendships
INSERT INTO friendships (user_id1, user_id2, friendship_date) VALUES
(1, 2, '2022-01-01'),
(2, 3, '2022-01-02'),
(3, 4, '2022-01-03'),
(4, 5, '2022-01-04'),
(5, 6, '2022-01-05'),
(6, 7, '2022-01-06'),
(7, 8, '2022-01-07'),
(8, 9, '2022-01-08'),
(9, 10, '2022-01-09'),
(10, 1, '2022-01-10');

-- see table data
select * from friendships;


-- TABLE 7 MESSAGES 
CREATE TABLE messages (
-- unique identifier for each messages
message_id INT AUTO_INCREMENT PRIMARY KEY,
-- sender_id for each messages
sender_id INT,
-- receiver_id for each messages
receiver_id INT,
-- message_text for each messages 
message_text TEXT,
-- send_date for each messages 
send_date DATETIME,
-- Foreign key referencing the friendships table
FOREIGN KEY (sender_id) REFERENCES users(user_id),
-- Foreign key referencing the friendships table
FOREIGN KEY (receiver_id) REFERENCES users(user_id));

-- Insert records into messages
INSERT INTO messages (sender_id, receiver_id, message_text, send_date) VALUES
(1, 2, 'Hey, how are you', NOW()),
(2, 3, 'Hello', NOW()),
(3, 4, 'Let’s catch up soon', NOW()),
(4, 5, 'Good morning', NOW()),
(5, 6, 'Did you finish the report', NOW()),
(6, 7, 'Happy birthday', NOW()),
(7, 8, 'What’s up', NOW()),
(8, 9, 'Long time no see', NOW()),
(9, 10, 'Can you call me', NOW()),
(10, 1, 'See you tomorrow', NOW());


-- see table data
select * from messages;


-- TABLE 8 NOTIFICATIONS 
CREATE TABLE notifications (
-- unique identifier for each notifications
notification_id INT AUTO_INCREMENT PRIMARY KEY,
-- user_id for each notifications
user_id INT,
-- message for each notifications 
message VARCHAR(255),
-- notification_date for each notifications
notification_date DATETIME,
-- Foreign key referencing the notifications table 
FOREIGN KEY (user_id) REFERENCES users(user_id));

-- Insert records into notifications
INSERT INTO notifications (user_id, message, notification_date) VALUES
(1, 'You have a new friend request.', NOW()),
(2, 'Your post received a like.', NOW()),
(3, 'You were tagged in a post.', NOW()),
(4, 'You have a new message.', NOW()),
(5, 'Your comment received a reply.', NOW()),
(6, 'Event reminder: Hiking trip.', NOW()),
(7, 'Your post was shared.', NOW()),
(8, 'Friendship anniversary with Bob.', NOW()),
(9, 'You have a new follower.', NOW()),
(10, 'Your photo was liked.', NOW());


-- see table data
select * from notifications;

-- TABLE 9 GROUPSS
CREATE TABLE  groupss (
-- unique identifier for each groupss
group_id INT AUTO_INCREMENT PRIMARY KEY,
-- group name for each groupss
group_name VARCHAR(100) NOT NULL,
-- description for each groupss
description TEXT,
-- created_by fore ach groupss
created_by INT,
-- created_by for each groupss
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- Foreign key referencing the groupss table 
FOREIGN KEY (created_by) REFERENCES users(user_id));

-- Insert records into groups
INSERT INTO groupss (group_name, description, created_by) VALUES
('Fitness Freaks', 'A community for fitness enthusiasts to share tips and motivation.', 5),
('Book Club', 'For book lovers to discuss and recommend the latest reads.', 6),
('Music Lovers', 'A group for people who are passionate about all things music.', 7),
('Photography Enthusiasts', 'A space for photographers to share their work and techniques.', 8),
('Movie Buffs', 'For film lovers to discuss their favorite movies and new releases.', 9),
('Game Night Crew', 'Join us for weekly virtual game nights and fun challenges.', 10),
('Startup Founders', 'A network for aspiring and current entrepreneurs to connect and collaborate.', 1),
('Yoga and Meditation', 'A peaceful space for those interested in yoga and mindfulness.', 2),
('DIY Creators', 'For DIY enthusiasts to share projects and inspire creativity.', 3),
('Pet Lovers', 'A group for people who love pets and want to share pet care tips and stories.', 4);

-- see table data
select * from groupss;


-- TABLE 10 GROUP_MEMEBERS 
CREATE TABLE group_members (
-- unique identifier for each groupss
group_id INT,
-- user id for each group_members
user_id INT,
--  join_date for each group_members
join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- unique identifier for each group_members
PRIMARY KEY (group_id, user_id),
-- Foreign key referencing the group_members table 
FOREIGN KEY (group_id) REFERENCES groupsS(group_id),
-- Foreign key referencing the group_members table 
FOREIGN KEY (user_id) REFERENCES users(user_id));


-- Insert records into group_members
INSERT INTO group_members (group_id, user_id) VALUES
(1, 2), 
(1, 3), 
(2, 4), 
(3, 5), 
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(4, 10),
(5, 1);

-- see table data
select * from group_members;



-- TABLE 11 EVENTS 

CREATE TABLE events (
-- unique identifier for each notifications
event_id INT AUTO_INCREMENT PRIMARY KEY,
-- event name for each events 
event_name VARCHAR(100) NOT NULL,
-- description for each events
description TEXT,
-- event_date for each event
event_date DATETIME,
-- created_by for each event
created_by INT,
-- location for each event
location VARCHAR(100),
-- Foreign key referencing the events table 
FOREIGN KEY (created_by) REFERENCES users(user_id));    

-- Insert records into events
INSERT INTO events (event_name, description, event_date, CREATED_BY, location) VALUES
('Tech Workshop', 'Learn about the latest tech innovations and tools.', '2024-12-22 09:00:00', 1, 'San Francisco'),
('Literature Club Meeting', 'Join us for a discussion of the latest books!', '2024-12-18 17:00:00', 2, 'New York'),
('Charity Run', 'Participate in a charity run for a good cause.', '2024-12-14 08:00:00', 3, 'Los Angeles'),
('Gaming Tournament', 'Compete in an exciting gaming tournament.', '2024-12-16 13:00:00', 4, 'Chicago'),
('Dance Party', 'Dance the night away with live DJ music!', '2024-12-10 22:00:00', 5, 'Miami'),
('Photography Contest', 'Submit your best photos to win amazing prizes.', '2024-12-24 12:00:00', 6, 'Seattle'),
('Cooking Contest', 'Show off your culinary skills in a fun contest.', '2024-12-27 14:00:00', 7, 'Austin'),
('Film Screening', 'Watch an exclusive film screening with filmmakers.', '2024-12-29 19:00:00', 8, 'San Francisco'),
('Wine Tasting', 'Taste exquisite wines at a local vineyard.', '2024-12-23 16:00:00', 9, 'Napa Valley'),
('Beach Clean-Up', 'Help us clean up the beach while enjoying a beautiful day.', '2024-12-21 08:00:00', 10, 'Santa Monica');

-- see table data
select * from events ;




-- TABLE 12 advertisements
CREATE TABLE advertisements (
-- unique identifier for each advertisements
ad_id INT AUTO_INCREMENT PRIMARY KEY,
-- ad_title for each advertisements
ad_title VARCHAR(100),
-- ad_content for each advertisements
ad_content TEXT,
-- add_link for each advertisements
ad_link VARCHAR(255),
-- ad_date for each advertisements
ad_date DATETIME);
    

-- Insert sample data
INSERT INTO advertisements (ad_title, ad_content, ad_link, ad_date) VALUES
('Summer Collection', 'Shop the latest summer collection with up to 70% off!', 'http://summerfashion.com', NOW()),
('Fitness Gear Sale', 'Get your fitness gear today with amazing discounts!', 'http://fitnessgear.com', NOW()),
('Home Décor Ideas', 'Transform your home with stylish new décor pieces!', 'http://homedecor.com', NOW()),
('Gourmet Food Delivery', 'Enjoy gourmet meals delivered to your door in minutes!', 'http://gourmetfood.com', NOW()),
('Tech Accessories', 'Upgrade your gadgets with the latest accessories at unbeatable prices!', 'http://techaccessories.com', NOW()),
('Luxury Watches', 'Explore exclusive luxury watches on sale now!', 'http://luxurywatches.com', NOW()),
('Healthy Snacks', 'Taste the best healthy snacks delivered to your doorstep!', 'http://healthysnacks.com', NOW()),
('Gaming Console Deals', 'Find the best gaming console deals and accessories!', 'http://gamingdeals.com', NOW()),
('Travel Insurance', 'Protect your travels with the best insurance plans!', 'http://travelinsurance.com', NOW()),
('Winter Wear Sale', 'Get ready for winter with our warm and stylish collection!', 'http://winterwear.com', NOW());

-- see table data
select * from advertisements;




-- TABLE 13 USER_TAGS

CREATE TABLE user_tags (
-- unique identifier for each user_tags
tag_id INT AUTO_INCREMENT PRIMARY KEY,
-- post_id for each user_tags
post_id INT,
-- user id for each user_tags
user_id INT,
-- tag_type for each user_tags
tag_type VARCHAR(50), 
-- Foreign key referencing the user_tags table 
FOREIGN KEY (post_id) REFERENCES posts(post_id),
FOREIGN KEY (user_id) REFERENCES users(user_id));
    
    
-- Insert sample data
INSERT INTO user_tags (post_id, user_id, tag_type) VALUES
(6, 7, 'post'),
(7, 8, 'comment'),
(8, 9, 'image'),
(9, 10, 'post'),
(10, 1, 'comment'),
(1, 3, 'image'),
(2, 4, 'post'),
(3, 5, 'comment'),
(4, 6, 'image'),
(5, 7, 'post');

-- see table data
select * from user_tags;




-- TABLE 14 user_settings
CREATE TABLE user_settings (
-- unique identifier for each user_settings
user_id INT PRIMARY KEY,
-- notification_preference for each user_settings
notification_preference BOOLEAN DEFAULT TRUE,
-- privacy_preference for each user_settings
privacy_preference varchar (50) not null check (privacy_preference in ('Public', 'Friends', 'Only Me')) DEFAULT 'Friends',
-- Foreign key referencing the user_settings table 
FOREIGN KEY (user_id) REFERENCES users(user_id));

-- Insert records into user_settings
INSERT INTO user_settings (user_id, notification_preference, privacy_preference) VALUES
(3, TRUE, 'Only Me'),
(4, FALSE, 'Friends'),
(5, TRUE, 'Public'),
(6, TRUE, 'Friends'),
(7, FALSE, 'Only Me'),
(8, TRUE, 'Public'),
(9, FALSE, 'Friends'),
(10, TRUE, 'Only Me');

-- see table data
select * from user_settings;




-- TABLE 15 media_files
CREATE TABLE media_files (
-- unique identifier for each media_files
media_id INT AUTO_INCREMENT PRIMARY KEY,
-- user id for each media_files
user_id INT,
-- media type for each media_files
media_type ENUM('Image', 'Video') NOT NULL,
-- media url for each media_files
media_url VARCHAR(255) NOT NULL,
-- uploded_at for each media_files
uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- Foreign key referencing the media_files table 
FOREIGN KEY (user_id) REFERENCES users(user_id));

-- Insert records into media_files
INSERT INTO media_files (user_id, media_type, media_url) VALUES
(3, 'Image', 'http://example.com/images/carol_profile.jpg'),
(4, 'Video', 'http://example.com/videos/david_vlog.mp4'),
(5, 'Image', 'http://example.com/images/amit_blog.jpg'),
(6, 'Video', 'http://example.com/videos/grace_yoga.mp4'),
(7, 'Image', 'http://example.com/images/henry_travel.jpg'),
(8, 'Video', 'http://example.com/videos/ivy_pets.mp4'),
(9, 'Image', 'http://example.com/images/jack_gaming.jpg'),
(10, 'Video', 'http://example.com/videos/suresh_workout.mp4');

-- see table data
select * from media_files;




-- TABLE 16 user_reports
CREATE TABLE user_reports (
-- unique identifier for each media_files
report_id INT AUTO_INCREMENT PRIMARY KEY,
-- user id for each user_reports
user_id INT,
-- report type for each user_reports
report_type varchar (20) not null check (report_type in ('Content', 'User')) NOT NULL,
-- report details for each user_reports
report_details TEXT,
-- report date for each user_reports
report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- Foreign key referencing the user_reports table 
FOREIGN KEY (user_id) REFERENCES users(user_id));
    
    
-- Insert records into user_reports
INSERT INTO user_reports (user_id, report_type, report_details) VALUES
(3, 'Content', 'Offensive video content'),
(4, 'User', 'Harassment in messages'),
(5, 'Content', 'Misleading advertisement'),
(6, 'User', 'Fake profile and identity theft'),
(7, 'Content', 'Explicit images in posts'),
(8, 'User', 'Sending unwanted messages'),
(9, 'Content', 'Copyright infringement in video'),
(10, 'User', 'Impersonating another user');

-- see table data
select * from user_reports;




-- TABLE 17 user_reactions
CREATE TABLE user_reactions (
-- unique identifier for each media_files
reaction_id INT AUTO_INCREMENT PRIMARY KEY,
-- user id for each user_reactions
user_id INT,
-- post id for each user_reactions
post_id INT NULL,
-- comment id for each user_reactions
comment_id INT NULL,
-- reaction_type for each user_reactions
reaction_type ENUM('Like', 'Love', 'Haha', 'Wow', 'Sad', 'Angry') NOT NULL,
-- reaction date for each user_reactions
reaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- Foreign key referencing the user_reactions table 
FOREIGN KEY (user_id) REFERENCES users(user_id),
-- Foreign key referencing the user_reactions table 
FOREIGN KEY (post_id) REFERENCES posts(post_id),
-- Foreign key referencing the user_reactions table 
FOREIGN KEY (comment_id) REFERENCES comments(comment_id));


-- Insert records into user_reactions
INSERT INTO user_reactions (user_id, post_id, reaction_type) VALUES
(1, 2, 'Sad'),
(2, 3, 'Angry'),
(3, 4, 'Like'),
(4, 1, 'Love'),
(1, 3, 'Wow'),
(2, 4, 'Like'),
(3, 1, 'Haha'),
(4, 2, 'Love'),
(1, 4, 'Angry'),
(2, 1, 'Sad');


-- see table data
select * from  user_reactions;




-- TABLE 18 user_badges
CREATE TABLE user_badges (
-- unique identifier for each user_badges
badge_id INT AUTO_INCREMENT PRIMARY KEY,
-- user id for each user_badges
user_id INT,
-- badge name for each user_badges
badge_name VARCHAR(255) NOT NULL,
-- awrded at for each  user_badges
awarded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- Foreign key referencing the user_badges table  
FOREIGN KEY (user_id) REFERENCES users(user_id));

-- Insert records into user_badges
INSERT INTO user_badges (user_id, badge_name) VALUES
(1, 'Top Contributor'),
(2, 'Early Adopter'),
(3, 'Super User'),
(4, 'Verified'),
(5, 'Community Leader'),
(6, 'Photo Master'),
(7, 'Event Organizer'),
(8, 'Content Creator'),
(9, 'Explorer'),
(10, 'Influencer');

-- see table data
SELECT * FROM user_badges;





-- TABLE 19 user_block_list
CREATE TABLE user_block_list (
-- unique identifier for each user_block_list
block_id INT AUTO_INCREMENT PRIMARY KEY,
-- blocker id for each user_block_list
blocker_id INT,
-- blocked id for each user_block_list
blocked_id INT,
-- blocked at for each user_block_list
blocked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- Foreign key referencing the user_block_list table  
FOREIGN KEY (blocker_id) REFERENCES users(user_id),
-- Foreign key referencing the user_block_list table  
FOREIGN KEY (blocked_id) REFERENCES users(user_id));

-- Insert records into user_block_list
INSERT INTO user_block_list (blocker_id, blocked_id) VALUES
(1, 3),
(2, 4),
(5, 6),
(4, 7),
(3, 8),
(6, 9),
(7, 10),
(2, 1),
(8, 5),
(10, 3);

-- see table data
select * from user_block_list;




-- TABLE 20 user_earnings
CREATE TABLE user_earnings (
-- unique identifier for each user_earnings
earning_id INT AUTO_INCREMENT PRIMARY KEY,
-- user id for each user_earnings
user_id INT,
-- amount for each user_earnings
amount DECIMAL(10, 2),
-- earing type for each user_earnings
earning_type VARCHAR (30) NOT NULL CHECK ( earning_type IN ('Ad Revenue', 'Post Boost', 'Referral')) NOT NULL,
-- earing at for each user_earnings
earned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- Foreign key referencing the user_earnings table  
FOREIGN KEY (user_id) REFERENCES users(user_id));
    

-- Insert records into user_earnings
INSERT INTO user_earnings (user_id, amount, earning_type) VALUES
(4, 30.00, 'Ad Revenue'),
(5, 20.00, 'Post Boost'),
(6, 100.00, 'Referral'),
(7, 45.00, 'Ad Revenue'),
(8, 60.00, 'Post Boost'),
(9, 80.00, 'Referral'),
(10, 35.00, 'Ad Revenue'),
(1, 40.00, 'Referral'),
(2, 25.00, 'Post Boost'),
(3, 55.00, 'Ad Revenue');

-- see table data
select * from user_earnings;


-- TABLE 21 trader
CREATE TABLE trader (
-- unique identifier for each trader
trader_id INT PRIMARY KEY AUTO_INCREMENT,
-- name of each trader
trader_name VARCHAR(50),
-- date for each trade
trade_date DATE,
-- amount for each trade
trade_amount DECIMAL(10, 2),
-- name of place of each trade
trade_place VARCHAR(100)
);

-- Insert records into trader
INSERT INTO trader (trader_name, trade_date, trade_amount, trade_place) VALUES
    ('Alice Johnson', '2024-11-01', 1500.50, 'New York'),
    ('Bob Smith', '2024-11-02', 2000.75, 'San Francisco'),
    ('Charlie Brown', '2024-11-03', 1750.25, 'Chicago'),
    ('Daisy Lee', '2024-11-04', 2200.00, 'Los Angeles'),
    ('Ethan Williams', '2024-11-05', 1600.00, 'Houston'),
    ('Fiona Miller', '2024-11-06', 1800.50, 'Phoenix'),
    ('George Davis', '2024-11-07', 2100.75, 'Seattle'),
    ('Hannah Wilson', '2024-11-08', 1700.25, 'Miami'),
    ('Ivan Moore', '2024-11-09', 1950.00, 'Dallas'),
    ('Julia Martinez', '2024-11-10', 2300.50, 'Atlanta');
    
    
    -- see table data
select * from trader;


-- TABLE 22 trader 
CREATE TABLE colab_cost (
id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each entry
sign_datetime DATETIME NOT NULL,  -- Start date and time of the Colab session
end_datetime DATETIME ,            -- Calculated end date and time
cost_amount DECIMAL(5, 2) NOT NULL, -- Duration of the session in hours (e.g., 2.5 hours)
colab_name VARCHAR(50) NOT NULL -- Name or type of Colab session
);

INSERT INTO colab_cost (sign_datetime, end_datetime, cost_amount, colab_name) VALUES
('2024-11-01 09:00:00', '2023-11-01 11:30:00', 5.50, 'Basic Session'),
('2024-11-02 14:00:00', '2023-11-02 16:00:00', 7.00, 'Pro Session'),
('2024-11-03 08:15:00', '2023-11-03 12:30:00', 10.75, 'Basic Session'),
('2024-11-04 10:00:00', '2023-11-04 15:45:00', 15.25, 'Pro Session'),
('2024-11-05 09:00:00', '2023-11-05 11:30:00', 5.50, 'Basic Session'),
('2024-11-06 14:00:00', '2023-11-06 18:00:00', 12.00, 'Pro Session'),
('2024-11-07 10:30:00', '2023-11-07 12:30:00', 6.50, 'Basic Session'),
('2024-11-08 13:00:00', '2023-11-08 17:00:00', 11.00, 'Pro Session'),
('2024-11-09 07:45:00', '2023-11-09 11:45:00', 8.25, 'Basic Session'),
('2024-11-10 16:00:00', '2023-11-10 18:00:00', 7.00, 'Pro Session');

    -- see table data
select * from colab_cost;
