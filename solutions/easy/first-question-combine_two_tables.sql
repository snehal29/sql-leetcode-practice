-- LeetCode #175: Combine Two Tables
-- Difficulty: Easy
--
-- Problem:
-- Return first name, last name, city and state for every person.
-- If a person has no address, city and state should be NULL.
--
-- Approach:
-- Use Person as the main table because every person must be returned.
-- LEFT JOIN Address using personId so people without an address are retained.
--
-- Pattern:
-- LEFT JOIN
--
-- Solution:

SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId;
