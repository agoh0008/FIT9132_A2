/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-tsa-insert.sql

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

--------------------------------------
--INSERT INTO cabin
--------------------------------------

set pagesize 200;

INSERT INTO cabin VALUES (
    1,
    1,
    1,
    2,
    'I',
    100,
    'Romantic cabin w/ balcony, ocean views'
);

INSERT INTO cabin VALUES (
    1,
    2,
    2,
    4,
    'I',
    120,
    'Spacious cabin w/ kitchen, outdoor dining'
);

INSERT INTO cabin VALUES (
    1,
    3,
    3,
    6,
    'I',
    150,
    'Family-friendly w/ fireplace, coastal decor'
);

INSERT INTO cabin VALUES (
    1,
    4,
    4,
    8,
    'C',
    200,
    'Luxury cabin w/ pool, outdoor living'
);

INSERT INTO cabin VALUES (
    2,
    1,
    1,
    2,
    'I',
    90,
    'Cozy cabin w/ ocean views, private balcony'
);

INSERT INTO cabin VALUES (
    2,
    2,
    2,
    5,
    'I',
    110,
    'Modern cabin w/ kitchen, outdoor seating'
);

INSERT INTO cabin VALUES (
    2,
    3,
    3,
    7,
    'C',
    130,
    'Rustic cabin w/ beachy decor, BBQ, outdoor shower'
);

INSERT INTO cabin VALUES (
    2,
    4,
    4,
    9,
    'C',
    170,
    'Secluded cabin w/ hot tub, sauna, game room'
);

INSERT INTO cabin VALUES (
    3,
    1,
    2,
    4,
    'I',
    120,
    'Stylish cabin w/ patio, desert views'
);

INSERT INTO cabin VALUES (
    3,
    2,
    3,
    6,
    'C',
    150,
    'Traditional cabin w/ kitchen, fireplace'
);

INSERT INTO cabin VALUES (
    3,
    3,
    4,
    10,
    'C',
    200,
    'Serene cabin w/ pool, outdoor lounge'
);

INSERT INTO cabin VALUES (
    6,
    1,
    1,
    2,
    'I',
    80,
    'Romantic cabin w/ king bed, deck'
);

INSERT INTO cabin VALUES (
    6,
    2,
    2,
    4,
    'I',
    100,
    'Luxurious cabin w/ gourmet kitchen, outdoor lounge'
);

INSERT INTO cabin VALUES (
    6,
    3,
    3,
    6,
    'C',
    130,
    'Secluded cabin w/ hot tub, mountain views'
);

INSERT INTO cabin VALUES (
    6,
    4,
    4,
    8,
    'C',
    170,
    'Elegant cabin w/ pool, indoor fireplace'
);

INSERT INTO cabin VALUES (
    7,
    1,
    1,
    2,
    'I',
    80,
    'Modern cabin w/ kitchen, outdoor seating'
);

INSERT INTO cabin VALUES (
    7,
    2,
    2,
    5,
    'I',
    110,
    'Charming cabin w/ garden terrace, BBQ'
);

INSERT INTO cabin VALUES (
    7,
    3,
    3,
    8,
    'I',
    160,
    'Family-friendly cabin w/ pool, outdoor dining'
);

INSERT INTO cabin VALUES (
    7,
    4,
    3,
    8,
    'C',
    130,
    'Rustic cabin w/ pool, outdoor dining'
);

INSERT INTO cabin VALUES (
    7,
    5,
    4,
    10,
    'C',
    190,
    'Private cabin w/ hot tub, river views'
);


--------------------------------------
--INSERT INTO booking
--------------------------------------

INSERT INTO booking VALUES (
    1,
    1,
    3,
    TO_DATE('03/03/2023', 'dd/mm/yyyy'),
    TO_DATE('07/03/2023', 'dd/mm/yyyy'),
    6,
    0,
    600,
    10,
    1
);

INSERT INTO booking VALUES (
    2,
    1,
    1,
    TO_DATE('05/03/2023', 'dd/mm/yyyy'),
    TO_DATE('11/03/2023', 'dd/mm/yyyy'),
    2,
    0,
    600,
    4,
    2
);

INSERT INTO booking VALUES (
    3,
    3,
    1,
    TO_DATE('05/03/2023', 'dd/mm/yyyy'),
    TO_DATE('08/03/2023', 'dd/mm/yyyy'),
    2,
    2,
    360,
    20,
    5
);

