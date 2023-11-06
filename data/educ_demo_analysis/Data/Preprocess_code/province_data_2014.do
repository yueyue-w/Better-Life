clear all
//Demographic: urban and rural; region
use "/Users/qilinzhou/Desktop/hh_sec_a_2014.dta", clear


merge 1:m y5_hhid using "/Users/qilinzhou/Desktop/hh_sec_c_2014.dta"
drop _merge
save demo_educ_2014.dta, replace

//Personal employment and household income
//Employment: economic activity types in last 12 months
//Income: rental payments; private/government pensions; other income(combined)



use "/Users/qilinzhou/Desktop/demo_educ.dta", clear
merge 1:1 y4_hhid indidy4 using "/Users/qilinzhou/Desktop/hh_sec_e_2014.dta"
drop _merge
save demo_educ_employ_2014.dta, replace

use "/Users/qilinzhou/Desktop/demo_educ_employ.dta", clear
merge m:1 y4_hhid using "/Users/qilinzhou/Desktop/hh_sec_q1_2014.dta"
save household_educ_2014.dta, replace

//Basic services：community cluster and access to schools 


use "/Users/qilinzhou/Desktop/household_educ_2014.dta", clear


rename hh_a06 household_num

drop hh_a13

drop y4_rural

drop domain strataid

drop wardtype

rename hh_a01_1 regioncode

rename hh_a01_2 region_name

rename regioncode region_code

rename hh_a02_1 district_code

rename hh_a02_2 district_name

drop hh_a03_1-hh_a04_2

drop hh_a05-hh_a07_2

drop hh_a08-hh_a12_2

drop hh_a12_1-hh_a27

rename hh_c05 in_school

rename hh_c06 in_school_ly

rename hh_c07 highest_grade

drop hh_c08

rename hh_c09 current_grade

drop hh_c10

rename hh_c11 school_attendence

rename school_attendence school_attendance

rename school_attendance school_attend

rename hh_c12 school_owner

rename hh_c13 boarding

rename hh_c14 time_to_school

rename time_to_school transport_school

rename hh_c15 time_to_school

rename hh_c16 meal_school

rename hh_c17 miss_school_lasttwo

rename hh_c18 absent_reason

rename hh_c19 textbook

rename hh_c20_1 homework_hour_week

drop hh_c20_2

rename homework_hour_week homework_hour_week_fir

rename hh_c21_1 problem_fir

rename hh_c21_2 problem_sec

rename problem_fir problem_school_fir

rename problem_sec problem_school_sec

rename hh_c22 primary_school_leave_exam

rename hh_c23 score

drop hh_c24

drop hh_c25

drop hh_c26

drop hh_c27

rename hh_c28_1 school_fee

rename hh_c28_2 uniform_fee

rename hh_c28_3 others

rename others other_fee

rename hh_c28_4 meal_cost

rename hh_c28_5 education_fee

rename education_fee education_fee_total_12m

rename education_fee_total_12m extra_tuition

rename uniform_fee book_mat

rename other_fee uniform_fee

rename meal_cost transport_fee

rename hh_c28_6 others

rename hh_c28_7 meal_cost

rename hh_c28_8 eduction_expendit_12m

rename hh_c29 adult_literacy

drop hh_c30

rename hh_c01 satisfy_school_age

rename hh_c02 read_write

rename hh_c03 go_to_school

rename hh_c04 start_school_age

drop hh_e01

rename hh_e04ab unpaid_12m

rename hh_e04cd non_farm_business_12

rename non_farm_business_12 non_farm_business_12m

rename hh_e04e household_farm

drop hh_e05-hh_e71

drop hh_q01_1-hh_q05_2

rename hh_q06 rental_pay_inc

rename hh_q07 priv_gov_inc

rename hh_q08 other_inc

drop hh_q09_1-hh_q14

save cleaned_educ_2014.dta, replace

use "/Users/qilinzhou/Desktop/hh_sec_b.dta", clear
merge 1:1 y4_hhid indidy4 using "/Users/qilinzhou/Desktop/cleaned_educ_2014.dta"

rename hh_b01 name

drop name

rename hh_b02 sex

drop hh_b03_1 hh_b03_2

rename hh_b04 age

rename hh_b05 relation_head

drop hh_b06-hh_b13

rename hh_b14 educ_f

drop hh_b15

drop hh_b16

rename hh_b17 educ_m

rename hh_b18 age_12

rename hh_b19 married

drop hh_b20-hh_b29_3

drop _merge
save cleaned_educ_2014.dta, replace

use "/Users/qilinzhou/Desktop/cleaned_educ_2014.dta", replace

gen male = sex == 1

order male, after(sex)

drop sex

gen head = relation_head == 1

order head, after(relation_head)

gen father_educ = cond(educ_f > 1 & educ_f <7, 1, cond(educ_f == 1, 0, .))

order father_educ, after(educ_f)

gen mother_educ = cond(educ_m > 1 & educ_m <7, 1, cond(educ_m == 1, 0, .))

order mother_educ, after(educ_m)

drop educ_f
drop educ_m

gen over_12 = .
replace over_12 = 1 if age_12 == 1
replace over_12 = 0 if age_12 == 2

order over_12, after(age_12)
drop age_12

gen cur_married = .
replace cur_married = 1 if 1 <= married  & married <= 2
replace cur_married = 0 if 2 < married  & married <=7

order cur_married, after(married)
drop married

gen rural = .
replace rural = 1 if clustertype == 1
replace rural = 0 if clustertype == 2

order rural, after(clustertype)
drop clustertype

gen read_wri_kiswa = .
replace read_wri_kiswa = 1 if read_write == 1 | read_write == 3
replace read_wri_kiswa = 0 if read_write == 2 | read_write == 4 | read_write == 5

