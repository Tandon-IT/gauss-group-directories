# gauss-group-directories

Tutorial on how to create group directories on gauss.

The scripts here are meant for very specefic input formats. Use caution when using this script with improperly formatted text files.

## inputs hardcoded in create_vlsi_groups.sh

semYear = "fall/spring" + "year" = fall18

* `GROUP_LIST=vlsi_groups_semYear.csv`
* `SEMESTER=semYear`
* `PDK=/etc/skel/freepdk45_semYear`

### create_vlsi_groups_semYear.sh format

```csv
1,Name(netid9),Name(netid6),Name(netid1),Name(netid3)
```

### get_netids.py

Returns all netids within paranthesis from standard input (ex. pipe) from the same group. Group members should be listed in a single line.

## Example Run

`sh create_vlsi_groups.sh`