INSERT INTO booking VALUES (
    4,
    6,
    4,
    TO_DATE('06/03/2023', 'dd/mm/yyyy'),
    TO_DATE('09/03/2023', 'dd/mm/yyyy'),
    4,
    3,
    510,
    24,
    11
);

INSERT INTO booking VALUES (
    5,
    2,
    2,
    TO_DATE('11/03/2023', 'dd/mm/yyyy'),
    TO_DATE('13/03/2023', 'dd/mm/yyyy'),
    2,
    3,
    220,
    5,
    3
);

INSERT INTO booking VALUES (
    6,
    3,
    2,
    TO_DATE('13/03/2023', 'dd/mm/yyyy'),
    TO_DATE('18/03/2023', 'dd/mm/yyyy'),
    5,
    0,
    750,
    3,
    6
);

INSERT INTO booking VALUES (
    7,
    1,
    2,
    TO_DATE('17/03/2023', 'dd/mm/yyyy'),
    TO_DATE('21/03/2023', 'dd/mm/yyyy'),
    4,
    0,
    480,
    1,
    1
);

INSERT INTO booking VALUES (
    8,
    3,
    1,
    TO_DATE('21/03/2023', 'dd/mm/yyyy'),
    TO_DATE('28/03/2023', 'dd/mm/yyyy'),
    3,
    0,
    840,
    12,
    7
);

INSERT INTO booking VALUES (
    9,
    7,
    2,
    TO_DATE('25/03/2023', 'dd/mm/yyyy'),
    TO_DATE('28/03/2023', 'dd/mm/yyyy'),
    2,
    3,
    330,
    16,
    13
);

INSERT INTO booking VALUES (
    10,
    1,
    3,
    TO_DATE('01/04/2023', 'dd/mm/yyyy'),
    TO_DATE('05/04/2023', 'dd/mm/yyyy'),
    2,
    4,
    600,
    8,
    2
);

INSERT INTO booking VALUES (
    11,
    3,
    2,
    TO_DATE('03/04/2023', 'dd/mm/yyyy'),
    TO_DATE('06/04/2023', 'dd/mm/yyyy'),
    6,
    0,
    450,
    22,
    5
);

INSERT INTO booking VALUES (
    12,
    1,
    2,
    TO_DATE('11/04/2023', 'dd/mm/yyyy'),
    TO_DATE('16/04/2023', 'dd/mm/yyyy'),
    2,
    2,
    600,
    2,
    1
);

INSERT INTO booking VALUES (
    13,
    6,
    2,
    TO_DATE('13/04/2023', 'dd/mm/yyyy'),
    TO_DATE('19/04/2023', 'dd/mm/yyyy'),
    2,
    2,
    600,
    14,
    12
);

INSERT INTO booking VALUES (
    14,
    2,
    3,
    TO_DATE('20/04/2023', 'dd/mm/yyyy'),
    TO_DATE('23/04/2023', 'dd/mm/yyyy'),
    7,
    0,
    390,
    10,
    4
);

INSERT INTO booking VALUES (
    15,
    7,
    3,
    TO_DATE('21/04/2023', 'dd/mm/yyyy'),
    TO_DATE('25/04/2023', 'dd/mm/yyyy'),
    5,
    2,
    640,
    5,
    13
);

INSERT INTO booking VALUES (
    16,
    3,
    2,
    TO_DATE('22/04/2023', 'dd/mm/yyyy'),
    TO_DATE('27/04/2023', 'dd/mm/yyyy'),
    3,
    3,
    750,
    17,
    7
);

INSERT INTO booking VALUES (
    17,
    1,
    2,
    TO_DATE('22/04/2023', 'dd/mm/yyyy'),
    TO_DATE('29/04/2023', 'dd/mm/yyyy'),
    4,
    0,
    840,
    6,
    2
);

INSERT INTO booking VALUES (
    18,
    7,
    4,
    TO_DATE('22/04/2023', 'dd/mm/yyyy'),
    TO_DATE('26/04/2023', 'dd/mm/yyyy'),
    5,
    3,
    520,
    20,
    14
);

INSERT INTO booking VALUES (
    19,
    3,
    3,
    TO_DATE('26/04/2023', 'dd/mm/yyyy'),
    TO_DATE('28/04/2023', 'dd/mm/yyyy'),
    6,
    4,
    400,
    24,
    6
);

INSERT INTO booking VALUES (
    20,
    3,
    1,
    TO_DATE('26/04/2023', 'dd/mm/yyyy'),
    TO_DATE('30/04/2023', 'dd/mm/yyyy'),
    4,
    0,
    480,
    1,
    5
);

COMMIT;