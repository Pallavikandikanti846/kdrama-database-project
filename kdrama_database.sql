-- Creating Database
CREATE DATABASE kdrama;

-- Use datanase to create tables
Use kdrama

-- Creating drama table
CREATE TABLE drama(
drama_id INT AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
episodes INT(100) NOT NULL,
genre VARCHAR(100) NOT NULL,
`month` VARCHAR(100) NOT NULL,
`year` SMALLINT(4) NOT NULL,
PRIMARY KEY (drama_id)
);

-- Creating award table
CREATE TABLE award(
award_id INT AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (award_id)
);

-- Creating drama_award table
CREATE TABLE drama_award(
award_id INT(100) NOT NULL,
drama_id INT(100) NOT NULL,
winner VARCHAR(100) NOT NULL,
`year` SMALLINT(4) NOT NULL,
FOREIGN KEY (award_id) REFERENCES award(award_id),
FOREIGN KEY (drama_id) REFERENCES drama(drama_id)
);

-- Creating viewership table
CREATE TABLE viewership(
viewership_id INT AUTO_INCREMENT,
platform_views DECIMAL(10,2) NOT NULL,
nation_views DECIMAL(10,2) NOT NULL,
drama_id INT(100) NOT NULL,
PRIMARY KEY (viewership_id),
FOREIGN KEY (drama_id) REFERENCES drama(drama_id)
);

-- Creating cast table
CREATE TABLE `cast`(
cast_id INT AUTO_INCREMENT,
actor_name VARCHAR(100) NOT NULL,
actress_name VARCHAR(100) NOT NULL,
PRIMARY KEY (cast_id)
);

-- Creating drama_cast table
CREATE TABLE drama_cast(
cast_id INT(100) NOT NULL,
drama_id INT(100) NOT NULL,
FOREIGN KEY (cast_id) REFERENCES `cast`(cast_id),
FOREIGN KEY (drama_id) REFERENCES drama(drama_id)
);

-- Creating view
CREATE VIEW best_hits_list AS
SELECT d.drama_id,d.name,CONCAT(fn_avg_viewership(v.platform_views,v.nation_views),"%") AS `Total Views` FROM drama d
RIGHT JOIN viewership v
ON d.drama_id=v.drama_id
HAVING `Total Views`>15;


-- Trigger Creation
DELIMITER //
CREATE TRIGGER trg_insert_month_before_drama_list_updated
BEFORE INSERT ON drama
FOR EACH ROW
BEGIN
SET NEW.`month`=DATE_FORMAT(CURRENT_DATE, '%M');
SET NEW.`year`=DATE_FORMAT(CURRENT_DATE, '%Y');
END //
DELIMITER ;

DELIMITER //

-- Function Creation
DELIMITER //
CREATE FUNCTION fn_avg_viewership(platform_views DECIMAL(10,2),nation_views DECIMAL(10,2))
RETURNS DECIMAL(10,2)
BEGIN
DECLARE avg_views DECIMAL(10,2);
IF (platform_views!=0 && nation_views!=0) THEN
SET avg_views=(platform_views+nation_views)/2;
ELSE
SET avg_views=platform_views+nation_views;
END IF;
RETURN avg_views;
END //
DELIMITER ;

