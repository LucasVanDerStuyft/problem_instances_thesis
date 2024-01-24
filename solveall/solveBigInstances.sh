#to use this script, you need to be in the metavrp-toolkit directory

type="Priority"
abbrev="Prio"

declare -a job_ids

submit_all(){
  declare -a outputs

  #echo "100_5" ; \
  #outputs[0]=$(./run-cli.sh local submit-problem -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark100_5_100_${abbrev}.json) ; \
  #echo "100_10" ; \
  #outputs[1]=$(./run-cli.sh local submit-problem -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark100_10_100_${abbrev}.json)  ; \
  #echo "100_20" ; \
  #outputs[2]=$(./run-cli.sh local submit-problem -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark100_20_100_${abbrev}.json) ; \
  #echo "waiting" ; sleep 60s ; echo "200_5" ;  \
  #outputs[3]=$(./run-cli.sh local submit-problem -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark200_5_200_${abbrev}.json) ; \
  #echo "200_10" ; \
  #outputs[4]=$(./run-cli.sh local submit-problem -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark200_10_200_${abbrev}.json) ; \
  #echo "waiting" ; sleep 60s ; echo "200_20" ; \
  #outputs[5]=$(./run-cli.sh local submit-problem -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark200_20_200_${abbrev}.json) ; \
  #echo "waiting" ; sleep 60s ; echo "500_5" ; \
  outputs[6]=$(./run-cli.sh local submit-problem -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark500_5_500_${abbrev}.json) ; \
  echo "waiting" ; sleep 60s ; echo "500_10" ; \
  outputs[7]=$(./run-cli.sh local submit-problem -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark500_10_500_${abbrev}.json) ; \
  echo "waiting" ; sleep 60s ; echo "500_20" ; \
  outputs[8]=$(./run-cli.sh local submit-problem -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark500_20_500_${abbrev}.json)

  for output in "${outputs[@]}"; do
    job_id=$(echo "$output" | grep -oE 'Job posted with id [[:alnum:]-]+' | awk '{print $NF}')
    echo "$job_id"
    job_ids+=("$job_id")

  done
  echo "sleeping for 1.5 minutes to let everything process"
  sleep 90s
  get_all
}

get_all(){
  #./run-cli.sh local get-solution -s graphhopper -i "${job_ids[0]}" -o cli/etc/demoproblems/solutions/${type}/benchmark100_5_100_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark100_5_100_${abbrev}-GH.gpx
  #./run-cli.sh local get-solution -s graphhopper -i "${job_ids[1]}" -o cli/etc/demoproblems/solutions/${type}/benchmark100_10_100_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark100_10_100_${abbrev}-GH.gpx
  #./run-cli.sh local get-solution -s graphhopper -i "${job_ids[2]}" -o cli/etc/demoproblems/solutions/${type}/benchmark100_20_100_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark100_20_100_${abbrev}-GH.gpx
  #./run-cli.sh local get-solution -s graphhopper -i "${job_ids[3]}" -o cli/etc/demoproblems/solutions/${type}/benchmark200_5_200_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark200_5_200_${abbrev}-GH.gpx
  #./run-cli.sh local get-solution -s graphhopper -i "${job_ids[4]}" -o cli/etc/demoproblems/solutions/${type}/benchmark200_10_200_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark200_10_200_${abbrev}-GH.gpx
  #./run-cli.sh local get-solution -s graphhopper -i "${job_ids[5]}" -o cli/etc/demoproblems/solutions/${type}/benchmark200_20_200_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark200_20_200_${abbrev}-GH.gpx
  ./run-cli.sh local get-solution -s graphhopper -i "${job_ids[0]}" -o cli/etc/demoproblems/solutions/${type}/benchmark500_5_500_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark500_5_500_${abbrev}-GH.gpx
  ./run-cli.sh local get-solution -s graphhopper -i "${job_ids[1]}" -o cli/etc/demoproblems/solutions/${type}/benchmark500_10_500_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark500_10_500_${abbrev}-GH.gpx
  ./run-cli.sh local get-solution -s graphhopper -i "${job_ids[2]}" -o cli/etc/demoproblems/solutions/${type}/benchmark500_20_500_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark500_20_500_${abbrev}-GH.gpx
}

submit_all