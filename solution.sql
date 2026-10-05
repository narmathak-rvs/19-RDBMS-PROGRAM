-- Question 19:
-- Create a cursor to fetch StudentID, StudentName, and DepartmentID
-- from the Student table and display the records.

SET SERVEROUTPUT ON;

CREATE TABLE Student (
    StudentID NUMBER(5) PRIMARY KEY,
    StudentName VARCHAR2(20) NOT NULL,
    DOB DATE,
    Gender VARCHAR2(10),
    DepartmentID NUMBER(5)
);

INSERT INTO Student VALUES
(1001, 'Arun', DATE '2005-06-15', 'Male', 101);

INSERT INTO Student VALUES
(1002, 'Divya', DATE '2005-08-20', 'Female', 102);

INSERT INTO Student VALUES
(1003, 'Karthik', DATE '2004-11-10', 'Male', 101);

INSERT INTO Student VALUES
(1004, 'Nisha', DATE '2005-03-25', 'Female', 103);

COMMIT;

DECLARE
    CURSOR student_cursor IS
        SELECT StudentID, StudentName, DepartmentID
        FROM Student;

    v_StudentID    Student.StudentID%TYPE;
    v_StudentName  Student.StudentName%TYPE;
    v_DepartmentID Student.DepartmentID%TYPE;
BEGIN
    OPEN student_cursor;

    LOOP
        FETCH student_cursor
        INTO v_StudentID, v_StudentName, v_DepartmentID;

        EXIT WHEN student_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'StudentID: ' || v_StudentID ||
            ', StudentName: ' || v_StudentName ||
            ', DepartmentID: ' || v_DepartmentID
        );
    END LOOP;

    CLOSE student_cursor;
END;
/
