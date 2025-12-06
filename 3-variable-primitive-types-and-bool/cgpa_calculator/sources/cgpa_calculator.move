module cgpa_calculator::cgpa_calculator;
use std::debug;

// Helper: convert score to grade point
    fun grade_point(score : u8) : u8{
        if(score >= 70){
            5
        }else if(score >= 60){
            4
        }else if(score >= 50){
            3
        }else if(score >= 40){
            2
        }else{
            0
        }
    }

public fun calculate_cgpa(){
    // Step 1: Store scores as u8
    let score1 : u8  = 78;
    let score2 : u8  = 92;
    let score3 : u8  = 85;
    let score4 : u8  = 55;
    let score5 : u8  = 30;

    // Step 2: Cast to u16 for safe arithmetic
    let score1_u16 = score1 as u16;
    let score2_u16 = score2 as u16;
    let score3_u16 = score3 as u16;
    let score4_u16 = score4 as u16;
    let score5_u16 = score5 as u16;

    //compute total score
    let total_score = score1_u16 + score2_u16 + score3_u16 + score4_u16 + score5_u16;


    // Step 4: Convert scores into grade points (GP)
    let gp1 : u8 = grade_point(score1);
    let gp2 : u8 = grade_point(score2);
    let gp3 : u8 = grade_point(score3);
    let gp4 : u8 = grade_point(score4);
    let gp5 : u8 = grade_point(score5);

    // Each course credit units
    let credit_unit : u16 = 5;

    // Step 5: Total grade points (cast GPs to u16 to multiply)
    let total_grade_points = (gp1 as u16) * credit_unit + 
        (gp2 as u16) * credit_unit + 
        (gp3 as u16) * credit_unit +   
        (gp4 as u16) * credit_unit + 
        (gp5 as u16) * credit_unit;

    // Step 6: Total credit units
    let total_credit_units : u16 = credit_unit * 5;

    // Step 7: Calculate CGPA (integer division — adjust for decimals if needed)
    let cgpa : u16 = total_grade_points / total_credit_units;

    // Step 8: Print the result
        debug::print(&cgpa);
}

