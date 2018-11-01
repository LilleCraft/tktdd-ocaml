(* TYPES *)
type player =
  | PlayerOne
  | PlayerTwo

(* Surely not the best choice *)
type point = int

type pointsData = {
  playerOne: point;
  playerTwo: point;}

(* Surely incomplete *)
type score =
  | Points of pointsData
  | Deuce
  | Game of player

(* TOOLING FUNCTIONS *)
let string_of_score: score -> string =
  fun score  -> match score with 
    | _ -> "replace this with your code"

let string_of_player player =
  match player with
  | PlayerOne  -> "Player 1"
  | PlayerTwo  -> "Player 2"

let other_player player =
  match player with 
  | PlayerOne  -> PlayerTwo 
  | PlayerTwo  -> PlayerOne

(* An exemple how to use option to avoid null values *)
let increment_point: point -> point option =
  fun point  ->
    match point with 
    | 0 -> Some (15) 
    | 15 -> Some (30) 
    | 30 -> Some (40) 
    | _ -> None (* Outch ! How int could solve Advantage and End of game ? *)

(* An exemple how to extract values from 'a option value*)
let read_from_option_point: point option -> point =
  fun optPoint  -> match optPoint with 
    | Some a -> a 
    | None  -> 0

(* TRANSITION FUNCTIONS *)
let score_when_deuce: player -> score = fun winner  -> Game(winner)

let score_when_advantage: player -> player -> score =
  fun advantagedPlayer  winner  -> if advantagedPlayer = winner then Game(winner) else Game(other_player winner)

let score_when_forty: player -> player -> score =
  fun current  -> fun winner  -> Deuce
(*  
           let score_when_game: player -> score = fun winner  -> Deuce

           let score: score -> player -> score =
           fun currentScore  -> fun winner  -> Deuce *)