-- Inserting data into drama table
INSERT INTO drama(name,episodes,genre,`month`,`year`)
VALUES("Secret Garden​​​",20,"Romantic Comedy, Fantasy","November",2010),
("Sungkyunkwan Scandal​​​",20,"Historical, Romance, Comedy","August",2010),
("My Girlfriend is a Gumiho​​​",16,"Fantasy, Romantic Comedy","August",2010),
("Dream High​​​",16,"Musical, Teen, Romance","January",2011),
("Reply 1997​​​",16,"Comedy, Romance, Coming-of-Age","July",2012),
("Moon Embracing the Sun​​​",20,"Historical, Fantasy, Romance","January",2012),
("The Heirs​​​",20,"Romance, Drama, Teen","October",2013),
("My Love from the Star​​​",21,"Sci-Fi, Romance, Comedy","December",2013),
("Pinocchio​​​",20,"Romance, Drama, Mystery","November",2014),
("Healer​​​",20,"Action, Romance, Thriller","December",2014),
("Kill Me, Heal Me​​​",20,"Psychological, Romance, Comedy","January",2015),
("Crash Course in Romance",16,"Romantic, Comedy​","January",2023),
("Agency",16,"Workplace Drama​","January",2023),
("The Glory",16,"Revenge, Psychological Thriller​","March",2023),
("Doctor Cha​",16,"Medical, Comedy, Family Drama​","April",2023),
("Queenmaker​​​",12,"Political Thriller","April",2023),
("The Good Bad Mother​​",14,"Family, Comedy, Slice-of-Life​","April",2023),
("All That We Loved​​​",8,"Teen Drama, Comedy, Romance","May",2023),
("Twinkling Watermelon​​​",16,"Fantasy, Romance","July",2023),
("Daily Dose of Sunshine​​​​",12,"Medical, Drama","July",2023),
("Moving​​​",20,"Superhero, Action, Thriller","August",2023),
("My Dearest​​​",10,"Historical, Romance, Drama","August",2023),
("A Good Day to Be a Dog​​​",14,"Fantasy, Romantic Comedy","October",2023),
("My Demon​​​",16,"Fantasy, Romantic Comedy","November",2023),
("Marry My Husband​​​",16,"Revenge, Fantasy, Romance","January",2024),
("Knight Flower​​​",12,"Period Drama, Comedy, Action, Romance","January",2024),
("Doctor Slump​​​",16,"Medical Drama, Romantic Comedy","January",2024),
("Queen of Tears​​​",18,"Romantic Comedy","March",2024),
("The Atypical Family​​​",12,"Genre: Fantasy, Drama, Romance","May",2024),
("Lovely Runner​​​",16,"Romance, Fantasy, Time Travel","April",2024),
("Love Next Door​​​",16,"Political Thriller","April",2024),
("No Gain No Love​​​",12,"Romantic Comedy","August",2024),
("The Trunk​​​",8,"Mystery, Drama, Romance","November",2024),
("Mr. Plankton​​​",10,"Romantic Comedy, Drama","November",2024),
("When the Phone Rings​​​",16,"Thriller, Mystery, Romance","November",2024),
("When the Stars Gossip​​​",16,"Science Fiction, Romance","January",2024),
("When Life Gives You Tangerines",16,"Romance, Slice-of-Life, Period Drama","March",2025),
("The Potato Lab​​​",12,"Romantic Comedy, Workplace","March",2025);

-- Inserting data into cast table
INSERT INTO `cast`(actor_name,actress_name)
VALUES("Hyun Bin","Ha Ji-won"),
("Park Yoo-chun","Park Min-young"),
("Kim Soo-hyun","Bae Suzy"),
("Seo In-guk, Hoya", "Hae ri"),
("Kim Soo-hyun","Han Ga-in"),
("Lee Min-ho","Park Shin-hye"),
("Kim Soo-hyun","Jun Ji-hyun"),
("Lee Jong-suk","Park Shin-hye"),
("Ji Chang-wook","Park Min-young"),
("Ji Sung","Hwang Jung-eum"),
("Jung Kyung-ho","Jeon Do-yeon"),
("Lee Sang-yoon", "Lee Hye-ri"),
("Lee Do-hyun", "Song Hye-kyo"),
("Uhm Jung-hwa", "Kim Byung-chul"),
("Kim Hee-ae", "Moon So-ri"),
("Lee Do-hyun", "Ra Mi-ran"),
("Sehun (EXO)", "Jang Yeo-bin"),
("Kim Young-kwang", "Lee So-eun"),
("Lee Joon", "Jung So-min"),
("Ryu Seung-ryong", "Han Hyo-joo"),
("Nam Joo-hyuk", "Kim So-eun"),
("Cha Eun-woo", "Park Gyu-young"),
( "Song Kang", "Kim Yoo-jung"),
("Kim Young-dae", "Kim So-eun"),
("Jo Bo-ah", "Sung Hoon"),
("Park Hyung-sik", "Park Shin-hye"),
("Kim Soo-hyun", "Ha Ji-won"),
("Park So-dam", "Choi Min-sik"),
("Yoo Seung-ho", "Kim So-eun"),
("Lee Dong-wook", "Jo Bo-ah"),
("Jang Hyuk", "Han Ye-seul"),
("Kim Woo-bin", "Lee Na-young"),
("Lee Sun-kyun", "Lim Soo-jung"),
("Lee Jong-suk", "Park Min-young"),
("Lee Dong-wook", "Kim Ji-won"),
("Lee Seung-gi", "Im Yoon-ah"),
("Yoo Seung-ho", "Kim So-eun"),
("Kim Soo-hyun", "Kim Ji-won");

-- Inserting data into drama_cast table
INSERT INTO drama_cast (cast_id,drama_id)
VALUES(1,1),
(2,2), 
(3,3), 
(4,4), 
(5,5), 
(6,6), 
(7,7), 
(8,8), 
(9,9), 
(10,10),
(11,11), 
(12,12), 
(13,13), 
(14,14), 
(15,15), 
(16,16), 
(17,17), 
(18,18), 
(19,19), 
(20,20),
(21,21), 
(22,22), 
(23,23), 
(24,24), 
(25,25), 
(26,26), 
(27,27), 
(28,28), 
(29,29), 
(30,30),
(31,31), 
(32,32), 
(33,33), 
(34,34), 
(35,35), 
(36,36), 
(37,37), 
(38,38);

