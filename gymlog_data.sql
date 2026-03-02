-- GymLog Test Data

-- Users
INSERT INTO User (username, email, created_at) VALUES
('daniel_k', 'daniel@gmail.com', '2024-01-10'),
('mike_t', 'mike@gmail.com', '2024-01-15'),
('sarah_j', 'sarah@gmail.com', '2024-02-01'),
('alex_r', 'alex@gmail.com', '2024-02-10'),
('jordan_m', 'jordan@gmail.com', '2024-03-01');

-- Exercises
INSERT INTO Exercise (name, description, category) VALUES
('Bench Press', 'Barbell press on flat bench', 'Push'),
('Squat', 'Barbell back squat', 'Legs'),
('Deadlift', 'Conventional barbell deadlift', 'Pull'),
('Pull Up', 'Bodyweight pull up', 'Pull'),
('Overhead Press', 'Standing barbell press', 'Push'),
('Barbell Row', 'Bent over barbell row', 'Pull'),
('Leg Press', 'Machine leg press', 'Legs');

-- Muscle Groups
INSERT INTO MuscleGroup (name, body_region) VALUES
('Chest', 'Upper Body'),
('Quadriceps', 'Lower Body'),
('Hamstrings', 'Lower Body'),
('Back', 'Upper Body'),
('Shoulders', 'Upper Body'),
('Biceps', 'Upper Body'),
('Triceps', 'Upper Body');

-- ExerciseMuscle (which exercises target which muscle groups)
INSERT INTO ExerciseMuscle (exercise_id, muscle_group_id) VALUES
(1, 1), -- Bench Press -> Chest
(1, 7), -- Bench Press -> Triceps
(2, 2), -- Squat -> Quads
(2, 3), -- Squat -> Hamstrings
(3, 4), -- Deadlift -> Back
(3, 3), -- Deadlift -> Hamstrings
(4, 4), -- Pull Up -> Back
(4, 6), -- Pull Up -> Biceps
(5, 5), -- Overhead Press -> Shoulders
(5, 7), -- Overhead Press -> Triceps
(6, 4), -- Barbell Row -> Back
(6, 6), -- Barbell Row -> Biceps
(7, 2), -- Leg Press -> Quads
(7, 3); -- Leg Press -> Hamstrings

-- Workout Sessions
INSERT INTO WorkoutSession (user_id, session_date, duration, notes) VALUES
(1, '2024-03-01', 60, 'Good push day'),
(1, '2024-03-03', 75, 'Legs felt heavy'),
(2, '2024-03-02', 50, 'Quick pull session'),
(3, '2024-03-04', 90, 'Full body day'),
(1, '2024-03-06', 65, 'New bench PR attempt'),
(2, '2024-03-05', 55, 'Back and biceps'),
(4, '2024-03-07', 70, 'First session'),
(5, '2024-03-08', 80, 'Heavy leg day');

-- Workout Sets
INSERT INTO WorkoutSet (session_id, exercise_id, reps, weight, set_order) VALUES
(1, 1, 8, 135, 1), -- Session 1: Bench Press
(1, 1, 6, 145, 2),
(1, 1, 5, 155, 3),
(1, 5, 10, 95, 4), -- Session 1: OHP
(1, 5, 8, 105, 5),
(2, 2, 5, 225, 1), -- Session 2: Squat
(2, 2, 5, 235, 2),
(2, 7, 10, 270, 3), -- Session 2: Leg Press
(2, 7, 10, 290, 4),
(3, 3, 5, 185, 1), -- Session 3: Deadlift
(3, 4, 8, 0, 2),   -- Session 3: Pull Up (bodyweight)
(4, 1, 8, 115, 1),
(4, 2, 8, 185, 2),
(4, 3, 5, 175, 3),
(5, 1, 3, 165, 1), -- Session 5: PR attempt
(5, 1, 1, 175, 2),
(6, 6, 8, 135, 1),
(6, 4, 6, 0, 2),
(7, 2, 5, 205, 1),
(8, 2, 8, 175, 1),
(8, 7, 12, 310, 2);

-- Personal Records
INSERT INTO PersonalRecord (user_id, exercise_id, max_weight, achieved_date) VALUES
(1, 1, 175, '2024-03-06'), -- daniel bench PR
(1, 2, 235, '2024-03-03'), -- daniel squat PR
(2, 3, 185, '2024-03-02'), -- mike deadlift PR
(3, 1, 115, '2024-03-04'), -- sarah bench PR
(4, 2, 205, '2024-03-07'), -- alex squat PR
(5, 7, 310, '2024-03-08'); -- jordan leg press PR
