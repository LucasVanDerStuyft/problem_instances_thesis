#!/bin/bash
#to use this script, you need to be in the metavrp-toolkit directory

analyze_problem() {
  local problem_file="$1"
  local subdirectory="$2"

  echo "  ./run-cli.sh local analyze -i $subdirectory / $problem_file -t all"
  ./run-cli.sh local analyze -i "${subdirectory}/${problem_file}" -t all
}

process_problems() {
  local subdirectory="$1"
  local type="$2"
  local output_directory="$3"

  for problem_file in "$subdirectory"/*.json; do
          if [ -f "$problem_file" ]; then
              #execute_command "$(basename "$problem_file")" "$solver1" "$output_directory" "$subdirectory" "$abbrev1"
              analyze_problem "$(basename "$problem_file")" "$subdirectory"
          fi
      done

}

arg1=$1
process_problems "cli/etc/demoproblems/solutions/$arg1/" "$arg1"