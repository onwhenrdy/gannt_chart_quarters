# *******************************************************************
# Project: GANTT Chart for Quarters
# Script purpose: Create a GANTT Chart with Milestones
# Date: 03-12-2023
# Author: Dominik Selzer (dominik.selzer@uni-saarland.de)
# *******************************************************************

source("gantt_graph_code.R")
library(readxl)
library(dplyr)
library(lubridate)

# Settings ----
# *******************************************************************
def_file <- "gantt_source.xlsx"
quarter_dates <- TRUE         # are the dates in the cheet in quarters
show_wp <- TRUE               # show the WP as seperate entry
concat_wp_activity <- FALSE   # concatenate wp and activity to one entry
concat_char <- ": "           # concatenation char for wp and activity
add_milestones <- TRUE        # if milestones should be added
year_prefix <- "Year "        # Prefix for years in the header
chart_file <- "gantt.png"     # chart output file
chart_width <- 16             # chart width in cm
chart_height <- 6             # chart height in cm
size_wp <- 6                  # size of wp elements (y axis)  ; default: 6
size_activity <- 6            # size of activity elements (y axis) ; default: 4

# Definitions ----
# *******************************************************************
timeline <- read_xlsx(def_file, sheet = "Timeline")
if (quarter_dates) {
  timeline <- timeline %>% mutate(start_date = ifelse(start_date == 1, 1, start_date * 3 - 2))
  timeline <- timeline %>% mutate(end_date = end_date * 3)
}

if (concat_wp_activity) {
  timeline <- timeline %>% mutate(activity = paste0(wp, concat_char, activity))
  timeline$wp <- timeline$color
}


# Milestones ----
# *******************************************************************
milestones <- NULL
if (add_milestones) {
  milestones <- read_xlsx(def_file, sheet = "Milestones")
  if (quarter_dates) {
    milestones <- milestones %>% mutate(spot_date = spot_date * 3 - 1)
  }

  if (concat_wp_activity) {
    milestones <- milestones %>% mutate(activity = paste0(wp, concat_char, activity))
  }
}


# Create Chart ----
# *******************************************************************
chart <- gantt_chart_quarters(timeline,
                              colour_palette = create_gantt_palette(c("red", "blue", "green", "yellow", "red")),
                              spots = milestones,
                              size_activity = size_activity,
                              year_prefix = year_prefix,
                              y_axis_text_align = "left",
                              hide_wp  = !show_wp,
                              mark_years = TRUE,
                              alpha_activity = 0.8,
                              size_text_relative = 1.3,
                              month_date_label = FALSE)


# Save Chart ----
# *******************************************************************
ggplot2::ggsave(chart_file,
                chart,
                width = chart_width * 2,
                height = chart_height * 2,
                units = "cm",
                bg = "white",
                dpi = 600)

