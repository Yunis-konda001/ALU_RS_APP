#!/bin/bash

FILE="students-list_1023.txt"

function display_menu {
    clear
    echo "=-------------------------------="
    echo "    ALU Registration System      "
    echo "=-------------------------------="
    echo "1. Add New Students"
    echo "2. View All Students"
    echo "3. Update Student"
    echo "4. Delete Student"
    echo "5. Sort Student Emails"
    echo "6. Exit"
    echo -n "Enter your choice: "
}

function add_student {
    echo -n "Enter student email: "
    read email
    echo -n "Enter student age: "
    read age
    echo -n "Enter student ID: "
    read id
    echo "$email, $age, $id" >> $FILE
    echo "Student record added."
}

function view_students {
    if [ ! -f $FILE ]; then
        echo "No student records found."
    else
        cat $FILE
    fi
}

function update_student {
    echo -n "Enter student ID to update: "
    read id
    if grep -q ", $id$" $FILE; then
        grep -v ", $id$" $FILE > temp.txt
        mv temp.txt $FILE
        echo -n "Enter new student email: "
        read email
        echo -n "Enter new student age: "
        read age
        echo "$email, $age, $id" >> $FILE
        echo "Student record updated."
    else
        echo "Student ID not found."
    fi
}

function delete_student {
    echo -n "Enter student ID to delete: "
    read id
    if grep -q ", $id$" $FILE; then
        grep -v ", $id$" $FILE > temp.txt
        mv temp.txt $FILE
        echo "Student record deleted."
    else
        echo "Student ID not found."
    fi
}

function save_sorted_emails {
    if [ ! -f $FILE ]; then
        echo "No student records found."
    else
        cut -d',' -f1 $FILE | sort > student-emails.txt
        echo "Student emails saved to student-emails.txt."
    fi
}


while true; do
    display_menu
    read choice
    case $choice in
        1) add_student ;;
        2) view_students ;;
        3) update_student ;;
        4) delete_student ;;
        5) save_sorted_emails ;;
        6) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice, please try again." ;;
    esac
    echo -n "Press Enter to continue..."
    read
done

