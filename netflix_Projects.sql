use sql_projects;

#List all Movies longer than 120 minutes.

select * from netflix_data
where duration > 120;

SELECT *
FROM netflix_data
WHERE type = 'Movie'
AND CAST(REPLACE(duration, ' min', '') AS UNSIGNED) > 120;

#Find TV Shows having more than 3 seasons.

select *
from netflix_data
where type = 'TV Show'
and cast(replace(duration, ' seasons', '') as unsigned) > 3;

#Display titles added in September.

select title, date_added from netflix_data
where date_added like 'September%';

#Count how many titles belong to each rating.

select rating, count(*) from netflix_data
group by rating;

#Find all titles where the cast contains Shah Rukh Khan.

select title, cast from netflix_data
where cast like '%Shah Rukh Khan%';

#List all titles directed by the same director.

select director, count(*) as title from netflix_data
group by director
having title > 1;


SELECT director, COUNT(*) AS total_titles
FROM netflix_data
WHERE director IS NOT NULL
GROUP BY director
HAVING COUNT(*) > 1;

#Find the oldest and newest release year.

select min(release_year) as oldest_movie, max(release_year) as newest_movie from netflix_data;

SELECT title, release_year
FROM netflix_data
WHERE release_year = (
    SELECT MIN(release_year)
    FROM netflix_data
)
or release_year = (
    SELECT MAX(release_year)
    FROM netflix_data
);

#Find the top 10 directors with the highest number of Netflix titles.

SELECT director, COUNT(*) AS total_titles
FROM netflix_data
WHERE director IS NOT NULL
GROUP BY director
order by total_titles desc limit 10;

#Find directors who have directed both Movies and TV Shows.

SELECT 
    director,
    SUM(type = 'Movie') AS Movies,
    SUM(type = 'TV Show') AS TV_Shows
FROM netflix_data
WHERE director IS NOT NULL
GROUP BY director
HAVING Movies > 0 AND TV_Shows > 0;

#Rank countries based on the number of titles available.

select 
country,
Count(*) as total_titles,
dense_rank() over(order by count(*) desc) as country_rank
from netflix_data
where country is not null
group by country;

#Find the percentage of Movies vs TV Shows.

SELECT 
    type,
    COUNT(*) AS total_titles,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix_data),
        2
    ) AS percentage
FROM netflix_data
GROUP BY type;

#Find the average movie duration.

SELECT 
    ROUND(AVG(CAST(REPLACE(duration, ' min', '') AS UNSIGNED)), 2) AS average_movie_duration
FROM netflix_data
WHERE type = 'Movie';

#Find the longest movie available.

select 
	max(cast(Replace(duration, ' min', '') as unsigned )) as Longest_movie
    from netflix_data
    where type = 'Movie';
    
SELECT title, duration
FROM netflix_data
WHERE type = 'Movie'
AND CAST(REPLACE(duration, ' min', '') AS UNSIGNED) = 
(
    SELECT MAX(CAST(REPLACE(duration, ' min', '') AS UNSIGNED))
    FROM netflix_data
    WHERE type = 'Movie'
);

#Find the shortest movie available.

select title, duration
from netflix_data
where type = 'Movie'
and duration <> ''
and cast(replace(duration, ' min', '') as unsigned) =
(
	select min(cast(replace(duration, ' min', '') as unsigned))
    from netflix_data
    where type = 'Movie'
    and duration <> ''
);

#Display titles added more than 5 years after their release year.

SELECT title, release_year, date_added
FROM netflix_data
WHERE YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) - release_year > 5;

#Find the most common rating for Movies.

select rating, count(*) as rating_count from netflix_data
where type = 'Movie'
group by rating
order by rating_count desc
limit 1;

#Find the most common rating for TV Shows.

select rating, count(*) as rating_count from netflix_data
where type = 'TV Show'
group by rating
order by rating_count desc
limit 1;

#Find all titles belonging to the Drama genre.

select title, listed_in from netflix_data
where listed_in like '%Dramas%';

#Count how many titles belong to each genre.

WITH RECURSIVE genre_split AS
(
    SELECT
        title,
        TRIM(SUBSTRING_INDEX(listed_in, ',', 1)) AS genre,
        SUBSTRING(
            listed_in,
            LENGTH(SUBSTRING_INDEX(listed_in, ',', 1)) + 2
        ) AS remaining_genre
    FROM netflix_data

    UNION ALL

    SELECT
        title,
        TRIM(SUBSTRING_INDEX(remaining_genre, ',', 1)),
        SUBSTRING(
            remaining_genre,
            LENGTH(SUBSTRING_INDEX(remaining_genre, ',', 1)) + 2
        )
    FROM genre_split
    WHERE remaining_genre <> ''
)

SELECT 
    genre,
    COUNT(*) AS total_titles
FROM genre_split
GROUP BY genre
ORDER BY total_titles DESC;

#Find titles that belong to more than three genres.

SELECT title,
       listed_in,
       (LENGTH(listed_in) - LENGTH(REPLACE(listed_in, ',', '')) + 1)  AS genre_count
FROM netflix_data
ORDER BY genre_count DESC;

#Find all titles containing the word Love

