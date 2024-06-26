--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-tsa-dm.sql

--Student ID: 29796431
--Student Name: Alexandra Goh
--Unit Code: FIT9132
--Applied Class No: A03

/* Comments for your marker:




*/

---**This command shows the outputs of triggers**---
---**Run the command before running the insert statements.**---
---**Do not remove**---
SET SERVEROUTPUT ON
---**end**---

set pagesize 200;

--3(a)

DROP SEQUENCE booking_seq;

CREATE SEQUENCE booking_seq START WITH 100 INCREMENT BY 10;


--3(b)

INSERT INTO cabin VALUES (
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
                upper(resort_name) = upper('Awesome Resort')
            AND town_id = (
                SELECT
                    town_id
                FROM
                    town
                WHERE
                        town_lat = - 17.9644
                    AND town_long = 122.2304
                    AND upper(town_name) = upper('Broome')
            )
    ),
    4,
    4,
    10,
    'C',
    220,
    'Spacious cabin w/ patio, beach views'
);

COMMIT;


--3(c)

INSERT INTO booking VALUES (
    booking_seq.NEXTVAL,
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
                upper(resort_name) = upper('Awesome Resort')
            AND town_id = (
                SELECT
                    town_id
                FROM
                    town
                WHERE
                        town_lat = - 17.9644
                    AND town_long = 122.2304
                    AND upper(town_name) = upper('Broome')
            )
    ),
    4,
    TO_DATE('26/05/2023', 'dd/mm/yyyy'),
    TO_DATE('28/05/2023', 'dd/mm/yyyy'),
    4,
    4,
    (
        SELECT
            cabin_points_cost_day
        FROM
            cabin
        WHERE
                resort_id = (
                    SELECT
                        resort_id
                    FROM
                        resort
                    WHERE
                            upper(resort_name) = upper('Awesome Resort')
                        AND town_id = (
                            SELECT
                                town_id
                            FROM
                                town
                            WHERE
                                    town_lat = - 17.9644
                                AND town_long = 122.2304
                                AND upper(town_name) = upper('Broome')
                        )
                )
            AND cabin_no = 4
    ) * ( TO_DATE('28/05/2023', 'dd/mm/yyyy') - TO_DATE('26/05/2023', 'dd/mm/yyyy') )
    ,
    (
        SELECT
            member_id
        FROM
            member
        WHERE
                resort_id = 9
            AND member_no = 2
    ),
    (
        SELECT
            staff_id
        FROM
            staff
        WHERE
            staff_phone = '0493427245'
    )
);

COMMIT;


--3(d)

UPDATE booking
SET
    booking_to = TO_DATE('29/05/2023', 'dd/mm/yyyy'),
    booking_total_points_cost = (
        SELECT
            cabin_points_cost_day
        FROM
            cabin
        WHERE
                resort_id = (
                    SELECT
                        resort_id
                    FROM
                        resort
                    WHERE
                            upper(resort_name) = upper('Awesome Resort')
                        AND town_id = (
                            SELECT
                                town_id
                            FROM
                                town
                            WHERE
                                    town_lat = - 17.9644
                                AND town_long = 122.2304
                                AND upper(town_name) = upper('Broome')
                        )
                )
            AND cabin_no = 4
    ) * ( TO_DATE('29/05/2023', 'dd/mm/yyyy') - TO_DATE('26/05/2023', 'dd/mm/yyyy') )
WHERE
        resort_id = (
            SELECT
                resort_id
            FROM
                resort
            WHERE
                    upper(resort_name) = upper('Awesome Resort')
                AND town_id = (
                    SELECT
                        town_id
                    FROM
                        town
                    WHERE
                            town_lat = - 17.9644
                        AND town_long = 122.2304
                        AND upper(town_name) = upper('Broome')
                )
        )
    AND cabin_no = 4
    AND booking_from = TO_DATE('26/05/2023', 'dd/mm/yyyy');

COMMIT;

--3(e)

DELETE FROM booking
WHERE
        resort_id = (
            SELECT
                resort_id
            FROM
                resort
            WHERE
                    upper(resort_name) = upper('Awesome Resort')
                AND town_id = (
                    SELECT
                        town_id
                    FROM
                        town
                    WHERE
                            town_lat = - 17.9644
                        AND town_long = 122.2304
                        AND upper(town_name) = upper('Broome')
                )
        )
    AND cabin_no = 4;

DELETE FROM cabin
WHERE
        resort_id = (
            SELECT
                resort_id
            FROM
                resort
            WHERE
                    upper(resort_name) = upper('Awesome Resort')
                AND town_id = (
                    SELECT
                        town_id
                    FROM
                        town
                    WHERE
                            town_lat = - 17.9644
                        AND town_long = 122.2304
                        AND upper(town_name) = upper('Broome')
                )
        )
    AND cabin_no = 4;

COMMIT;