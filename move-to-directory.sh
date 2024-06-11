#!/bin/bash
mv main.sh students-list_1023.txt select-emails.sh student-emails.txt negpod_2-q1/

FILE="students-list_1023.txt"

function display_menu {
    clear
    echo "***********************************************"
    echo "************ Welcome to our App ***************"
    echo "***********************************************"
    echo
    echo "What would you like to do today?"
    echo
    echo "+----------------------------------------------+"
    echo "|                  Main Menu                   |"
    echo "+----------------------------------------------+"
    echo "| 1. Add New Student                           |"
    echo "| 2. View All Students                         |"
    echo "| 3. Update Student                            |"
    echo "| 4. Delete Student                            |"
    echo "| 5. Save Student Emails Sorted in ASC         |"
    echo "| 6. View All Emails Only in ASC Order         |"
    echo "| 7. Backup your data                          |"
    echo "| 8. Exit                                      |"
    echo "+----------------------------------------------+"
    echo
    echo -n "Enter your choice (1-8): "
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

function view_sorted_emails {
    if [ ! -f $FILE ]; then
        echo "No student records found."
    else
        cut -d',' -f1 $FILE | sort
    fi
}

function backup_data {
    ./backup-Negpod_2.sh
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
        6) view_sorted_emails ;;
        7) backup_data ;;
        8) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice, please try again." ;;
    esac
    echo -n "Press Enter to continue..."
    read
done

