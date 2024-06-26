#!/bin/bash

# define list of FENs and the correct solution
declare -A FENs
FENs["rn3rk1/1pq2p1p/p2p1bpB/3P4/P3Q3/2PB4/5PPP/2R1RK2"]="Qe8"
FENs["kbK5/pp6/1P6/8/8/8/8/R7"]="Ra6"
FENs["4k2r/1R3R2/p3p1pp/4b3/1BnNr3/8/P1P5/5K2"]="Rfe7+"
FENs["r4br1/3b1kpp/1q1P4/1pp1RP1N/p7/6Q1/PPB3PP/2KR4"]="Qg6+"
FENs["8/8/8/2P3R1/5B2/2rP1p2/p1P1PP2/RnQ1K2k"]="Qb2"
FENs["r2kqbnr/ppp1pppp/8/3pNb2/3n4/8/PPP1PPPP/RNBKQB1R"]="Qb4"
FENs["1r3b2/1bp2pkp/p1q4N/1p1n1pBn/8/2P3QP/PPB2PP1/4R3"]="Bf6+"
FENs["3nk1r1/1pq4p/p3PQpB/5p2/2r5/8/P4PPP/3RR1K1"]="Rxd8+"
FENs["r2k2nr/pp1b1Q1p/2n4b/3N4/3q4/3P4/PPP3PP/4RR1K "]="Re8+"
FENs["R6R/1p2k2r/7q/p2Pp2P/4N1n1/8/K2p4/5Q2"]="Qa6"

# Function to print the chess board
print_board() {
    local fen=$1
    local pieces="rnbqkpRNBQKP"


    # Loop through each character in the FEN string
    for (( i=0; i<${#fen}; i++ )); do
        local char="${fen:$i:1}"

        # If it's a digit, skip that many squares
        if [[ $char =~ [1-8] ]]; then
            for (( j=0; j<$char; j++ )); do
                echo -n "."
            done
        elif [[ $char == '/' ]]; then
            echo # New line for new rank
        elif [[ $pieces =~ $char ]]; then
            # print piece
            echo -n $char
        else
            break
        fi
    done
    printf "\n"
}

# Usage example



# Extract keys into an indexed array
keys=("${!FENs[@]}")

# Get a random index within the range of the keys array length
random_index=$(( RANDOM % ${#keys[@]} ))

# Retrieve the random key using the random index
random_key=${keys[$random_index]}

print_board "$random_key"

echo "For extra security, please enter the best move in algebraic chess notation"
echo "[white to move]: "

read move
if [[ $move == ${FENs[$random_key]} ]]; then
    echo "Correct!"
    #give user an interactive bash shell
    bash
else
    echo "Wrong (You have to know this)"
fi
