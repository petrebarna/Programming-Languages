use "hw3.sml";

val all_except_option1 = all_except_option ("string", ["string"]) = SOME []
									
val all_except_option2 = all_except_option ("string", []) = NONE
								
val all_except_option3 = all_except_option ("string", ["Mac"]) = NONE
								      
val all_except_option4 = all_except_option ("string", ["Mac", "Beth"]) = NONE
									     
val all_except_option5 = all_except_option ("string", ["Mac", "Beth", "string"]) = SOME ["Mac", "Beth"]
											
val all_except_option6 = all_except_option ("string", ["Mac", "string", "Beth"]) = SOME ["Mac", "Beth"]
											
val all_except_option7 = all_except_option ("string", ["Mac", "Beth", "Lear", "string"]) = SOME ["Mac", "Beth", "Lear"]

val all_except_option8 = all_except_option ("string", ["string", "Mac", "Beth", "Lear"]) = SOME ["Mac", "Beth", "Lear"]

															
val get_substitutions1a = get_substitutions1 ([["foo"],["there"]], "foo") = []
										
val get_substitutions1b = get_substitutions1 ([["foo", "bar"],["there"]], "foo") = ["bar"]
										       										
val get_substitutions1c = get_substitutions1 ([["foo", "bar"],["foo", "there"]], "foo") = ["bar", "there"]

val get_substitutions1d = get_substitutions1 ([["bar"],["there"]], "foo") = []
																					      
val get_substitutions1e = get_substitutions1 ([["foo", "bar"],["there"],["baz", "bar", "foo"]], "foo") = ["bar", "baz", "bar"]
													     
val get_substitutions1f = get_substitutions1 ([], "foo") = []

val get_substitutions1g = get_substitutions1 ([["foo", "bar", "baz"],["there"]], "foo") = ["bar", "baz"]
											      
val get_substitutions2a = get_substitutions2 ([["foo"],["there"]], "foo") = []
										
val get_substitutions2b = get_substitutions2 ([["foo", "bar"],["there"]], "foo") = ["bar"]
										       										
val get_substitutions2c = get_substitutions2 ([["foo", "bar"],["foo", "there"]], "foo") = ["bar", "there"]

val get_substitutions2d = get_substitutions2 ([["bar"],["there"]], "foo") = []
																					      
val get_substitutions2e = get_substitutions2 ([["foo", "bar"],["there"],["baz", "bar", "foo"]], "foo") = ["bar", "baz", "bar"]
													     
val get_substitutions2f = get_substitutions2 ([], "foo") = []

val get_substitutions2g = get_substitutions2 ([["foo", "bar", "baz"],["there"]], "foo") = ["bar", "baz"]

											      
val similar_names1 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
		     [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
		      {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]
		
val similar_names2 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="John", middle="W", last="Smith"}) =
		     [{first="John", last="Smith", middle="W"}]
			 