-- Inserting data into viewership table
INSERT INTO viewership (platform_views,nation_views,drama_id)
VALUES(0,35.2,1),
(0,14.3,2),
(0,22.1,3),
(26.3,15.7,4),
(9.2, 7.55,5),
(0, 36.7,6),
(0, 15.9,7),
(15.2, 28.1,8),
(9.5, 14.6,9),
(0, 8.0,10),
(9.6, 11.4,11),
(7.9, 18.40,12),
(0, 16.0,13),
(105.0, 105,14),
(6.0, 18.5,15),
(15.87, 7.0,16),
(16.57, 8.8,17),
(0, 0,18),
(35.87, 14.68,19),
(3.0, 0,20),
(145, 100,21),
(0, 11.5,22),
(0, 1.9,23),
(14.0, 3.9,24),
(20.0, 9.8,25),
(10.0, 11.8,26),
(15.0, 6.4,27),
(35.0, 24.8,28),
(10.0, 4.4,29),
(30.0, 4.8,30),
(15.0, 8.5,31),
(5.0, 4.3,32),
(0, 0,33),
(0, 0,34),
(18.0, 8.6,35),
(5.0, 2.0,36),
(250, 175,37),
(2.0, 1.58,38);

-- Inserting data into award table
INSERT INTO award(name)
VALUES ("Baeksang Arts Awards – Grand Prize (Daesang), Actor"),
("Korea Drama Awards – Grand Prize (Daesang)"),
("KBS Drama Awards – Best New Actor"),
("New York TV Festival – Bronze World Medal for Best Miniseries"),
("Excellence Award, Actor in a Drama Special, SBS Drama Awards"),
("Excellence Award, Actress in a Drama Special, SBS Drama Awards"),
("KBS Drama Awards – Best New Actor"),
("Rose d'Or Awards – Golden Rose (Children & Youth)"),
("Baeksang Arts Awards – Best New Actress (TV)"),
("Cable TV Broadcasting Awards – Grand Prize (Daesang)"),
("Drama of the Year – MBC Drama Awards"),
("Best Drama – Baeksang Arts Awards"),
("Best Modern Drama – Asia Rainbow TV Awards"),
("Outstanding Korean Drama – Seoul International Drama Awards"),
("Baeksang Arts Awards"),
("Seoul International Drama Awards"),
("Shanghai Television Festival"),
("International Drama Festival in Tokyo"),
("Best Drama – Seoul International Drama Awards"),
("Best Couple Award – SBS Drama Awards"),
("Popularity Award, Actor, KBS Drama Awards"),
("Best Couple Award, KBS Drama Awards"),
("Grand Prize (Daesang), MBC Drama Awards"),
("Best Drama – WorldFest-Houston International Film Festival"),
("Best New Actress, Baeksang Arts Awards"),
("Scene Stealer of the Year, Scene Stealer Festival"),
("Best Drama, Baeksang Arts Awards"),
("Best Drama Series, Asian Academy Creative Awards"),
("Top Excellence Award, Actress in a Miniseries, APAN Star Awards"),
("Best New Actress, APAN Star Awards"),
("Best Drama – Baeksang Arts Awards"),
("Best Actress – Baeksang Arts Awards"),
("Best Drama, Blue Dragon Series Awards"),
("Best Actress, Blue Dragon Series Awards"),
("Grand Prize (Daesang) – Television"),
("Best Series"),
("Best Lead Actor"),
("Best New Actor"),
("Best New Actress"),
("Best Visual Effects"),
("Best Drama"),
("Grand Prize (Daesang)"),
("Excellence Award, Actress in a Miniseries"),
("Best Couple Award"),
("Top Excellence Award, Actor in a Miniseries Romance/Comedy Drama"),
("Top Excellence Award, Actress in a Miniseries Romance/Comedy Drama"),
("Best Artist Award"),
("Actress of the Year (Daesang)"),
("Best Actress in a Miniseries"),
("Top Excellence Award, Actress in a Miniseries"),
("Best Drama Series"),
("Best Drama Series"),
("Best Drama"),
("Best Direction"),
("Best Scriptwriting"),
("Best Drama Series"),
("Best Writer"),
("Top 10 Series of 2024"),
("Best Couple Award"),
("People's Choice Award"),
("Best Actress"),
("Popular Star Award"),
("Top Excellence Award, Actor in a Miniseries"),
("Top Excellence Award, Actress in a Miniseries"),
("Best Couple Award"),
("Best New Actor");

