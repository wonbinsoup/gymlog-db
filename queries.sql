-- Query 1: JOIN of 3+ tables
-- Show every set logged with the user's name, exercise name,
-- and the session date it was performed on\
SELECT 
    u.username,
    ws.session_date,
    e.name AS exercise,
    wset.reps,
    wset.weight
FROM WorkoutSet wset
JOIN WorkoutSession ws ON wset.session_id = ws.session_id
JOIN User u ON ws.user_id = u.user_id
JOIN Exercise e ON wset.exercise_id = e.exercise_id
ORDER BY ws.session_date, u.username;



-- Query 2: SUBQUERY
-- Find all users who have logged at least one personal record
-- above the average max_weight across all personal records

SELECT 
    u.username,
    pr.max_weight,
    e.name AS exercise
FROM PersonalRecord pr
JOIN User u ON pr.user_id = u.user_id
JOIN Exercise e ON pr.exercise_id = e.exercise_id
WHERE pr.max_weight > (
    SELECT AVG(max_weight) FROM PersonalRecord
);


-- Query 3: GROUP BY with HAVING
-- Show users who have completed more than 2 workout sessions,
-- along with their total session count and avg duration

SELECT 
    u.username,
    COUNT(ws.session_id) AS total_sessions,
    AVG(ws.duration) AS avg_duration
FROM WorkoutSession ws
JOIN User u ON ws.user_id = u.user_id
GROUP BY u.user_id
HAVING COUNT(ws.session_id) > 2;



-- Query 4: COMPLEX WHERE (multiple conditions)
-- Find all sets where weight is over 150 AND reps are 5 or more
-- OR the exercise is in the 'Legs' category

SELECT 
    u.username,
    e.name AS exercise,
    e.category,
    wset.reps,
    wset.weight
FROM WorkoutSet wset
JOIN Exercise e ON wset.exercise_id = e.exercise_id
JOIN WorkoutSession ws ON wset.session_id = ws.session_id
JOIN User u ON ws.user_id = u.user_id
WHERE (wset.weight > 150 AND wset.reps >= 5)
   OR (e.category = 'Legs');



-- Query 5: CASE/WHEN
-- Classify each personal record as Beginner, Intermediate,
-- or Advanced based on max weight lifted

SELECT 
    u.username,
    e.name AS exercise,
    pr.max_weight,
    CASE
        WHEN pr.max_weight < 100 THEN 'Beginner'
        WHEN pr.max_weight BETWEEN 100 AND 200 THEN 'Intermediate'
        ELSE 'Advanced'
    END AS level
FROM PersonalRecord pr
JOIN User u ON pr.user_id = u.user_id
JOIN Exercise e ON pr.exercise_id = e.exercise_id
ORDER BY pr.max_weight DESC;
