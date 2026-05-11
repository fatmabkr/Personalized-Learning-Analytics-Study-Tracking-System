# Personalized Learning Analytics & Study Tracking System
## Group Members
- Selin ERDOĞAN
- Fatma BAKIR

## Project Description

Personalized Learning Analytics & Study Tracking System is a database-based desktop application designed to help students improve their study habits through data-driven insights.

The system allows students to track their study sessions, record quiz results, set academic goals, and receive personalized recommendations. Advisors can monitor student progress, manage student data, view quiz results, and send recommendations to students.

The main purpose of the project is to centralize study-related data such as study duration, quiz performance, productivity patterns, and goals in a relational database. This makes it easier to analyze students’ learning behavior and provide meaningful feedback.

## System Objectives

The main objectives of the system are:

- To help students track their study time using a focus timer
- To record quiz scores and observe academic progress over time
- To compare target study hours with actual study hours
- To identify productive study periods
- To provide personalized study recommendations
- To allow advisors to monitor students and support them with data-backed feedback

These objectives are based on the project’s requirement analysis, which defines the system as a learning analytics and study tracking platform for students and advisors. :contentReference[oaicite:0]{index=0}

## User Types

### Student

Students can:

- Log in to the system
- Track study sessions
- Use a focus timer
- Save quiz results
- Set study goals
- View progress charts
- See personalized recommendations
- Manage weekly study schedules

### Advisor

Advisors can:

- Log in to the advisor panel
- View assigned students
- Monitor students’ quiz results
- Manage student information
- View and edit student schedules
- Send recommendations to students
- Manage subject definitions

## Problems Solved by the System

The system focuses on solving common study tracking problems:

- Scattered and unorganized study data
- Inaccurate time tracking
- Poor study scheduling
- Lack of quiz progress tracking
- Vague and non-measurable goals
- Lack of personalized study guidance

Instead of keeping study data in different notebooks or applications, this system stores all important information in one relational database. This makes long-term analysis easier and more reliable.

## Database Entities

The main entities used in the project are:

- `STUDENT`
- `ADVISOR`
- `SUBJECT`
- `STUDY_SESSIONS`
- `QUIZ_RECORDS`
- `GOALS`
- `INSIGHT_RECORDS`

The database design includes strong entities, primary keys, foreign keys, one-to-many relationships, and a weak entity structure for insight records. :contentReference[oaicite:1]{index=1}

## Main Relationships

The system uses the following main relationships:

- One advisor can advise many students.
- One advisor can create many subjects.
- One student can have many study sessions.
- One student can have many quiz records.
- One student can set many goals.
- One student can receive many insight records.
- One subject can be connected to many study sessions, quiz records, and goals.

## Application Features

### Main Login Screen

The application starts with a login screen that provides two different login options:

- Student Login
- Advisor Login

Each user type is redirected to its own interface after successful authentication.

### Student Dashboard

The student dashboard displays:

- Subject-based productivity report
- Weekly focus goal status
- Question goal completion status
- Targeted vs. actual study hour chart
- Overall goal completion progress

### Quiz Results

Students can:

- View previous quiz results
- Add new quiz scores
- Update existing quiz records
- Delete quiz records
- Filter results by subject
- Analyze score progress over time

### Focus Timer / Study Session

Students can:

- Select a subject
- Start and stop a study timer
- Save the completed study session
- View previous sessions
- Filter sessions by subject
- Delete study sessions

### My Goals & Progress

Students can:

- Set target study hours
- Set target quiz scores
- Track completion status
- Add, update, and delete goals

### Weekly Study Schedule

Students can manage a weekly timetable by adding subject blocks to specific days and hours.

### Recommendations

Students can view personalized recommendations sent by advisors or generated based on study data.

### Advisor Dashboard

Advisors can:

- View total student count
- View assigned subject count
- Manage mentor notes
- Track student progress

### Student Management

Advisors can:

- View student list
- Add new students
- Update student information
- Delete students
- Open student detail panels

### Student Schedule Management

Advisors can view and edit the weekly schedule of selected students.

### Student Quiz Results View

Advisors can view students’ quiz scores by subject, score, and date.

### Send Recommendation

Advisors can send personalized recommendation messages to selected students.

### Subject Definitions

Advisors can view defined subjects with subject ID, name, and category.

The application interface section of the report describes both student-side and advisor-side functions in detail. :contentReference[oaicite:2]{index=2}

## Technologies Used

- Java
- JavaFX
- MySQL
- SQL
- JDBC
- Relational Database Design
- E/R Diagram
- Mockaroo for dummy data generation

## Database Concepts Used

- Requirement analysis
- Entity-Relationship diagram
- Relational database schema
- Primary keys
- Foreign keys
- One-to-many relationships
- Weak entity
- Total participation
- SQL constraints
- CRUD operations
- Advanced SQL queries
- JOIN operations
- Aggregate functions

## Advanced Queries

The project includes advanced SQL queries for:

- Calculating total targeted study hours by subject
- Retrieving daytime study sessions within a date range
- Inserting academic goals
- Listing personalized recommendations
- Saving completed study sessions dynamically

These queries use SQL features such as `INNER JOIN`, `SUM()`, `HOUR()`, `ORDER BY`, nested subqueries, `CURDATE()`, `CURTIME()`, and `ADDTIME()`.

## Challenges and Improvements

During the project, several challenges were encountered:

### 1. Data Population with Mockaroo

Mockaroo was used to generate more than 5,000 records. Maintaining correct foreign key values across related tables was challenging, so the data was generated in dependency order and mismatched values were fixed manually.

### 2. Avoiding Data Redundancy

At first, some subject information was stored in multiple tables. This caused redundancy and possible inconsistency. The issue was solved by keeping subject details only in the `SUBJECT` table and referencing them with `SubjectID`.

### 3. Shared Schedule Between Advisor and Student

The advisor needed to edit a student’s schedule and have the change reflected in the student interface. This was solved by using a shared table queried by both dashboards.

These challenges and solutions are explained in the project report’s challenges and improvements section. :contentReference[oaicite:3]{index=3}

## How to Run the Project

1. Clone or download the project folder.
2. Open the project in a Java-supported IDE.
3. Make sure MySQL is installed and running.
4. Create the required database and tables using the SQL scripts.
5. Update database connection information if necessary.
6. Run the main JavaFX application file.
7. Log in as either a student or advisor.

## Conclusion

This project provided practical experience in requirement analysis, E/R diagram design, relational schema conversion, SQL query writing, and JavaFX application development. It also showed how database systems can be used to solve real-life problems such as study tracking, academic progress monitoring, and personalized learning support.

## AI Use Statement

AI tools were used as supplementary support during the project. They helped with code review, proofreading, debugging, JavaFX learning, SQL query checking, and dummy data generation. The core project design and development were completed by the group members.
