use "hw2.sml";

val is_olderTest1 = is_older ((1,2,3),(2,3,4)) = true

val is_olderTest2 = is_older ((2,3,4),(1,2,3)) = false

val is_olderTest3 = is_older ((9,2,3),(2,3,4)) = false
						    
val is_olderTest4 = is_older ((1,9,3),(2,3,4)) = false
						     
val is_olderTest5 = is_older ((1,2,9),(2,3,4)) = false
						     
val is_olderTest6 = is_older ((1,2,3),(1,3,4)) = false
						     
val is_olderTest7 = is_older ((1,2,3),(2,2,4)) = false
						     
val is_olderTest8 = is_older ((1,2,3),(2,3,3)) = false
			     

val number_in_monthTest1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
									       
val number_in_monthTest2 = number_in_month ([(2012,12,28),(2013,12,1)],2) = 0
										
val number_in_monthTest3 = number_in_month ([],2) = 0
							
val number_in_monthTest4 = number_in_month ([(2013,2,1)],2) = 1
						
val number_in_monthTest5 = number_in_month ([(2012,3,28),(2013,3,1),(2012,3,28),(2013,3,1)],3) = 4
												     
val number_in_monthTest6 = number_in_month ([(2012,3,28),(2013,2,1),(2012,3,28),(2013,2,1)],3) = 2
												     
val number_in_monthTest7 = number_in_month ([(2012,2,28),(2013,3,1),(2012,2,28),(2013,3,1)],3) = 2

												     
val number_in_monthsTest1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
												  
val number_in_monthsTest2 = number_in_months ([],[2,3,4]) = 0
								
val number_in_monthsTest3 = number_in_months ([],[]) = 0
							
val number_in_monthsTest4 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
													  
val number_in_monthsTest5 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,7,8]) = 1

val number_in_monthsTest6 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[12]) = 1
													    
val number_in_monthsTest7 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[4]) = 1
													    
val number_in_monthsTest8 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,2,28)],[2,4]) = 2
													     
val number_in_monthsTest9 = number_in_months ([(2012,2,28),(2013,2,1),(2011,2,31),(2011,2,28)],[2,4]) = 4
													    
val number_in_monthsTest10 = number_in_months ([(2012,2,28),(2013,3,1),(2011,2,31),(2011,4,28)],[1, 5]) = 0

													    
val dates_in_monthTest1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
									     
val dates_in_monthTest2 = dates_in_month ([(2012,2,28),(2013,2,1)],2) = [(2012,2,28),(2013,2,1)]
				 									       
val dates_in_monthTest3 = dates_in_month ([(2012,1,28),(2013,1,1)],2) = []

val dates_in_monthTest4 = dates_in_month ([],2) = []

val dates_in_monthTest5 = dates_in_month ([(2012,2,28),(2013,2,1),(2012,2,28),(2013,2,12)],2) = [(2012,2,28),(2013,2,1),(2012,2,28),(2013,2,12)]


val dates_in_monthsTest1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val dates_in_monthsTest2 = dates_in_months ([],[2,3,4]) = []

val dates_in_monthsTest3 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
													
val dates_in_monthsTest4 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5,6,7]) = []
													     						      
val dates_in_monthsTest5 = dates_in_months ([(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)]

val dates_in_monthsTest6 = dates_in_months ([(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)]
													    
val dates_in_monthsTest7 = dates_in_months ([(2012,2,28),(2013,2,1),(2011,3,31),(2011,6,28)],[4,5,6]) = [(2011,6,28)]


val get_nthTest1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

val get_nthTest2 = get_nth (["hi", "there", "how", "are", "you"], 1) = "hi"
									   
val get_nthTest3 = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"

val get_nthTest4 = get_nth (["hi", "", "how", "are", "you"], 2) = ""
								      
								      
val date_to_stringTest1 = date_to_string (2013, 6, 1) = "June 1, 2013"

val date_to_stringTest2 = date_to_string (1999, 8, 30) = "August 30, 1999"
					 
val date_to_stringTest3 = date_to_string (1999, 1, 30) = "January 30, 1999"

val date_to_stringTest4 = date_to_string (1999, 5, 30) = "May 30, 1999"
							     
val date_to_stringTest5 = date_to_string (1999, 12, 30) = "December 30, 1999"


val number_before_reaching_sumTest1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3

val number_before_reaching_sumTest2 = number_before_reaching_sum (15, [1,2,3,4,5]) = 4

val number_before_reaching_sumTest3 = number_before_reaching_sum (1, [1,2,3,4,5]) = 0
										  											 
val number_before_reaching_sumTest4 = number_before_reaching_sum (0, [1,2,3,4,5]) = 0


val what_monthTest1 = what_month 70 = 3

val what_monthTest2 = what_month 1 = 1

val what_monthTest3 = what_month 31 = 1
					  
val what_monthTest4 = what_month 59 = 2

val what_monthTest5 = what_month 60 = 3
					  
val what_monthTest6 = what_month 365 = 12

					   
val month_rangeTest1 = month_range (31, 34) = [1,2,2,2]

val month_rangeTest2 = month_range (31, 31) = [1]
						  						  
val month_rangeTest3 = month_range (31, 3) = []




					  
											 
								      
								      



									    