select title from netflix_data
where title like "%Love%";

#Find titles whose description contains family.

select title, description from netflix_data
where description like "%family%" or
description like "%Family%";

#Find all actors who appear in more than one title.

WITH RECURSIVE Cast_split AS
(
    SELECT
        title,
        TRIM(SUBSTRING_INDEX(cast, ',', 1)) AS Actor,
        SUBSTRING(
            cast,
            LENGTH(SUBSTRING_INDEX(cast, ',', 1)) + 2
        ) AS remaining_actor
    FROM netflix_data

    UNION ALL

    SELECT
        title,
        TRIM(SUBSTRING_INDEX(remaining_actor, ',', 1)),
        SUBSTRING(
            remaining_actor,
            LENGTH(SUBSTRING_INDEX(remaining_actor, ',', 1)) + 2
        )
    FROM cast_split
    WHERE remaining_actor <> ''
)

SELECT 
    Actor,
    COUNT(*) AS total_titles
FROM cast_split
GROUP BY actor 
ORDER BY total_titles DESC;

#Count how many times each actor appears.

WITH RECURSIVE Cast_split AS
(
    SELECT
        title,
        TRIM(SUBSTRING_INDEX(cast, ',', 1)) AS Actor,
        SUBSTRING(
            cast,
            LENGTH(SUBSTRING_INDEX(cast, ',', 1)) + 2
        ) AS remaining_actor
    FROM netflix_data

    UNION ALL

    SELECT
        title,
        TRIM(SUBSTRING_INDEX(remaining_actor, ',', 1)),
        SUBSTRING(
            remaining_actor,
            LENGTH(SUBSTRING_INDEX(remaining_actor, ',', 1)) + 2
        )
    FROM cast_split
    WHERE remaining_actor <> ''
)

SELECT 
    Actor,
    COUNT(DISTINCT title) AS total_titles
FROM cast_split
GROUP BY actor 
ORDER BY total_titles DESC;

#Find the most frequently appearing actor.

WITH RECURSIVE Cast_split AS
(
    SELECT
        title,
        TRIM(SUBSTRING_INDEX(cast, ',', 1)) AS Actor,
        SUBSTRING(
            cast,
            LENGTH(SUBSTRING_INDEX(cast, ',', 1)) + 2
        ) AS remaining_actor
    FROM netflix_data
    where cast is not null 

    UNION ALL

    SELECT
        title,
        TRIM(SUBSTRING_INDEX(remaining_actor, ',', 1)),
        SUBSTRING(
            remaining_actor,
            LENGTH(SUBSTRING_INDEX(remaining_actor, ',', 1)) + 2
        )
    FROM cast_split
    WHERE remaining_actor <> ''
)

SELECT 
    Actor,
    COUNT(DISTINCT title) AS total_titles
FROM cast_split
where actor <> ''
GROUP BY actor 
ORDER BY total_titles DESC
limit 1;

#Find titles with multiple directors.

select director, title
 from netflix_data
where director <> ''
and(
	Length(director)
    - Length(replace(director, ',', ''))
    ) >= 1;
    
#Extract the year from date_added.

select Year(str_to_date(date_added, '%M %d, %Y')) as year_added from netflix_data;

#Count how many titles were added each month.

select
Monthname(str_to_date(date_added, '%M %d, %Y')) as added_month,
count(*) as total_titles from netflix_data
where date_added is not null
group by added_month
order by Month(str_to_date(added_month, '%M %d, %Y'));

#Find the month with the highest number of additions.

SELECT
    MONTHNAME(STR_TO_DATE(date_added, '%M %d, %Y')) AS added_month,
    COUNT(*) AS total_titles
FROM netflix_data
WHERE date_added IS NOT NULL
GROUP BY added_month
ORDER BY total_titles DESC
LIMIT 1;

#Find titles added within one year of their release.

SELECT
    title,
    release_year,
    YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS added_year
FROM netflix_data
WHERE date_added IS NOT NULL
AND ABS(
    YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) - release_year
) <= 1;

#Calculate the average delay between release and Netflix addition.

SELECT
    ROUND(
        AVG(
            YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) - release_year
        ),
        2
    ) AS average_delay_years
FROM netflix_data
WHERE date_added IS NOT NULL;

#Split the listed_in column into individual genres.

WITH RECURSIVE genre_split AS
(
    -- First genre
    SELECT
        title,
        TRIM(SUBSTRING_INDEX(listed_in, ',', 1)) AS genre,
        SUBSTRING(
            listed_in,
            LENGTH(SUBSTRING_INDEX(listed_in, ',', 1)) + 2
        ) AS remaining_genre
    FROM netflix_data
    WHERE listed_in IS NOT NULL
      AND listed_in <> ''

    UNION ALL

    -- Next genres
    SELECT
        title,
        TRIM(SUBSTRING_INDEX(remaining_genre, ',', 1)),
        SUBSTRING(
            remaining_genre,
            LENGTH(SUBSTRING_INDEX(remaining_genre, ',', 1)) + 2
        )
    FROM genre_split
    WHERE remaining_genre <> ''
)

SELECT 
    title,
    genre
FROM genre_split;