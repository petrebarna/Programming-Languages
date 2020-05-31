fun is_older(pr : ((int * int * int) * (int * int * int))) =
     #1(#1 pr) < #1(#2 pr)
       andalso #2(#1 pr) < #2(#2 pr)
       andalso #3(#1 pr) < #3(#2 pr)

fun number_in_month(xs : (int * int * int) list, y : int) =
    if null xs
    then 0
    else if not (#2(hd xs) = y)		 
    then 0 + number_in_month(tl xs ,y)
    else 1 + number_in_month(tl xs, y)

fun number_in_months(xs : (int * int * int) list, ys : int list) =
    if null ys
    then 0
    else number_in_month(xs, hd ys) + number_in_months(xs, tl ys)

fun dates_in_month(xs : (int * int * int) list, y : int) =
    if null xs
    then []
    else if #2(hd xs) = y
    then hd xs :: dates_in_month(tl xs, y)
    else dates_in_month(tl xs, y)

fun dates_in_months(xs : (int * int * int) list, ys : int list) =
    if null ys
    then []
    else dates_in_month(xs, hd ys) @ dates_in_months(xs, tl ys)

fun get_nth(xs : string list, n : int) =
    if n = 1
    then hd xs
    else get_nth(tl xs, n - 1)

fun date_to_string(date : (int * int * int)) =
   let val monthsAsStrings = ["January", "February", "March", "April",
			      "May", "June", "July", "August", "September", "October", "November", "December"]
       val month = get_nth(monthsAsStrings, #2 date)
   in 
       (month ^ " " ^ Int.toString(#3 date) ^  ", "  ^ Int.toString(#1 date))
   end
	    
fun number_before_reaching_sum(sum : int, xs : int list) =
    if null xs
    then 0
    else if not (sum > hd xs)
    then 0
    else if not (sum > (hd xs + hd (tl xs)))
    then 1
    else 1 + number_before_reaching_sum(sum - hd xs, tl xs)

fun what_month(day : int) =
    let val monthsDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] 
    in
	1 + number_before_reaching_sum(day, monthsDays)
    end

fun month_range(day1 : int, day2 : int) =
    if day2 < day1
    then []
    else
	let fun create_dayList(dayRun : int) =
		if dayRun = day2
		then what_month(dayRun) :: []
		else what_month(dayRun) :: create_dayList(dayRun + 1)
	in
	    create_dayList(day1)
	end

fun oldest(datesList : (int * int * int) list) =
    if null datesList
    then NONE
    else
	let fun find_oldest(dates : (int * int * int) list) =
		if null (tl dates)
		then hd dates
		else if (is_older(hd dates, find_oldest(tl dates)))
		then  hd dates
		else find_oldest(tl dates)
	in
	   SOME (find_oldest(datesList))
	end
