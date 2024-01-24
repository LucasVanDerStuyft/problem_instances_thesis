#to use this script, you need to be in the metavrp-toolkit directory

type="TW"
abbrev="TW"

: <<'COMMENT_BLOCK'
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark5_1_5_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmark5_1_5_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark5_1_5_${abbrev}-GH.gpx ; \
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark20_1_20_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmark20_1_20_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark20_1_20_${abbrev}-GH.gpx ; \
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark20_2_20_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmark20_2_20_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark20_2_20_${abbrev}-GH.gpx ; \
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark20_4_20_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmark20_4_20_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark20_4_20_${abbrev}-GH.gpx ; \
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark50_1_50_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmark50_1_50_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark50_1_50_${abbrev}-GH.gpx ; \
echo "sleeping for 65 seconds"
sleep 65s
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark50_2_50_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmark50_2_50_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark50_2_50_${abbrev}-GH.gpx ; \
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmark50_4_50_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmark50_4_50_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmark50_4_50_${abbrev}-GH.gpx
COMMENT_BLOCK
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel5_1_5_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel5_1_5_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel5_1_5_${abbrev}-GH.gpx ; \
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel20_1_20_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_1_20_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_1_20_${abbrev}-GH.gpx ; \
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel20_2_20_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_2_20_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_2_20_${abbrev}-GH.gpx ; \
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel20_4_20_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_4_20_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel20_4_20_${abbrev}-GH.gpx ; \
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel50_1_50_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_1_50_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_1_50_${abbrev}-GH.gpx ; \
echo "sleeping for 65 seconds"
sleep 65s
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel50_2_50_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_2_50_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_2_50_${abbrev}-GH.gpx ; \
./run-cli.sh local solve -s graphhopper --problem cli/etc/demoproblems/${type}_problems/benchmarkBrussel50_4_50_${abbrev}.json -o cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_4_50_${abbrev}-GH.json --gpx cli/etc/demoproblems/solutions/${type}/benchmarkBrussel50_4_50_${abbrev}-GH.gpx

