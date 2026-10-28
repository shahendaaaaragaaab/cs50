-- Keep a log of any SQL queries you execute as you solve the myste

-- Step 1: Check crime scene reports for the theft on Humphrey Street on July 28
SELECT * FROM crime_scene_reports
WHERE street = 'Humphrey Street' AND month = 7 AND day = 28;

-- Findings:
-- 1. Theft of the CS50 duck took place at 10:15 AM at the Humphrey Street bakery.
-- 2. 3 witnesses were interviewed, and all of them mentioned the bakery.

-- Step 2: Interviews on July 28
SELECT * FROM interviews WHERE month = 7 AND day = 28 AND transcript LIKE '%bakery%';

-- Notes from witnesses:
-- Ruth: Thief left bakery parking lot between 10:15 and 10:25 AM.
-- Eugene: Thief withdrew money from ATM on Leggett Street in the morning.
-- Raymond: Thief made a call under 1 min, taking earliest flight tomorrow (July 29), accomplice bought ticket.

-- Step 3: Check bakery security logs for cars exiting between 10:15 and 10:25 AM
select *from bakery_security_logs where day= 28 and month=7 and hour= 10 and minute between 15 and 25 ;
-- Found multiple license plates exiting the parking lot. Need to cross-check with other clues (ATM & phone calls).

-- Step 4: Check ATM withdrawals on Leggett Street on July 28 morning
select * from atm_transactions where day =28 and month=7 and atm_location='Leggett Street' and transaction_type='withdraw';
-- Notes:
-- Found list of account numbers that made withdrawals on Leggett Street on July 28 morning.
-- Need to match these account numbers with person IDs via bank_accounts table.


-- Step 5: Get person_ids for account numbers from ATM withdrawals
select * from bank_accounts where account_number in
(select account_number from atm_transactions where
 day=28 and month=7 and atm_location='Leggett Street' and transaction_type='withdraw');
-- Notes:
-- Got a list of person_ids for everyone who withdrew money at Leggett Street that morning.

-- Step 6: Get the name of the person associated with the account number
select name from people where id in (
    select person_id from bank_accounts where account_number = 28500762);
-- Notes:
-- Found person name: Luca

-- Step 7: Check phone calls for Luca to verify
select * from phone_calls where caller in (
    select phone_number from people where name = 'Luca'
);

-- Notes:
-- Luca's calls were not on July 28 and duration was > 60 seconds.
-- Luca is ruled out (not the thief).

-- Step 8: Find suspects who both withdrew money and left the bakery
select name from people
where license_plate in (
    select license_plate from bakery_security_logs
    where day = 28 and month = 7 and hour = 10 and minute between 15 and 25
)
and id in (
    select person_id from bank_accounts
    where account_number in (
        select account_number from atm_transactions
        where day = 28 and month = 7 and atm_location = 'Leggett Street' and transaction_type = 'withdraw'
    )
);

-- Notes:
-- Found suspects: Luca, Iman, Diana, Bruce.
-- Luca was already ruled out in step 7.
-- Current suspect list: Iman, Diana, Bruce.

-- Step 9: Check phone calls on July 28 (< 60s) for the remaining suspects (Iman, Diana, Bruce)
select * from phone_calls where day = 28 and month = 7 and duration < 60 and caller in (
    select phone_number from people where name in ('Iman', 'Diana', 'Bruce')
);

-- Find the names of the callers matching the returned phone numbers
select name from people where phone_number in ('(367) 555-5533', '(770) 555-1861');

-- Notes:
-- Found names: Diana, Bruce.
-- Iman did not make a call on July 28 (< 60s), so Iman is ruled out.
-- Current suspects: Diana, Bruce.

-- Step 10: Check flights leaving on July 29 from Fiftyville to find the earliest flight
select * from flights where day = 29 and month = 7;

-- Check which suspect (Diana or Bruce) is on the earliest flight (flight_id = 36)
select name from people where passport_number in (
select passport_number from passengers where flight_id = 36) and name in ('Diana', 'Bruce');

-- Notes:
-- Earliest flight from Fiftyville on July 29 is flight ID 36 (at 8:20 AM).
-- Found suspect on this flight: Bruce.
-- Diana is ruled out.
-- The thief is Bruce!

-- Step 11: Find the accomplice who received the phone call from Bruce, and the destination city
-- Find the accomplice name (who received the call from Bruce on July 28 < 60s)
select name from people where phone_number in (
    select receiver from phone_calls
    where month = 7 and day = 28 and duration < 60
    and caller = (select phone_number from people where name = 'Bruce')
);

-- Find the destination city for flight ID 36 (destination_airport_id = 4)
select city from airports where id = 4;

-- Final Results:
-- Thief: Bruce
-- City Escaped To: New York City
-- Accomplice: Robin















