#to use this script, you need to be in the metavrp-toolkit directory

type="TW"
abbrev="TW"

declare -a job_ids
submit_all(){
  declare -a outputs


  echo "100_5" ; \
  outputs[0]=$(./run-cli.sh local submit-problem -s solvicevrp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel100_5_100_${abbrev}.json) ; \
  echo "100_10" ; \
  outputs[1]=$(./run-cli.sh local submit-problem -s solvicevrp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel100_10_100_${abbrev}.json)  ; \
  echo "waiting" ; sleep 60s ; echo "100_20" ; \
  outputs[2]=$(./run-cli.sh local submit-problem -s solvicevrp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel100_20_100_${abbrev}.json) ; \
  echo "waiting" ; sleep 60s ; echo "200_5" ;  \
  outputs[3]=$(./run-cli.sh local submit-problem -s solvicevrp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel200_5_200_${abbrev}.json) ; \
  echo "200_10" ; \
  outputs[4]=$(./run-cli.sh local submit-problem -s solvicevrp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel200_10_200_${abbrev}.json) ; \
  echo "waiting" ; sleep 60s ; echo "200_20" ;  \
  outputs[5]=$(./run-cli.sh local submit-problem -s solvicevrp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel200_20_200_${abbrev}.json) ; \
  echo "waiting" ; sleep 60s ; echo "500_5" ; \
  outputs[6]=$(./run-cli.sh local submit-problem -s solvicevrp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel500_5_500_${abbrev}.json) ; \
  echo "waiting" ; sleep 60s ; echo "500_10" ; \
  outputs[7]=$(./run-cli.sh local submit-problem -s solvicevrp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel500_10_500_${abbrev}.json) ; \
  echo "waiting" ; sleep 60s ; echo "500_20" ; \
  outputs[8]=$(./run-cli.sh local submit-problem -s solvicevrp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel500_20_500_${abbrev}.json) ; \



  for output in "${outputs[@]}"; do
      job_id=$(echo "$output" | grep -oE 'Job posted with id [[:alnum:]-]+' | awk '{print $NF}')
      echo "$job_id"
      job_ids+=("$job_id")

    done
    echo "waiting to let everything process " ; sleep 120s
    poll_all

}

poll_all(){
  for id in "${job_ids[@]}"; do
      ./run-cli.sh local poll -s solvicevrp -i "${id}"
    done

    get_all
}

get_all(){
  ./run-cli.sh local get-solution -s solvicevrp -i "${job_ids[0]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel100_5_100_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel100_5_100_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicevrp -i "${job_ids[1]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel100_10_100_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel100_10_100_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicevrp -i "${job_ids[2]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel100_20_100_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel100_20_100_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicevrp -i "${job_ids[3]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel200_5_200_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel200_5_200_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicevrp -i "${job_ids[4]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel200_10_200_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel200_10_200_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicevrp -i "${job_ids[5]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel200_20_200_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel200_20_200_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicevrp -i "${job_ids[6]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel500_5_500_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel500_5_500_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicevrp -i "${job_ids[7]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel500_10_500_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel500_10_500_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicevrp -i "${job_ids[8]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel500_20_500_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel500_20_500_${abbrev}-SLV.gpx

}

submit_all