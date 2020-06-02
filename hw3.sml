(* Problem 1 *)
fun same_string (s1 : string, s2 : string) =
    s1 = s2

fun exists (s : string, ss : string list) =
    case ss of
	[] => false
      | head :: rest => if same_string(s, head) then true else exists(s, rest)

fun remove_s (s : string, ss : string list) =
    case ss of
	head :: [] => []
      | head :: rest => if same_string(s, head) then rest
			else head :: remove_s(s, rest)

fun all_except_option (s : string, ss : string list) =
    case exists(s, ss) of
	false => NONE
     | true => SOME (remove_s(s, ss)) 


		    
fun get_substitutions1 (substitutions : string list list, s : string) =
    case substitutions of
	[] => []
      | head :: rest => if exists(s, head) then remove_s(s, head) @ get_substitutions1(rest, s)
			else get_substitutions1(rest,s)

					       
fun get_substitutions2 (substitutions : string list list, s : string) =
    let fun aux(substitutions, acc) =
	    case substitutions of
		[] => acc
	      | head :: rest => if exists(s, head) then aux(rest, acc @ remove_s(s, head))
				else aux(rest, acc)
    in
	aux(substitutions, [])
    end

	
type full_name = {first:string, middle:string, last:string}

fun buildName(f, m, l) = {first = f, middle = m, last = l}

fun extractFirstName (n : full_name) =
    case n of
	{first, middle, last} => first
				 
fun extractMiddleName (n : full_name) =
    case n of
	{first, middle, last} => middle
				     
fun extractLastName (n : full_name) =
    case n of
	{first, middle, last} => last
				     
fun similar_names (substitutions : string list list, n : full_name) =
    let	fun aux(subst) =
	    case subst of
		[] => []
	      | head :: rest => let val entry = buildName(head, extractMiddleName(n), extractLastName(n)) in entry :: aux(rest) end
    in 
	n :: aux(get_substitutions1(substitutions, extractFirstName(n)))
    end

(* Problem 2 *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

fun card_color (suit : suit, rank : rank) =
    case suit of
	Spades  => Black
    | Clubs => Black
    | Diamonds => Red
    | Harts => Red

fun card_value (suit : suit, rank : rank) =
    case rank of
	Num x => x
      | Ace => 11
      | _ => 10

fun same_card (entry : card, c : card) =
    entry = c

fun belongs (cs : card list, c : card) =
    case cs of
	[] => false
    | head :: rest => if same_card(head, c) then true else belongs(rest, c)
		 
fun remove_card (cs, c, e) =
    case belongs(cs, c) of
	false => raise e
      | true => let fun remove (cs, c) =
			case cs of
			    head :: [] => []
			  | head :: rest => if same_card(head, c) then rest else head :: remove(rest, c)
		in remove(cs, c)
		end
				
fun all_same_color (cs : card list) =
    case cs of
	[] => true
      | head :: [] => true
      | head :: (neck :: rest) =>  if card_color(head) = card_color(neck) then all_same_color(neck :: rest) else false
					     
fun sum_cards (cs : card list) =
    let fun f (cs, acc) =
	    case cs of
		[] => acc
	      | head :: rest => f(rest, acc + card_value(head))
    in
	f(cs, 0)
    end

    
fun score (heldCards : card list, goal : int) =
    let val hc = sum_cards(heldCards)
	val colorFlag = all_same_color(heldCards)
	fun scoreBigger(hc, goal) = hc > goal
    in
	case (scoreBigger(hc, goal), colorFlag) of
	    (true, true) => (3 * (hc - goal)) div 2
	 | (true, false) => 3 * (hc - goal)
	 | (false, true) => (goal-hc) div 2
	 | (false, false) => (goal-hc)
    end
    
