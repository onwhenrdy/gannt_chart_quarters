# gantt_chart_quarters
R code with an example to create Gantt Charts with Quarters.

## Source

Based on [ganttrify](https://github.com/giocomai/ganttrify/) by [giocomai](https://github.com/giocomai) and a modification by [dmkaplan2000](https://github.com/dmkaplan2000) (see [Issue](https://github.com/giocomai/ganttrify/issues/40)).

# How to use

This is **not a package**. The provided code and example sheet should be self-explanatory.
You can easily download the files to the current working directory (using [usethis](https://usethis.r-lib.org/)) via
```R
usethis::use_zip("https://github.com/onwhenrdy/gantt_chart_quarters/archive/master.zip", destdir = "./", cleanup = TRUE)
```

# Files
```R
gantt_chart.R      # Code example that sources gannt_graph_code.R
gantt_graph_code.R # Code for the creation of the Gantt chart
gantt_source.xlsx  # Gantt WP/Activity & Milestone definitions (example)
```

# Example output
Using the following settings with German "year" spelling and perfect fit for DIN A4.
```R
# Settings ----
# *******************************************************************
def_file <- "gantt_source.xlsx"
quarter_dates <- TRUE         # are the dates in the cheet in quarters
show_wp <- FALSE              # show the WP as seperate entry
concat_wp_activity <- TRUE    # concatenate wp and activity to one entry
concat_char <- ": "           # concatenation char for wp and activity
add_milestones <- TRUE        # if milestones should be added
year_prefix <- "Jahr "        # Prefix for years in the header
chart_file <- "gantt.png"     # chart output file
chart_width <- 16             # chart width in cm
chart_height <- 6             # chart height in cm
size_wp <- 6                  # size of wp elements (y axis)  ; default: 6
size_activity <- 6            # size of activity elements (y axis) ; default: 4
```
![](gantt.png)
