--- Pulling Up Data From the Main Table

SELECT *
FROM dbo.OCEAN_Test_Results

-- Pulling Up Sample Sizes Which Are Not Accurate; i.e., Which Gave Very Little Responses

SELECT Country
FROM dbo.OCEAN_Test_Results
GROUP BY Country HAVING COUNT(Country) < 3

-- The Main Stuff 

SELECT Age, Country, Gender, ROUND(AVG(CAST([Average O Score] AS float)), 1) AS Average_Openness, 
ROUND(AVG(CAST([Average C Score] AS float)), 1) AS Average_Conscientiousness, 
ROUND(AVG(CAST([Average E Score] AS float)), 1) AS Average_Extraversion,
ROUND(AVG(CAST([Average A Score] AS float)), 1) AS Average_Agreeableness, 
ROUND(AVG(CAST([Average N Score] AS float)), 1) AS Average_Neuroticism
FROM dbo.OCEAN_Test_Results
GROUP BY Age, Gender, Country HAVING COUNT(Country) >= 3
ORDER BY Country


--- TRENDS BY GENDER

-- Pulling Up Average Overall OCEAN Scores for Each Gender

SELECT Gender, ROUND(AVG(CAST([Average O Score] AS float)), 1) AS Average_Openness, 
ROUND(AVG(CAST([Average C Score] AS float)), 1) AS Average_Conscientiousness, ROUND(AVG(CAST([Average E Score] AS float)), 1) AS Average_Extraversion,
ROUND(AVG(CAST([Average A Score] AS float)), 1) AS Average_Agreeableness, ROUND(AVG(CAST([Average N Score] AS float)), 1) AS Average_Neuroticism
FROM dbo.OCEAN_Test_Results
GROUP BY Gender

-- Pulling Up Average Overall OCEAN Scores for Each Gender and by Country

SELECT Gender, Country, ROUND(AVG(CAST([Average O Score] AS float)), 1) AS Average_Openness, 
ROUND(AVG(CAST([Average C Score] AS float)), 1) AS Average_Conscientiousness, ROUND(AVG(CAST([Average E Score] AS float)), 1) AS Average_Extraversion,
ROUND(AVG(CAST([Average A Score] AS float)), 1) AS Average_Agreeableness, ROUND(AVG(CAST([Average N Score] AS float)), 1) AS Average_Neuroticism
FROM dbo.OCEAN_Test_Results
GROUP BY Gender, Country
ORDER BY Country


--- NATIONAL TRENDS

-- Determining Average OCEAN Scores for Each Country

SELECT Country, ROUND(AVG(CAST([Average O Score] AS float)), 1) AS Average_Openness, 
ROUND(AVG(CAST([Average C Score] AS float)), 1) AS Average_Conscientiousness, 
ROUND(AVG(CAST([Average E Score] AS float)), 1) AS Average_Extraversion,
ROUND(AVG(CAST([Average A Score] AS float)), 1) AS Average_Agreeableness, 
ROUND(AVG(CAST([Average N Score] AS float)), 1) AS Average_Neuroticism
FROM dbo.OCEAN_Test_Results
GROUP BY Country HAVING COUNT(Country) >= 3
ORDER BY Country

-- Pulling Up the 10 Countries Highest-Ranking in Openness to Experience

SELECT TOP 10 Country, ROUND(AVG(CAST([Average O Score] AS float)), 1) AS Average_Openness_Score
FROM dbo.OCEAN_Test_Results
GROUP BY Country HAVING COUNT(Country) >= 3
ORDER BY Average_Openness_Score DESC

-- Pulling Up the 10 Countries Highest-Ranking in Conscientiousness

SELECT TOP 10 Country, ROUND(AVG(CAST([Average C Score] AS float)), 1) AS Average_Conscientiousness_Score
FROM dbo.OCEAN_Test_Results
GROUP BY Country HAVING COUNT(Country) >= 3
ORDER BY Average_Conscientiousness_Score DESC

