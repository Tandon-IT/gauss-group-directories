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
1,Name(ahb437),Name(tb2358),Name(sr5054),Name(vm1482)
```

### get_netids.py

Returns all netids within paranthesis from standard input (ex. pipe)

## Example Run

`sh create_vlsi_groups.sh`
