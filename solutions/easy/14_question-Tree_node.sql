-- LeetCode #595: Tree Node
-- Difficulty: Easy
--
-- Problem:
-- Each node in the tree can be one of three types:
--
--   "Leaf": if the node is a leaf node.
--   "Root": if the node is the root of the tree.
--   "Inner": If the node is neither a leaf node nor a root node.
--   Write a solution to report the type of each node in the tree.
--
-- Approach:
-- Self join , Case , IS NULL , IS NOT NULL 
-- 
-- Pattern:
-- SELF JOIN and CASE
--
-- Solution:
select  distinct t1.id ,
    case when t1.p_id is null then 'Root'
    when t2.p_id is not null then 'Inner'
    else 'Leaf'
    end as type
from Tree t1
left join Tree t2
on t1.id = t2.p_id

-- Another approach : Best (Leet Code solution from another user)
select id,
(
    case
        when p_id is null then 'Root'
        when id in (select p_id from tree) then 'Inner'
        else 'Leaf'
    end
) as type
from tree;
