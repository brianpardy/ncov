#!/usr/bin/env bash
set -e 
GISAID_SARSCOV2_IN=$1
GISAID_SARSCOV2_OUT=$2

if [[ ! -r "$GISAID_SARSCOV2_IN" ]]
then
	echo "$0: input $GISAID_SARSCOV2_IN not found"
	exit 1
fi

echo "Normalizing GISAID file $GISAID_SARSCOV2_IN to $GISAID_SARSCOV2_OUT"

# Remove leading 'BetaCoV' and 'BetaCov' from sequence names
# Remove embedded spaces in sequence names (Hong Kong sequences)
# Remove trailing |EPI_ISL_id|datestamp from sequence names
# Eliminate duplicate sequences (keep only the first seen)

cat $GISAID_SARSCOV2_IN | 
	sed 's/^>BetaCoV\//>/gi' |	# remove leading BetaCo[vV]
	sed 's/ //g' |			# remove embedded spaces
	sed 's/|.*$//' | 		# remove trailing metadata
	awk 'BEGIN{RS=">";FS="\n"}!x[$1]++{print ">"$0}' | # remove duplicates
	grep -v '^>*$' > $GISAID_SARSCOV2_OUT

exit 0
