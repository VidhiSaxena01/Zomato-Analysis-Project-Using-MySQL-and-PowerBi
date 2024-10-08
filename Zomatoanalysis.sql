-- Total Number of Restaurants

SELECT 
    COUNT(RestaurantID) AS TotalRestaurants
FROM
    zomato_dataset;
    
-- Average Rating of Restaurants

SELECT 
    ROUND(AVG(Rating), 1) AS AvgRating
FROM
    zomato_dataset;

-- Total Votes Received by Restaurants

SELECT 
    SUM(Votes) AS TotalVotes
FROM
    zomato_dataset;

-- Average Cost for Two

SELECT 
    ROUND(AVG(Average_Cost_for_two), 0) AS AvgCostForTwo
FROM
    zomato_dataset;

-- Total Number of Restaurants Offering Online Delivery

SELECT 
    COUNT(RestaurantID) AS TotalOnlineDelivery
FROM
    zomato_dataset
WHERE
    Has_Online_delivery = 'Yes';

-- Total Number of Restaurants offering Table Booking

SELECT 
    COUNT(RestaurantID) AS TotalTableBooking
FROM
    zomato_dataset
WHERE
    Has_Table_Booking = 'Yes';

-- Number of Restaurants by Country

SELECT 
    Country, COUNT(RestaurantID) AS TotalRestaurants
FROM
    zomato_dataset
GROUP BY Country;

-- Average Rating by Country

SELECT 
    Country, Round(AVG(Rating),1) AS AvgRating
FROM
    zomato_dataset
GROUP BY Country;

-- Top 10 Most Popular Cuisines

SELECT 
    Cuisines, COUNT(RestaurantID) AS TotalRestaurants
FROM
    zomato_dataset
GROUP BY Cuisines
ORDER BY TotalRestaurants DESC
LIMIT 10;

-- Average Cost by Cuisine

SELECT 
    Cuisines, ROUND(AVG(Average_Cost_for_two), 0) AS AvgCost
FROM
    zomato_dataset
GROUP BY Cuisines;

-- Top Rated Restaurants

SELECT 
    RestaurantName, Rating
FROM
    zomato_dataset
ORDER BY Rating DESC
LIMIT 10;

-- Restaurants with High Ratings

SELECT 
    (RestaurantID) AS HighRated
FROM
    zomato_dataset
WHERE
    Rating >= 4;

-- Restaurants with Low Ratings

SELECT 
    COUNT(RestaurantID) AS LowRated
FROM
    zomato_dataset
WHERE
    Rating <= 2;

-- Price Range Distribution

SELECT 
    Price_range, COUNT(RestaurantID) AS TotalRestaurants
FROM
    zomato_dataset
GROUP BY Price_range;

-- Votes Distribution by Rating

SELECT 
    Rating, SUM(Votes) AS TotalVotes
FROM
    zomato_dataset
GROUP BY Rating;

-- Top 5 Countries by Number of Restaurants

SELECT 
    Country, COUNT(RestaurantID) AS TotalRestaurants
FROM
    zomato_dataset
GROUP BY Country
ORDER BY TotalRestaurants DESC
LIMIT 5;

-- Total Number of Restaurants by Price Category (Budget, Mid-range, Premium)

SELECT 
    CASE 
        WHEN Price_range = 1 THEN 'Budget'
        WHEN Price_range IN (2, 3) THEN 'Mid-range'
        WHEN Price_range >= 4 THEN 'Premium'
    END AS Price_Category,
    COUNT(RestaurantID) AS Total_Restaurants
FROM 
    zomato_dataset
GROUP BY 
    Price_Category;
