--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-tsa-select.sql

--Student ID: 29796431
--Student Name: Alexandra Goh 
--Unit Code: FIT9132
--Applied Class No: A03

/* Comments for your marker:




*/

/*2(a)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT
    p.town_id,
    t.town_name,
    p.poi_type_id,
    pt.poi_type_descr,
    COUNT(p.poi_type_id) AS poi_count
FROM
         tsa.town t
    JOIN tsa.point_of_interest p
    ON t.town_id = p.town_id
    JOIN tsa.poi_type          pt
    ON pt.poi_type_id = p.poi_type_id
GROUP BY
    p.town_id,
    t.town_name,
    p.poi_type_id,
    pt.poi_type_descr
HAVING
    COUNT(p.poi_type_id) > 1
ORDER BY
    p.town_id,
    pt.poi_type_descr;


/*2(b)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT
    m.member_id,
    ltrim(m.member_gname
          || ' '
          || m.member_fname)       AS member_name,
    m.resort_id,
    r.resort_name,
    COUNT(n.member_id_recby) AS number_of_recommendations
FROM
    tsa.member m
    LEFT JOIN tsa.member n
    ON m.member_id = n.member_id_recby
    JOIN tsa.resort r
    ON r.resort_id = m.resort_id
GROUP BY
    m.member_id,
    ltrim(m.member_gname
          || ' '
          || m.member_fname),
    m.resort_id,
    r.resort_name
HAVING
    COUNT(n.member_id_recby) = (
        SELECT
            MAX(number_of_recommendations)
        FROM
            (
                SELECT
                    COUNT(n.member_id_recby) AS number_of_recommendations
                FROM
                    tsa.member m
                    LEFT JOIN tsa.member n
                    ON m.member_id = n.member_id_recby
                    JOIN tsa.resort r
                    ON r.resort_id = m.resort_id
                GROUP BY
                    m.member_id
            )
    )
ORDER BY
    m.resort_id,
    m.member_id;


/*2(c)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT
    p.poi_id,
    p.poi_name,
    CASE
        WHEN COUNT(review_rating) = 0 THEN
            'NR'
        ELSE
            to_char(MAX(review_rating),
                    '9')
    END AS max_rating,
    CASE
        WHEN COUNT(review_rating) = 0 THEN
            'NR'
        ELSE
            to_char(MIN(review_rating),
                    '9')
    END AS min_rating,
    CASE
        WHEN COUNT(review_rating) = 0 THEN
            'NR'
        ELSE
            to_char(AVG(review_rating),
                    '9.0')
    END AS avg_rating
FROM
    tsa.point_of_interest p
    LEFT JOIN tsa.review            r
    ON p.poi_id = r.poi_id
GROUP BY
    p.poi_id,
    p.poi_name
ORDER BY
    p.poi_id;


/*2(d)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT
    p.poi_name,
    pt.poi_type_descr,
    t.town_name,
    lpad('Lat: '
         || to_char(t.town_lat, 900.999999)
         || ' Long: '
         || to_char(t.town_long, 900.999999),
         35,
         ' ')              AS town_location,
    COUNT(r.review_rating) AS reviews_completed,
    CASE
        WHEN COUNT(r.review_rating) = 0 THEN
            'No reviews completed'
        ELSE
            TRIM(' ' FROM to_char(COUNT(r.review_rating) * 100.0 /(
                SELECT
                    COUNT(review_rating)
                FROM
                    tsa.review
            ),
                                  '99.99'))
            || '%'
    END                    AS percent_of_reviews
FROM
         tsa.point_of_interest p
    JOIN tsa.town     t
    ON p.town_id = t.town_id
    JOIN tsa.poi_type pt
    ON p.poi_type_id = pt.poi_type_id
    LEFT JOIN tsa.review   r
    ON p.poi_id = r.poi_id
GROUP BY
    p.poi_name,
    pt.poi_type_descr,
    t.town_name,
    t.town_lat,
    t.town_long
ORDER BY
    t.town_name,
    reviews_completed DESC,
    poi_name;


/*2(e)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT
    r.resort_id,
    r.resort_name,
    m.member_no,
    ltrim(m.member_gname
          || ' '
          || m.member_fname)                           AS member_name,
    to_char(m.member_date_joined, 'dd-Mon-yyyy') AS date_joined,
    n.member_no
    || ' '
    || ltrim(n.member_gname
             || ' '
             || n.member_fname)                           AS recommended_by_details,
    lpad('$' || round(total_charges),
         13,
         ' ')                                    AS total_charges
FROM
         tsa.member m
    JOIN tsa.member_charge c
    ON m.member_id = c.member_id
    LEFT JOIN tsa.member        n
    ON m.member_id_recby = n.member_id
    JOIN tsa.resort        r
    ON r.resort_id = m.resort_id
    JOIN tsa.town          t
    ON r.town_id = t.town_id
    JOIN (
        SELECT
            mc.member_id,
            SUM(mc.mc_total) AS total_charges
        FROM
                 tsa.member_charge mc
            JOIN tsa.member mem
            ON mc.member_id = mem.member_id
        GROUP BY
            mc.member_id
    )                 charges
    ON charges.member_id = m.member_id
    JOIN (
        SELECT
            resort_id,
            round(AVG(total_mc_total)) AS average_charge
        FROM
            (
                SELECT
                    member_id,
                    resort_id,
                    SUM(mc_total) AS total_mc_total
                FROM
                         tsa.member_charge
                    NATURAL JOIN tsa.member
                GROUP BY
                    member_id,
                    resort_id
            )
        GROUP BY
            resort_id
    )                 ac
    ON ac.resort_id = r.resort_id
WHERE
    m.member_id_recby IS NOT NULL
    AND NOT ( t.town_name = 'Byron Bay'
              AND t.town_state = 'NSW' )
    AND charges.total_charges < ac.average_charge
GROUP BY
    r.resort_id,
    r.resort_name,
    m.member_no,
    ltrim(m.member_gname
          || ' '
          || m.member_fname),
    to_char(m.member_date_joined, 'dd-Mon-yyyy'),
    n.member_no
    || ' '
    || ltrim(n.member_gname
             || ' '
             || n.member_fname),
    charges.total_charges
ORDER BY
    r.resort_id,
    m.member_no;



/*2(f)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT
    resort_id,
    resort_name,
    p_town.poi_name,
    poi_town,
    poi_state,
    poi_opening_time,
    to_char(geodistance(r_town.resort_town_lat, r_town.resort_town_long, p_town.town_lat
    , p_town.town_long),
            '990.0')
    || ' Kms ' AS distance
FROM
    (
        SELECT
            resort_id,
            resort_name,
            t.town_lat  AS resort_town_lat,
            t.town_long AS resort_town_long
        FROM
                 tsa.resort r
            JOIN tsa.town t
            ON r.town_id = t.town_id
    ) r_town,
    (
        SELECT
            p.poi_name,
            t.town_name  AS poi_town,
            t.town_state AS poi_state,
            CASE
                WHEN p.poi_open_time IS NULL THEN
                    'Not Applicable'
                ELSE
                    to_char(p.poi_open_time, 'HH24:MI AM')
            END          AS poi_opening_time,
            t.town_lat,
            t.town_long
        FROM
                 tsa.point_of_interest p
            JOIN tsa.town t
            ON p.town_id = t.town_id
    ) p_town
WHERE
    geodistance(r_town.resort_town_lat, r_town.resort_town_long, p_town.town_lat, p_town.town_long
    ) <= 100
ORDER BY
    r_town.resort_name,
    distance;