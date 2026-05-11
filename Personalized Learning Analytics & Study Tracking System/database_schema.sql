
-- PART 1: TABLE CREATION (DATA DEFINITION LANGUAGE - DDL)

-- ADVISOR Table: Stores information about instructors or advisors who monitor student progress.
CREATE TABLE ADVISOR (
    AdvisorID INT PRIMARY KEY,
    AD_FullName VARCHAR(100) NOT NULL,
    AD_Email VARCHAR(100) UNIQUE NOT NULL,
    AD_Password VARCHAR(100) NOT NULL
);

-- STUDENT Table: Stores the main users of the system. Includes a foreign key linking them to an Advisor.
CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY,
    AdvisorID INT,
    ST_FullName VARCHAR(100) NOT NULL,
    ST_Email VARCHAR(100) UNIQUE NOT NULL,
    RegistrationDate DATE,
    ST_Password VARCHAR(100) NOT NULL,
    FOREIGN KEY (AdvisorID) REFERENCES ADVISOR(AdvisorID) ON DELETE SET NULL
);

-- SUBJECT Table: Stores the courses/topics students are studying. Created by an Advisor.
CREATE TABLE SUBJECT (
    SubjectID INT PRIMARY KEY,
    AdvisorID INT,
    SubjectName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    DifficultyLevel INT,
    FOREIGN KEY (AdvisorID) REFERENCES ADVISOR(AdvisorID) ON DELETE SET NULL
);

-- STUDY_SESSIONS Table: Records the focus timer logs for each student per subject.
CREATE TABLE STUDY_SESSIONS (
    SessionID INT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    StartTime TIME,
    EndTime TIME,
    SessionDate DATE,
    FocusLevel INT,
    SessionNote TEXT,
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (SubjectID) REFERENCES SUBJECT(SubjectID) ON DELETE CASCADE
);

-- QUIZ_RECORDS Table: Stores the quiz performance data to track academic improvement.
CREATE TABLE QUIZ_RECORDS (
    QuizID INT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    Score DECIMAL(5,2),
    MaxScore DECIMAL(5,2),
    MinScore DECIMAL(5,2),
    QuizDate DATE,
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (SubjectID) REFERENCES SUBJECT(SubjectID) ON DELETE CASCADE
);

-- GOALS Table: Allows students to set measurable weekly targets for study hours and quiz scores.
CREATE TABLE GOALS (
    GoalID INT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    WeekStartDate DATE,
    TargetStudyHours DECIMAL(5,2),
    TargetQuizScore DECIMAL(5,2),
    EndDate DATE,
    IsCompleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (SubjectID) REFERENCES SUBJECT(SubjectID) ON DELETE CASCADE
);

-- INSIGHT_RECORDS Table (Weak Entity): Stores system-generated productivity patterns and recommendations for a specific student.
CREATE TABLE INSIGHT_RECORDS (
    RecommendationID INT PRIMARY KEY,
    StudentID INT,
    RecommendationText TEXT,
    RecommendationType VARCHAR(50),
    GeneratedDate DATETIME,
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID) ON DELETE CASCADE
);


-- PART 2: DATA INSERTION (DATA MANIPULATION LANGUAGE - DML)

-- Inserting sample Advisors (Rehber Öğretmenler)
INSERT INTO ADVISOR (AdvisorID, AD_FullName, AD_Email, AD_Password) VALUES
(1, 'Hakan Aydın', 'hakan.hoca@rehberlik.com', 'hkn_pass123'),
(2, 'Elif Şahin', 'elif.hoca@rehberlik.com', 'elf_pass456');

-- Inserting sample Students (YKS Öğrencileri)
INSERT INTO STUDENT (StudentID, AdvisorID, ST_FullName, ST_Email, RegistrationDate, ST_Password) VALUES
(101, 1, 'Deniz Yılmaz', 'deniz.yilmaz@yks2026.com', '2026-01-10', 'dnz_yks26'),
(102, 2, 'Mert Kaya', 'mert.kaya@yks2026.com', '2026-01-15', 'mrt_hedef10K');

-- Inserting sample Subjects (TYT/AYT Dersleri)
INSERT INTO SUBJECT (SubjectID, AdvisorID, SubjectName, Category, DifficultyLevel) VALUES
(201, 1, 'TYT Türkçe', 'Sözel', 3),
(202, 1, 'TYT Matematik', 'Sayısal', 4),
(203, 2, 'AYT Matematik', 'Sayısal', 5),
(204, 2, 'AYT Fizik', 'Sayısal', 5);

-- Inserting sample Study Sessions (Çalışma Seansları ve Öğrenci Notları)
INSERT INTO STUDY_SESSIONS (SessionID, StudentID, SubjectID, StartTime, EndTime, SessionDate, FocusLevel, SessionNote) VALUES
(301, 101, 201, '09:00:00', '10:30:00', '2026-04-01', 8, 'Paragraf rutin testleri çözüldü, dil bilgisi ses olayları tekrarı yapıldı.'),
(302, 101, 203, '14:00:00', '16:00:00', '2026-04-02', 9, 'Türev alma kuralları fasikülü bitirildi, çok verimliydi.'),
(303, 102, 202, '10:00:00', '12:30:00', '2026-04-03', 7, 'Problemler denemesi çözüldü, hız problemlerinde hala zaman kaybediyorum.');

-- Inserting sample Quiz Records (Deneme Sınavı Netleri - 40 Soru Üzerinden)
INSERT INTO QUIZ_RECORDS (QuizID, StudentID, SubjectID, Score, MaxScore, MinScore, QuizDate) VALUES
(401, 101, 201, 32.50, 40.00, 0.00, '2026-04-03'),
(405, 101, 203, 33.50, 50.00, 0.00, '2026-04-03'),
(407, 101, 201, 32.50, 40.00, 0.00, '2026-04-03'),
(406, 101, 204, 23.50, 60.00, 0.00, '2026-04-03'),
(402, 102, 202, 25.25, 40.00, 0.00, '2026-04-04');

-- Inserting sample Goals (Haftalık TYT/AYT Hedefleri)
INSERT INTO GOALS (GoalID, StudentID, SubjectID, WeekStartDate, TargetStudyHours, TargetQuizScore, EndDate, IsCompleted) VALUES
(501, 101, 203, '2026-03-30', 12.00, 35.00, '2026-04-05', TRUE),
(502, 102, 204, '2026-03-30', 10.00, 10.00, '2026-04-05', FALSE);

-- Inserting sample Insight Records (Sistem Tarafından Üretilen YKS Tavsiyeleri)
INSERT INTO INSIGHT_RECORDS (RecommendationID, StudentID, RecommendationText, RecommendationType, GeneratedDate) VALUES
(601, 101, 'AYT Matematik çalışmalarında öğleden sonraları çok daha yüksek odaklanma (Focus Seviyesi: 9) gösteriyorsun. Limit ve Türev gibi zor konuları sabah yerine bu saatlere alarak verimini artırabilirsin.', 'Öğleden Sonra Yüksek Verim', '2026-04-04 18:30:00');