let capit () =
  Alcotest.(check char) "same chars"  'A' 'A'

let plus () =
  Alcotest.(check int) "same ints" 7 (3 + 4)

let test_set = [
  "Capitalize" , `Quick, capit;
  "Add entries", `Slow , plus ;
]

(* Run it *)
let () =
  Alcotest.run "My first test" [
    "test_set", test_set;
  ]