order read_wri_kiswa, after(read_write)
drop read_write

gen school_exp = .
replace school_exp = 1 if go_to_school == 1
replace school_exp = 0 if go_to_school == 2

order school_exp, after(go_to_school)
drop go_to_school

gen cur_school = .
replace cur_school = 1 if in_school == 1
replace cur_school = 0 if in_school == 2

order cur_school, after(in_school)
drop in_school

gen school_lyear = .
replace school_lyear = 1 if in_school_ly == 1
replace school_lyear = 0 if in_school_ly == 2

order school_lyear, after(in_school_ly)
drop in_school_ly

gen educ_attain = .
replace educ_attain = 2 if highest_grade >= 11 & highest_grade <= 20 
replace educ_attain = 3 if highest_grade >= 21 & highest_grade <= 34 
replace educ_attain = 4 if highest_grade >= 41 & highest_grade <=45
replace educ_attain = 1 if highest_grade == 1 | highest_grade == 2

order educ_attain, after(highest_grade)
* Create a new numeric variable with value labels
label define educ_label 2 "Primary" 3 "Secondary" 4 "University" 1 "Others"
label values educ_attain  educ_label

gen primary = .
replace primary = 1 if educ_attain == 2
replace primary = 0 if educ_attain == 3| educ_attain == 1 | educ_attain == 4
order primary, after(educ_attain)

gen secondary = .
replace secondary = 1 if educ_attain == 3
replace secondary = 0 if educ_attain == 2| educ_attain == 1| educ_attain == 4
order secondary, after(primary)

gen university = .
replace university = 1 if educ_attain == 4
replace university = 0 if educ_attain == 2| educ_attain == 1| educ_attain == 3
order university, after(secondary)

gen cur_grade = .
replace cur_grade = 2 if current_grade >= 11 & current_grade <= 20 
replace cur_grade = 3 if current_grade >= 21 & current_grade <= 34 
replace cur_grade = 4 if current_grade  >= 41 & current_grade <=45
replace cur_grade = 1 if current_grade  == 1 | current_grade == 2
order cur_grade, after(current_grade)

label values cur_grade educ_label
gen cur_prim = .
replace cur_prim = 1 if cur_grade == 2
replace cur_prim = 0 if cur_grade == 1| cur_grade == 3 | cur_grade == 4
order cur_prim, after(cur_grade)

gen cur_second = .
replace cur_second = 1 if cur_grade == 3
replace cur_second = 0 if cur_grade == 1| cur_grade == 2 | cur_grade == 4
order cur_second, after(cur_prim)

gen cur_univ = .
replace cur_univ = 1 if cur_grade == 4 
replace cur_univ = 0 if cur_grade == 1| cur_grade == 2 | cur_grade == 3
order cur_univ, after(cur_second)

drop highest_grade
drop current_grade

drop school_attend

gen public = .
replace public = 1 if school_owner == 1 |school_owner == 2
replace public = 0 if school_owner == 3 | school_owner == 4 |  school_owner == 5| school_owner == 6| school_owner == 7 
order public, after(school_owner)

drop school_owner

gen board = .
replace board = 1 if boarding == 1
replace board = 0 if boarding == 2
order board, after(boarding)

drop boarding

gen transportation = .
replace transportation = 1 if transport_school > 1 & transport_school <5
replace transportation = 0 if transport_school == 1
order transportation, after(transport_school)

drop transport_school

gen meal_in_school = .
replace meal_in_school = 1 if meal_school == 1
replace meal_in_school = 0 if meal_school == 2
order meal_in_school, after(meal_school)

rename meal_in_school free_meal_school
drop meal_school

gen miss_school_2w = .
replace miss_school_2w = 1 if miss_school_lasttwo== 1
replace miss_school_2w = 0 if miss_school_lasttwo == 2
order miss_school_2w, after(miss_school_lasttwo)

drop miss_school_2w

gen access_textbook = .
replace access_textbook = 1 if textbook > 1 & textbook <5
replace access_textbook = 0 if textbook == 1
order access_textbook, after(textbook)

drop textbook

gen problem_school = .
replace problem_school = 1 if problem_school_fir > 1 & problem_school_fir <= 8
replace problem_school = 0 if problem_school_fir == 1
order problem_school, after(problem_school_fir)


gen psle = .
replace psle = 1 if primary_school_leave_exam == 1
replace psle = 0 if primary_school_leave_exam == 2
order psle, after(primary_school_leave_exam)

drop primary_school_leave_exam

gen pass_psle = .
replace pass_psle = 1 if score == 1
replace pass_psle = 0 if score == 2
order pass_psle, after(score)

drop score

gen adult_literacy_prog = .
replace adult_literacy_prog = 1 if adult_literacy >= 1 & adult_literacy <=3
replace adult_literacy_prog = 0 if adult_literacy == 4
order adult_literacy_prog, after(adult_literacy)

drop adult_literacy

gen unpaid_employee_12m = .
replace unpaid_employee_12m = 1 if unpaid_12m == 1
replace unpaid_employee_12m = 0 if unpaid_12m == 2
order unpaid_employee_12m, after(unpaid_12m)

drop unpaid_12m

gen non_farm_12m = .
replace non_farm_12m  = 1 if non_farm_business_12m == 1
replace non_farm_12m = 0 if non_farm_business_12m == 2
order non_farm_12m, after(non_farm_business_12m)

gen house_farm_12m = .
replace house_farm_12m = 1 if household_farm == 1
replace house_farm_12m = 0 if household_farm == 2
order house_farm_12m, after(household_farm)

drop non_farm_business_12 household_farm

gen income_known_sour = rental_pay_inc + priv_gov_inc + other_inc

save "encoded_educ_2014.dta",replace
