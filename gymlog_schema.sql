CREATE TABLE User (
    user_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    username    VARCHAR(50) NOT NULL UNIQUE,
    email       VARCHAR(100) NOT NULL UNIQUE,
    created_at  DATE NOT NULL DEFAULT (DATE('now'))
);

CREATE TABLE Exercise (
    exercise_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    name            VARCHAR(100) NOT NULL UNIQUE,
    description     VARCHAR(255),
    category        VARCHAR(50) NOT NULL
);

CREATE TABLE MuscleGroup (
    muscle_group_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name            VARCHAR(50) NOT NULL UNIQUE,
    body_region     VARCHAR(50) NOT NULL
);

CREATE TABLE ExerciseMuscle (
    exercise_id     INTEGER NOT NULL,
    muscle_group_id INTEGER NOT NULL,
    PRIMARY KEY (exercise_id, muscle_group_id),
    FOREIGN KEY (exercise_id) REFERENCES Exercise(exercise_id),
    FOREIGN KEY (muscle_group_id) REFERENCES MuscleGroup(muscle_group_id)
);

CREATE TABLE WorkoutSession (
    session_id      INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id         INTEGER NOT NULL,
    session_date    DATE NOT NULL DEFAULT (DATE('now')),
    duration        INTEGER,
    notes           VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE WorkoutSet (
    set_id      INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id  INTEGER NOT NULL,
    exercise_id INTEGER NOT NULL,
    reps        INTEGER NOT NULL,
    weight      REAL NOT NULL,
    set_order   INTEGER NOT NULL,
    FOREIGN KEY (session_id) REFERENCES WorkoutSession(session_id),
    FOREIGN KEY (exercise_id) REFERENCES Exercise(exercise_id)
);

CREATE TABLE PersonalRecord (
    pr_id           INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id         INTEGER NOT NULL,
    exercise_id     INTEGER NOT NULL,
    max_weight      REAL NOT NULL,
    achieved_date   DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (exercise_id) REFERENCES Exercise(exercise_id)
);