val similar_names3 = similar_names ([["Fred","Fredrick"]], {first="Fred", middle="W", last="Smith"}) =
		     [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"}]

val similar_names4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","Fredrick"]], {first="Fred", middle="W", last="Smith"}) =
		     [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
		      {first="Freddie", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"}]

(* Problem 2 *)
			 
val card_color1 = card_color (Clubs, Num 2) = Black
						  
val card_color2 = card_color (Spades, Num 2) = Black
		  
val card_color3 = card_color (Hearts, Num 2) = Red
						   
val card_color4 = card_color (Diamonds, Num 2) = Red

			 
val card_value1 = card_value (Clubs, Num 2) = 2
						  
val card_value2 = card_value (Clubs, Num 3) = 3
						  
val card_value3 = card_value (Clubs, Num 8) = 8
						  
val card_value4 = card_value (Clubs, Ace) = 11
						
val card_value5 = card_value (Clubs, Jack) = 10
						 
val card_value6 = card_value (Clubs, Queen) = 10
						  
val card_value7 = card_value (Clubs, King) = 10

			     
val remove_card1 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
										   
val remove_card2 = remove_card ([(Hearts, Ace), (Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Hearts, Ace)]

(* Test manually
val remove_card3 = remove_card ([(Hearts, King), (Hearts, King)], (Hearts, Ace), IllegalMove) -> IllegalMove

val remove_card6 = remove_card ([], (Hearts, Ace), IllegalMove) -> IllegalMove
*)
												    
val remove_card4 = remove_card ([(Hearts, Ace), (Hearts, Ace), (Hearts, King)], (Hearts, King), IllegalMove) = [(Hearts, Ace), (Hearts, Ace)]
														   
val remove_card5 = remove_card ([(Hearts, Ace), (Hearts, Ace), (Hearts, King)], (Hearts, Ace), IllegalMove) = [(Hearts, Ace), (Hearts, King)]

									  
val all_same_color1 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
									  									  							      
val all_same_color2 = all_same_color [(Hearts, Ace), (Diamonds, Ace)] = true

val all_same_color3 = all_same_color [(Diamonds, Ace), (Diamonds, Ace)] = true

val all_same_color4 = all_same_color [(Spades, Ace), (Spades, Ace)] = true

val all_same_color5 = all_same_color [(Spades, Ace), (Clubs, Ace)] = true
									 
val all_same_color6 = all_same_color [(Clubs, Ace), (Clubs, Ace)] = true
									
val all_same_color7 = all_same_color [(Hearts, Ace), (Spades, Ace)] = false
									  
val all_same_color8 = all_same_color [(Hearts, Ace), (Clubs, Ace)] = false
									 
val all_same_color9 = all_same_color [(Diamonds, Ace), (Spades, Ace)] = false
									    
val all_same_color10 = all_same_color [(Diamonds, Ace), (Clubs, Ace)] = false

val all_same_color11 = all_same_color [] = true
					       
val all_same_color12 = all_same_color [(Clubs, Ace), (Clubs, Ace), (Hearts, Ace)] = false
											
val all_same_color13 = all_same_color [(Clubs, Ace), (Clubs, Ace), (Clubs, Ace)] = true

										       
val sum_cards1 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
								 
val sum_cards2 = sum_cards [] = 0
				    
val sum_cards3 = sum_cards [(Clubs, Num 2),(Clubs, Num 2), (Hearts, Num 3)] = 7
										  
val sum_cards4 = sum_cards [(Clubs, Ace)] = 11
						
val sum_cards5 = sum_cards [(Clubs, King),(Clubs, Ace)] = 21
							      
val sum_cards6 = sum_cards [(Clubs, Queen),(Clubs, Ace)] = 21
							       
val sum_cards7 = sum_cards [(Clubs, Jack),(Clubs, Ace)] = 21
							      
val sum_cards8 = sum_cards [(Clubs, Jack),(Clubs, Jack)] = 20

							      							      

val score1 = score ([],10) = 5

val score2 = score ([],0) = 0

val score3 = score ([(Hearts, Num 2)],1) = 1

val score4 = score ([(Hearts, Num 2)],2) = 0
			       
val score5 = score ([(Hearts, Num 2),(Hearts, Num 2)],5) = 0

val score6 = score ([(Clubs, Num 8),(Clubs, Num 5)],8) = 7

val score7 = score ([(Clubs, Num 8),(Clubs, Num 5)],14) = 0
							      
val score8 = score ([(Hearts, Num 3),(Clubs, Num 8),(Clubs, Num 5)],3) = 39

val score9 = score ([(Hearts, Num 3),(Clubs, Num 8),(Clubs, Num 5)],20) = 4
									      
val score10 = score ([(Hearts, Num 3),(Hearts, Num 8), (Spades, Num 5)],3) = 39
									    
val score11 = score ([(Hearts, Num 3),(Hearts, Num 8), (Spades, Num 5)],20) = 4							       
									    
							     
