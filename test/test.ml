open Tennis

let player_1_other_player_ () =
  Alcotest.(check string) "other player"  "Player 2" (other_player PlayerOne |> string_of_player)

let given_deuce_when_player_wins () =
  Alcotest.(check string) "Advantage player 1"  "Advantage Player 1" (score_when_deuce PlayerOne |> string_of_score)

let advantage_when_advantaged_player () =
  let advantagedPlayer = PlayerOne in 
  let winner = advantagedPlayer in
  Alcotest.(check string) "Game player 1"  "Game Player 1" (score_when_advantage advantagedPlayer winner |> string_of_score)


let advantage_when_other_player_win () =
  let advantagedPlayer = PlayerOne in 
  let winner = other_player advantagedPlayer in
  Alcotest.(check string) "Deuce"  "Deuce" (score_when_advantage advantagedPlayer winner |> string_of_score)

(* Tests bellow need more conception on types to be implemented *)

let when_player_at_40_wins () =
  Alcotest.(check bool) "Given player: 40 when player at 40 wins then score is Game for this player"  false true

let when_player_at_40_other_30_wins () =
  Alcotest.(check bool) "Given player: 40 | other : 30 when other wins then score is Deuce"  false true


let when_player_at_40_other_15_wins () =
  Alcotest.(check bool) "Given player: 40 | other : 15 when other wins then score is 40/30"  false true

let when_player_at_15_wins_other_15 () =
  Alcotest.(check bool) "Given player: 15 | other : 15 when player wins then score is 30/15"  false true

let when_player_at_0_other_15_wins () =
  Alcotest.(check bool) "Given player: 0  | other : 15 when other wins then score is 0/30"  false true

let when_player_at_30_wins_other_15 () =
  Alcotest.(check bool) "Given player: 30 | other : 15 when player wins then score is 40/15"  false true

(* setup test sets *)

let tooling_set = [
  "Given a Player 1 the other player is Player 2" , `Quick, player_1_other_player_;
]

let tennis_set = [
  "Given deuce when player wins then score is correct", `Quick,given_deuce_when_player_wins;
  "Given advantage when advantaged player wins then score is Game to the advantaged player", `Quick,advantage_when_advantaged_player;
  "Given advantage when the other player wins then score is Deuce", `Quick,advantage_when_advantaged_player;
  "Given player: 40 when player at 40 wins then score is Game for this player", `Quick,when_player_at_40_wins;
  "Given player: 40 | other : 30 when other wins then score is Deuce", `Quick,when_player_at_40_other_30_wins;
  "Given player: 40 | other : 15 when other wins then score is 40/30", `Quick,when_player_at_40_other_15_wins;
  "Given player: 15 | other : 15 when player wins then score is 30/15", `Quick,when_player_at_15_wins_other_15;
  "Given player: 0  | other : 15 when other wins then score is 0/30", `Quick,when_player_at_0_other_15_wins;
  "Given player: 30 | other : 15 when player wins then score is 40/15", `Quick,when_player_at_30_wins_other_15;
]

(* Run it *)
let () =
  Alcotest.run "Tennis tests" [
    "Tooling test set", tooling_set;
    "Tennis test set", tennis_set;
  ]