#to use this script, you need to be in the metavrp-toolkit directory

type="SameAddresses"
abbrev="SameAddresses"

declare -a job_ids
submit_all(){
  declare -a outputs


  echo "5_1" ; \
  outputs[0]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmark5_1_5_${abbrev}.json) ; \
  echo "20_1" ; \
  outputs[1]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmark20_1_20_${abbrev}.json)  ; \
  echo "20_2" ; \
  outputs[2]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmark20_2_20_${abbrev}.json) ; \
  echo "20_4" ;  \
  outputs[3]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmark20_4_20_${abbrev}.json) ; \
  echo "50_1" ; \
  outputs[4]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmark50_1_50_${abbrev}.json) ; \
  echo "50_2" ; \
  outputs[5]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmark50_2_50_${abbrev}.json) ; \
  echo "50_4" ; \
  outputs[6]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmark50_4_50_${abbrev}.json) ; \
  echo "5_1" ; \
  outputs[7]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel5_1_5_${abbrev}.json) ; \
  echo "20_1" ; \
  outputs[8]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel20_1_20_${abbrev}.json)  ; \
  echo "20_2" ; \
  outputs[9]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel20_2_20_${abbrev}.json) ; \
  echo "20_4" ;  \
  outputs[10]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel20_4_20_${abbrev}.json) ; \
  echo "50_1" ; \
  outputs[11]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel50_1_50_${abbrev}.json) ; \
  echo "50_2" ; \
  outputs[12]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel50_2_50_${abbrev}.json) ; \
  echo "50_4" ; \
  outputs[13]=$(./run-cli.sh local submit-problem -s solvicepdp --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel50_4_50_${abbrev}.json) ; \

  for output in "${outputs[@]}"; do
      job_id=$(echo "$output" | grep -oE 'Job posted with id [[:alnum:]-]+' | awk '{print $NF}')
      echo "$job_id"
      job_ids+=("$job_id")

    done
    echo "waiting for 3 minutes" ; sleep 180s
    poll_all

}

poll_all(){
  for id in "${job_ids[@]}"; do
      ./run-cli.sh local poll -s solvicepdp -i "${id}"
    done

    get_all
}

get_all(){
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[0]}" -o cli/etc/demoproblems/solutions/${type}/benchmark5_1_5_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark5_1_5_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[1]}" -o cli/etc/demoproblems/solutions/${type}/benchmark20_1_20_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark20_1_20_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[2]}" -o cli/etc/demoproblems/solutions/${type}/benchmark20_2_20_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark20_2_20_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[3]}" -o cli/etc/demoproblems/solutions/${type}/benchmark20_4_20_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark20_4_20_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[4]}" -o cli/etc/demoproblems/solutions/${type}/benchmark50_1_50_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark50_1_50_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[5]}" -o cli/etc/demoproblems/solutions/${type}/benchmark50_2_50_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark50_2_50_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[6]}" -o cli/etc/demoproblems/solutions/${type}/benchmark50_4_50_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark50_4_50_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[7]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel5_1_5_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel5_1_5_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[8]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_1_20_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_1_20_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[9]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_2_20_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_2_20_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[10]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_4_20_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_4_20_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[11]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_1_50_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_1_50_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[12]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_2_50_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_2_50_${abbrev}-SLV.gpx
  ./run-cli.sh local get-solution -s solvicepdp -i "${job_ids[13]}" -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_4_50_${abbrev}-SLV.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_4_50_${abbrev}-SLV.gpx

}

submit_all