-- Pulling Up the 10 Countries Highest-Ranking in Extraversion (Having the most "Extroverts")

SELECT TOP 10 Country, ROUND(AVG(CAST([Average E Score] AS float)), 1) AS Average_Extraversion_Score
FROM dbo.OCEAN_Test_Results
GROUP BY Country HAVING COUNT(Country) >= 3
ORDER BY Average_Extraversion_Score DESC

-- Pulling Up the 10 Countries Lowest-Ranking in Extraversion: Having the most "Introverts"!

SELECT TOP 10 Country, ROUND(AVG(CAST([Average E Score] AS float)), 1) AS Average_Extraversion_Score
FROM dbo.OCEAN_Test_Results
GROUP BY Country HAVING COUNT(Country) >= 3
ORDER BY Average_Extraversion_Score

-- Pulling Up the 10 Countries Highest-Ranking in Agreeableness

SELECT TOP 10 Country, ROUND(AVG(CAST([Average A Score] AS float)), 1) AS Average_Agreeableness_Score
FROM dbo.OCEAN_Test_Results
GROUP BY Country HAVING COUNT(Country) >= 3
ORDER BY Average_Agreeableness_Score DESC

-- Pulling Up the 10 Countries Highest-Ranking in Neuroticism

SELECT TOP 10 Country, ROUND(AVG(CAST([Average N Score] AS float)), 1) AS Average_Neuroticism_Score
FROM dbo.OCEAN_Test_Results
GROUP BY Country HAVING COUNT(Country) >= 3
ORDER BY Average_Neuroticism_Score DESC

-- Pulling Up the 10 Countries Lowest-Ranking in Neuroticism: with the Most Positive Thinkers!

SELECT TOP 10 Country, ROUND(AVG(CAST([Average N Score] AS float)), 1) AS Average_Neuroticism_Score
FROM dbo.OCEAN_Test_Results
GROUP BY Country HAVING COUNT(Country) >= 3
ORDER BY Average_Neuroticism_Score


--- TRENDS BY AGE

-- Listing Average OCEAN Scores by Each Age

SELECT Age, ROUND(AVG(CAST([Average O Score] AS float)), 1) AS Average_Openness, 
ROUND(AVG(CAST([Average C Score] AS float)), 1) AS Average_Conscientiousness, 
ROUND(AVG(CAST([Average E Score] AS float)), 1) AS Average_Extraversion,
ROUND(AVG(CAST([Average A Score] AS float)), 1) AS Average_Agreeableness, 
ROUND(AVG(CAST([Average N Score] AS float)), 1) AS Average_Neuroticism
FROM dbo.OCEAN_Test_Results
GROUP BY Age
ORDER BY Age

-- Do You Grow More Disciplined & Righteous with Age?

SELECT Age, ROUND(AVG(CAST([Average C Score] AS float)), 1) AS Average_Conscientiousness
FROM dbo.OCEAN_Test_Results
GROUP BY Age
ORDER BY Average_Conscientiousness DESC

-- Does Age have any Effect on Empathy? Whereby Meeting More People Makes You Understand Other Viewpoints Better & Become More Compassionate?

SELECT Age, ROUND(AVG(CAST([Average A Score] AS float)), 1) AS Average_Agreeableness
FROM dbo.OCEAN_Test_Results
GROUP BY Age
ORDER BY Age DESC

SELECT Top 10 Age, ROUND(AVG(CAST([Average A Score] AS float)), 1) AS Average_Agreeableness
FROM dbo.OCEAN_Test_Results
GROUP BY Age
ORDER BY Average_Agreeableness DESC

-- Is Becoming Compassionate More Dependent on Living in a Country with Diversity of People, Than on Age?

SELECT Country, ROUND(AVG(CAST([Average A Score] AS float)), 1) AS Average_Agreeableness
FROM dbo.OCEAN_Test_Results
GROUP BY Country HAVING COUNT(Country) >= 3
ORDER BY Average_Agreeableness DESC
