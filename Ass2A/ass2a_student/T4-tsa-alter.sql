--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-tsa-alter.sql

--Student ID: 29796431
--Student Name: Alexandra Goh
--Unit Code: FIT9132
--Applied Class No: A03

/* Comments for your marker:




*/

set pagesize 200;

--4(a)

ALTER TABLE cabin ADD booking_count NUMBER(5) DEFAULT 0 NOT NULL;

COMMENT ON COLUMN cabin.booking_count IS
    'Total number of bookings';

DESC cabin;

UPDATE cabin
SET
    cabin.booking_count = (
        SELECT
            COUNT(*)
        FROM
            booking
        WHERE
            booking.resort_id = cabin.resort_id
            AND booking.cabin_no = cabin.cabin_no
    );

SELECT
    *
FROM
    cabin;

COMMIT;

--4(b)

DROP TABLE staff_role CASCADE CONSTRAINTS PURGE;

CREATE TABLE staff_role (
    staff_role_id   CHAR(1) NOT NULL,
    staff_role_name VARCHAR(20) NOT NULL,
    staff_job_desc  VARCHAR(60) NOT NULL
);

COMMENT ON COLUMN staff_role.staff_role_id IS
    'Staff role ID';

COMMENT ON COLUMN staff_role.staff_role_name IS
    'Staff role name';

COMMENT ON COLUMN staff_role.staff_job_desc IS
    'Staff job description';

ALTER TABLE staff_role ADD CONSTRAINT staff_role_pk PRIMARY KEY ( staff_role_id );

desc staff_role;

ALTER TABLE staff ADD staff_role_id CHAR(1);

COMMENT ON COLUMN staff.staff_role_id IS
    'Staff role ID';

ALTER TABLE staff
    ADD CONSTRAINT staff_role_staff FOREIGN KEY ( staff_role_id )
        REFERENCES staff_role ( staff_role_id );

desc staff;

INSERT INTO staff_role VALUES (
    'A',
    'Admin',
    'Take bookings, and reply to customer inquiries'
);

INSERT INTO staff_role VALUES (
    'C',
    'Cleaning',
    'Clean cabins and maintain resort''s public area'
);

INSERT INTO staff_role VALUES (
    'M',
    'Marketing',
    'Prepare and present marketing ideas and deliverables'
);

COMMIT;

SELECT
    *
FROM
    staff_role;

UPDATE staff
SET
    staff.staff_role_id = 'A';

COMMIT;

SELECT
    *
FROM
    staff;
        
--4(c)

DROP TABLE cleaning CASCADE CONSTRAINTS PURGE;

CREATE TABLE cleaning (
    cleaning_id         NUMBER(6) NOT NULL,
    booking_id          NUMBER(8) NOT NULL,
    staff_id            NUMBER(5) NOT NULL,
    cleaning_start_time DATE NOT NULL,
    cleaning_end_time   DATE 
);

COMMENT ON COLUMN cleaning.cleaning_id IS
    'Unique identifier for each cleaning record';

COMMENT ON COLUMN cleaning.booking_id IS
    'Identifier for a booking';

COMMENT ON COLUMN cleaning.staff_id IS
    'Staff identifier';

COMMENT ON COLUMN cleaning.cleaning_start_time IS
    'Cleaning start time';

COMMENT ON COLUMN cleaning.cleaning_end_time IS
    'Cleaning end time';

ALTER TABLE cleaning ADD CONSTRAINT cleaning_pk PRIMARY KEY ( cleaning_id );

ALTER TABLE cleaning
    ADD CONSTRAINT cleaning_nk UNIQUE ( booking_id,
                                        staff_id,
                                        cleaning_start_time );
                                        
ALTER TABLE cleaning
    ADD CONSTRAINT booking_cleaning FOREIGN KEY ( booking_id )
        REFERENCES booking ( booking_id );
        
ALTER TABLE cleaning
    ADD CONSTRAINT staff_cleaning FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id );

desc cleaning;