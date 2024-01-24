#!/bin/bash
#to use this script, you need to be in the metavrp-toolkit directory
# Specify the base directory path
base_directory="."

# Function to execute the command for a given problem file
execute_command() {
    local problem_file="$1"
    local solver="$2"
    local output_directory="$3"
    local subdirectory="$4"
    local abbrev="$5"

    local trimmed_problem_file="${problem_file%.json}"

    echo "./run-cli.sh local solve -s $solver --problem $subdirectory/$problem_file -o cli/etc/demoproblems/solutions/$output_directory/${trimmed_problem_file}-${abbrev}.json
    --gpx /cli/etc/demoproblems/solutions/$output_directory/${trimmed_problem_file}-${abbrev}.gpx"


    ./run-cli.sh local solve -s "$solver" \
      --problem "$subdirectory/$problem_file" \
      -o "$base_directory/cli/etc/demoproblems/solutions/$output_directory/${trimmed_problem_file}-${abbrev}.json" \
      --gpx "$base_directory/cli/etc/demoproblems/solutions/$output_directory/${trimmed_problem_file}-${abbrev}.gpx"
}

# Function to process problems in a given subdirectory
process_problems() {
    local subdirectory="$1"
    local solver1="graphhopper"
    local solver2="openrouteservice"
    local abbrev1="GH"
    local abbrev2="ORS"
    local output_directory="$2"  # Change this accordingly

    for problem_file in "$subdirectory"/*Brussel*.json; do
        if [ -f "$problem_file" ]; then
            #execute_command "$(basename "$problem_file")" "$solver1" "$output_directory" "$subdirectory" "$abbrev1"
            execute_command "$(basename "$problem_file")" "$solver2" "$output_directory" "$subdirectory" "$abbrev2"
        fi
    done
}
arg1=$1
# Process problems in open_route subdirectory
process_problems "cli/etc/demoproblems/$1_problems/" "$arg1"
