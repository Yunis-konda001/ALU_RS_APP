#!/bin/bash

FILE="students-list_1023.txt"

# Function to create a student record
create_student() {
    echo "Enter student email:"
    read email
    echo "Enter student age:"
    read age
    echo "Enter student ID:"
    read id

    echo "$email, $age, $id" >> $FILE
    echo "Student record created."
}

# Function to view all students
view_students() {
    if [ -f "$FILE" ]; then
        cat $FILE
    else
        echo "No student records found."
    fi
}
