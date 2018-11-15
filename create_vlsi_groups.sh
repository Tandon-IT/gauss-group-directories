#!/bin/bash
# INPUTS
GROUP_LIST=vlsi_groups_semYear.csv
SEMESTER=semYear
PDK=/etc/skel/freepdk45_semYear

# create group name
while IFS= read -r line; do
        NUM=$(echo $line | cut -d',' -f1 --output-delimiter=" ")
        MEMBERS=$(echo $line | cut -d',' -f1- --output-delimiter=" " | ./get_netids.py)
    curr_group="${SEMESTER}_group${NUM}"
    group_name="group${NUM}"

    echo "Creating group $curr_group"
    groupadd $curr_group

    for i in $MEMBERS
    do
        echo "adding $i to $curr_group"
        usermod -aG $curr_group $i
    done

    echo "Creating group directory /projects/$SEMESTER/$group_name"
    mkdir -p /projects/$SEMESTER/$group_name

    echo "Setting permission root:$curr_group"
    chown -R root:$curr_group /projects/$SEMESTER/$group_name
    chmod g+s /projects/$SEMESTER/$group_name
    chmod -R 770 /projects/$SEMESTER/$group_name

    for i in $MEMBERS
    do
        echo "creating sym link /home/$i/$curr_group -> /projects/$SEMESTER/$group_name"
        ln -sT /projects/$SEMESTER/$group_name /home/$i/$curr_group
        chown $i /home/$i/$curr_group
    done
    echo "Copy pdk to /projects/$SEMESTER/$group_name"
    cp -r $PDK /projects/$SEMESTER/$group_name
    echo -e "\n"
done < "$GROUP_LIST"
