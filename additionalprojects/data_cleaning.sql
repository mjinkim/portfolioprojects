--Data Cleaning
SELECT *
FROM housing..nashdata

-- Remove time from SaleDate field. 
SELECT SaleDateUpdate, CONVERT(Date,SaleDate)
FROM housing..nashdata

ALTER TABLE nashdata
ADD SaleDateUpdate Date;

UPDATE nashdata
SET SaleDateUpdate = CONVERT(Date,SaleDate)

-- Updating Null in Property Address

--Join the tables together to get Property Address where Null is Present
SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM housing..nashdata a
JOIN housing..nashdata b
	on a.ParcelID = b.ParcelID
	AND a.UniqueID <> b.UniqueID
WHERE a.PropertyAddress is null

-- Updated the null fields with the same address
UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM housing..nashdata a
JOIN housing..nashdata b
	on a.ParcelID = b.ParcelID
	AND a.UniqueID <> b.UniqueID
WHERE a.PropertyAddress is null

-- Break out Address into 3 columns. (Address, City, State)
SELECT *
FROM housing..nashdata

-- Viewing address with added delimiter 
SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as Address1,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+ 1, LEN(PropertyAddress)) as City
FROM housing..nashdata

--Adding two additional columns with address1 and city

ALTER TABLE nashdata
ADD PropertyAddress1 NVARCHAR(255);

UPDATE nashdata
SET PropertyAddress1 = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)


ALTER TABLE nashdata
ADD PropertyCity NVARCHAR(255);

UPDATE nashdata
SET PropertyCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+ 1, LEN(PropertyAddress))

-- Viewing Owner Address for Nulls
SELECT OwnerAddress
FROM housing..nashdata

--Parse address by converting a comma to a period. 
SELECT
PARSENAME(REPLACE(OwnerAddress,',','.'),3),
PARSENAME(REPLACE(OwnerAddress,',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),1)
FROM housing..nashdata

-- Creating 3 columns and update those 3 columns with the parse data
ALTER TABLE nashdata
ADD OwnerAddress1 NVARCHAR(255);

UPDATE nashdata
SET OwnerAddress1 = PARSENAME(REPLACE(OwnerAddress,',','.'),3)

ALTER TABLE nashdata
ADD OwnerCity NVARCHAR(255);

UPDATE nashdata
SET OwnerCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2)

ALTER TABLE nashdata
ADD OwnerState NVARCHAR(255);

UPDATE nashdata
SET OwnerState = PARSENAME(REPLACE(OwnerAddress,',','.'),1)

-- Delete Unused Columns from Update
SELECT *
FROM housing..nashdata

--Removing columns that were used to create a split from above
ALTER TABLE housing..nashdata
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate


-- Reviewing column that might contain different variations 
SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM housing..nashdata
GROUP BY SoldAsVacant

-- Review if results are intended
SELECT SoldAsVacant,
CASE 
	WHEN SoldAsVacant = 'Y' THEN 'Yes'
	WHEN SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END
FROM housing..nashdata

--Updated the column with correct variable 
UPDATE housing..nashdata
SET SoldASVacant = CASE 
	WHEN SoldAsVacant = 'Y' THEN 'Yes'
	WHEN SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END

-- Locating Duplicate Row 
WITH RowNumCTE AS (

SELECT *, 
	ROW_NUMBER() 
	OVER(PARTITION BY ParcelID, PropertyAddress, SalePrice,SaleDate, LegalReference
	ORDER BY UniqueID) row_num
FROM housing..nashdata
--ORDER BY ParcelID
)
--Deleting duplicates once located off of row_num
DELETE
FROM RowNumCTE
WHERE row_num > 1
--ORDER By PropertyAddress
