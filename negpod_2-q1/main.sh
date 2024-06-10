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

# Function to delete a student record by ID
delete_student() {
    echo "Enter student ID to delete:"
    read id

    if [ -f "$FILE" ]; then
        grep -v ", $id$" $FILE > temp.txt
        mv temp.txt $FILE
        echo "Student record deleted."
    else
        echo "No student records found."
    fi
}

# Function to update a student record by ID
update_student() {
    echo "Enter student ID to update:"
    read id

    if [ -f "$FILE" ]; then
        grep -v ", $id$" $FILE > temp.txt
        mv temp.txt $FILE
        echo "Enter new student email:"
        read new_email
        echo "Enter new student age:"
        read new_age

        echo "$new_email, $new_age, $id" >> $FILE
        echo "Student record updated."
    else
        echo "No student records found."
 
   fi
}

# Function to sort student emails and save them to a file
sort_student_emails() {
    if [ -f "$FILE" ]; then
        grep -o '^[^,]*' $FILE | sort > student-emails.txt
        echo "Student emails sorted and saved to student-emails.txt."
    else
        echo "No student records found."
    fi
}

# Main menu loop
while true; do
    echo "========================"
    echo "ALU Registration System"
    echo "========================"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Sort student emails"
    echo "6. Exit"
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1)
            create_student
            ;;
        2)
            view_students
            ;;
        3)
            delete_student
            ;;
        4)
            update_student
            ;;
        5)
            sort_student_emails
            ;;
        6)
            echo "Exiting application."
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

