SELECT *
FROM general..coffee
ORDER BY roaster ASC

--https://www.coffeereview.com/how-coffee-review-works/
--https://www.coffeereview.com/interpret-coffee/
--https://www.coffeereview.com/roast-definitions/

--------------------------------------------------- CLEANING DATA ---------------------------------------------------

--Issue updating column. Added updated review date column to remove time. Removed 00:00:00 from date
SELECT review_date, CONVERT(DATE, review_date)
FROM general..coffee

ALTER TABLE coffee
Add review_date_updated DATE;

UPDATE coffee
SET review_date_updated = CONVERT(DATE,review_date)

ALTER TABLE general..coffee
DROP COLUMN review_date
---------------------------------------------------
--------------- Reviewing agtron field and roast. NA/ / NA/NA ---------------

--Adding additional field to express type of coffee. 
ALTER TABLE coffee
Add type varchar(100);

UPDATE coffee
SET type = 'Whole Bean'
WHERE agtron is not null

-- 5 fields with agtron value exceding the character limit
SELECT agtron, roast, review_url
FROM general..coffee
WHERE LEN(agtron) > 5
---------------------------------------------------
-- Na/ values were bottled coffee. Updated both type and agtron field for better viewing
SELECT slug, roast, agtron, type
FROM general..coffee
WHERE agtron = 'NA'

UPDATE coffee
SET type = 'Bottled'
WHERE agtron = 'NA/'

UPDATE coffee
SET agtron = 'NA'
WHERE agtron = 'NA/'
---------------------------------------------------
-- '/' values were either cold brew or instat coffee. Updated both agtron and type fields 
SELECT slug, roast, agtron, type
FROM general..coffee
WHERE agtron = '/'

UPDATE coffee
SET type = 'Bottled Cold Brew'
WHERE slug = 'https://www.coffeereview.com/review/cold-brew-4/'

UPDATE coffee
SET type = 'Bottled Cold Brew'
WHERE slug = 'https://www.coffeereview.com/review/reserve-cold-brew/'

UPDATE coffee
SET agtron = 'NA'
WHERE type = 'Bottled Cold Brew'

UPDATE coffee
SET type = 'Instant Coffee'
WHERE agtron = '/'

UPDATE coffee
SET agtron = 'NA'
WHERE agtron = '/'
---------------------------------------------------
--BOTH 'NA/NA and '0/0' represent the same type of coffee. Updated fields to NA. Then will update based on url in slug for type. 
SELECT slug, roast, agtron, type
FROM general..coffee
WHERE agtron = 'NA/NA'

UPDATE coffee 
SET agtron = 'NA'
WHERE agtron ='NA/NA'

SELECT slug, roast, agtron
FROM general..coffee
WHERE agtron = '0/0'

UPDATE coffee 
SET agtron = 'NA'
WHERE agtron ='0/0'
---------------------------------------------------
-- Updated type based on url provide description (Cold Brew)
SELECT slug, type
FROM general..coffee
WHERE slug LIKE '%cold-brew%'

UPDATE coffee
SET type = 'Cold Brew'
WHERE slug LIKE '%cold-brew%'
---------------------------------------------------
-- Updated type based on url provide description (Instant Coffee)
SELECT slug, type
FROM general..coffee
WHERE slug LIKE '%instant%'

UPDATE coffee
SET type = 'Instant Coffee'
WHERE slug LIKE '%instant%'
---------------------------------------------------
--Noticed an issue with Whole Bean type set incorrectly to certian urls
SELECT slug, roast, agtron, type
FROM general..coffee
WHERE desc_1 LIKE '%ready-to-drink black%'
--AND type = 'Whole Bean'

UPDATE coffee
SET type = 'Bottled'
WHERE desc_1 LIKE '%ready-to-drink black%'
AND type = 'Whole Bean'
---------------------------------------------------
--------------- Null Values ---------------

-- Update location field to unknow instead of null 
-- acid, body, flavor, aftertaste contain nulls
SELECT *
FROM general..coffee
WHERE aroma is null
or body is null
or flavor is null
or aftertaste is null
or acid is null

-- Since scale is from 1 to 10 based on review. Zero will represent no value
UPDATE general..coffee
SET aroma = 0
WHERE aroma is null

UPDATE general..coffee
SET body = 0
WHERE body is null

UPDATE general..coffee
SET flavor = 0
WHERE flavor is null

UPDATE general..coffee
SET aftertaste = 0
WHERE aftertaste is null
---------------------------------------------------
-- acid and with_milk fields are almost present with null values. Scale is based on 1 to 10. Zero will represent no value
SELECT *
FROM general..coffee
WHERE acid is null
or with_milk is null

UPDATE general..coffee
SET acid = 0
WHERE acid is null

UPDATE general..coffee
SET with_milk = 0
WHERE with_milk is null
---------------------------------------------------
-- Finding additional details from desc_1 and update type field. 
SELECT *
FROM general..coffee
WHERE desc_1 like 'Evaluated as%'
---------------------------------------------------

-- Espresso type update
SELECT *
FROM general..coffee
WHERE desc_1 like 'Evaluated as espresso%'

UPDATE general..coffee
SET type = 'Whole Bean (Expresso)'
WHERE desc_1 like 'Evaluated as espresso%'
---------------------------------------------------
--Instant coffee type
SELECT *
FROM general..coffee
WHERE desc_1 like 'Evaluated as an instant%'

UPDATE general..coffee
SET type = 'Instant Coffee'
WHERE desc_1 like 'Evaluated as an instant%'
---------------------------------------------------
--Updating slug to review_url
ALTER TABLE general..coffee
Add review_url varchar(255)

UPDATE general..coffee
SET review_url = slug

ALTER TABLE general..coffee
DROP COLUMN slug

--Additional updates when exploring
SELECT *
FROM general..coffee
WHERE est_price = '#23.00/12 ounces'

UPDATE general..coffee
SET est_price = '$23.00/12 ounces'
WHERE est_price = '#23.00/12 ounces'

--------------------------------------------------- CLEANING DATA ---------------------------------------------------
SELECT rating, roaster, roast, est_price, type, review_url
FROM general..coffee
WHERE location = 'San Diego, California'
ORDER BY est_price ASC

-- Creating view for SD Locations to try
CREATE VIEW SanDiego as
SELECT rating, roaster, roast, est_price, type, review_url
FROM general..coffee
WHERE location = 'San Diego, California'