-- Inserting data into drama_award table
INSERT INTO drama_award(award_id, drama_id,winner,`year`)
VALUES
(1, 1,"Hyun Bin", 2011),
(2, 1, "Secret Garden", 2011),
(3, 2, "Park Yoo-chun", 2010),
(4, 2, "Sungkyunkwan Scandal", 2012),
(5, 3, "Lee Seung-gi", 2010),
(6, 3, "Shin Min-a", 2010),
(7, 4, "Kim Soo-hyun", 2011),
(8, 4, "Dream High", 2012),
(9, 5, "Jung Eun-ji", 2013),
(10, 5, "Reply 1997", 2013),
(11, 6, "Moon Embracing the Sun", 2012),
(12, 6, "Moon Embracing the Sun", 2012),
(13, 7, "The Heirs", 2014),
(14, 7, "The Heirs", 2014),
(15, 8, "Jun Ji-hyun", 2014),
(16, 8, "My Love from the Star", 2014),
(17, 8, "My Love from the Star", 2014),
(18, 8, "My Love from the Star", 2014),
(19, 9, "Pinocchio", 2015),
(20, 9, "Lee Jong-suk & Park Shin-hye", 2014),
(21, 10, "Ji Chang-wook", 2014),
(22, 10, "Ji Chang-wook and Park Min-young", 2014),
(23, 11, "Ji Sung", 2015),
(24, 11, "Kill Me, Heal Me", 2016),
(25, 12, "Roh Yoon-seo", 2023),
(26, 12, "Hwang Bo-ra", 2023),
(27, 14, "The Glory", 2023),
(28, 14, "The Glory", 2023),
(29, 15, "Uhm Jung-hwa", 2023),
(30, 15, "Jo Ah-ram", 2023),
(31, 17, "The Good Bad Mother", 2024),
(32, 17, "Ra Mi-ran", 2024),
(33, 20, "Daily Dose of Sunshine", 2024),
(34, 20, "Park Bo-young", 2024),
(35, 21, "Moving", 2024),
(36, 21, "Moving", 2023),
(37, 21, "Ryu Seung-ryong", 2023),
(38, 21, "Lee Jung-ha", 2023),
(39, 21, "Go Youn-jung", 2023),
(40, 21, "Moving", 2023),
(41, 22, "My Dearest", 2024),
(42, 22, "Namgoong Min", 2023),
(43, 23, "Park Gyu-young", 2023),
(44, 23, "Cha Eun-woo & Park Gyu-young", 2023),
(45, 24, "Song Kang", 2023),
(46, 24, "Kim Yoo-jung", 2023),
(47, 25, "Park Min-young", 2024),
(48, 25, "Park Min-young", 2024),
(49, 26, "Lee Hanee", 2024),
(50, 26, "Lee Hanee", 2024),
(51, 27, "Doctor Slump", 2024),
(52, 27, "Doctor Slump", 2024),
(53, 28, "Queen of Tears", 2024),
(54, 28, "Jang Young-woo and Kim Hee-won", 2024),
(55, 28, "Park Ji-eun", 2024),
(56, 29, "The Atypical Family", 2024),
(57, 29, "Joo Hwa-mi", 2024),
(58, 29, "The Atypical Family", 2024),
(59, 30, "Kim Hye-yoon & Byeon Woo-seok", 2024),
(60, 30, "Lovely Runner", 2024),
(61, 31, "Jung So-min", 2024),
(62, 31, "Jung Hae-in", 2024),
(63, 35, "Yoo Yeon-seok", 2024),
(64, 35, "Chae Soo-bin", 2024),
(65, 35, "Yoo Yeon-seok & Chae Soo-bin", 2024),
(66, 35, "Heo Nam-jun", 2024);

-- Inserting newly released dramas this month to test trigger

INSERT INTO drama(name,episodes,genre,`year`)
VALUES("Way Back Love",6,"romantic fantasy, melodrama",2025);

INSERT INTO drama(name,episodes,genre,`year`)
VALUES("Resident Playbook", 12, "Medical Drama", 2025);

-- Query to get best hit list using the function (Solution 2)
-- SELECT d.drama_id,d.name,CONCAT(fn_avg_viewership(v.platform_views,v.nation_views),"%") AS `Total Views` FROM drama d
-- RIGHT JOIN viewership v
-- ON d.drama_id=v.drama_id
-- HAVING `Total Views`>15;

-- Query to get the dramas based on a particular month (Solution 1)
-- SELECT * FROM drama
-- WHERE `month`="March" AND `year`=2025;