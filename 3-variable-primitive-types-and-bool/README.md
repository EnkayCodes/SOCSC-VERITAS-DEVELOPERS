# Move Programming Basics: Variables & Primitive Types (uint and bool)

This guide introduces the fundamental building blocks of the **Move programming language**, focusing on variables, booleans, unsigned integers, type safety, casting, and arithmetic operations.

---

## Variable Declaration

### Immutable Variables
By default, variables in Move are immutable and cannot be reassigned after their initial declaration:
```move
let x: bool = true; // Immutable variable
```

### Mutable Variables
To make a variable mutable, use the `mut` keyword:
```move
let mut y: u8 = 42; // Mutable variable

// Reassigning the value
y = 43;
```

### Variable Shadowing
You can declare a variable with the same name to "shadow" the original variable:
```move
let x: u8 = 42;
let x: u16 = 42; // Shadows the previous variable
```

## Booleans
The `bool` type represents a boolean value, which can either be `true` or `false`:
```move
let flag = true;  // Compiler infers the type as bool
let is_valid = false;
```

## Integer Types
Move supports various unsigned integer types:
- `u8`, `u16`, `u32`, `u64`, `u128`, `u256`

Example:
```move
let small_number: u8 = 42;
let large_number: u128 = 42;
```
The default type is `u64` if no explicit type is provided.

## Arithmetic Operations
Move supports standard arithmetic operations:
- Addition (`+`)
- Subtraction (`-`)
- Multiplication (`*`)
- Division (`/`)
- Modulus (`%`)

Example:
```move
let result = 5 + 3; // Addition
```

### Safety
Move prevents overflow/underflow by aborting at runtime if a value exceeds its type's range:
```move
let x: u8 = 255;
let y: u8 = 1;

// This will raise an error
let z = x + y;
```

## Casting Between Types
Explicit type casting is done using the `as` keyword:
```move
let x: u8 = 42;
let y: u16 = x as u16;
```
Parentheses may be required for clarity in complex expressions:
```move
let z = 2 * (x as u16);
```

## Overflow Handling
Move enforces safe arithmetic by disallowing overflow or underflow:
```move
let x: u8 = 255;
let y: u8 = 1;

// Raises a runtime error
let z = x + y;
```

## Video Guide

For a step-by-step walkthrough, watch this video tutorial:

[![Install Sui on Windows](https://img.youtube.com/vi/owSlmn_-p3I/0.jpg)](https://youtu.be/jywiLWHP7yQ)

---

# CGPA Calculator — Move Language Task

This README provides a full assignment and starter code for implementing a CGPA (Cumulative Grade Point Average) calculator using the Move smart contract language.

---

## **📘 Task: CGPA Calculator**

A student completed five courses with the following scores:

| Course | Score |
| ------ | ----- |
| 1      | 78    |
| 2      | 92    |
| 3      | 85    |
| 4      | 55    |
| 5      | 30    |

Each course carries **5 credit units**.

---

## **🎯 Your Assignment**

Write a Move smart contract that does the following:

* Stores scores as `u8`
* Casts them to `u16` for safe arithmetic
* Computes the total score
* Converts each score into Grade Points (GP) based on this table:

| Score Range | GP |
| ----------- | -- |
| 70–100      | 5  |
| 60–69       | 4  |
| 50–59       | 3  |
| 40–49       | 2  |
| 0–39        | 0  |

* Calculates the CGPA using:

```
CGPA = total_grade_points / total_credit_units
```

* Prints the final CGPA using `debug::print`

---

## **📄 Starter Code (`sources/student_grade.move`)**

Copy and paste this into your project:

```move
module cgpa_calc::cgpa {
    use std::debug;

    public fun calculate_cgpa() {
        // Step 1: Store scores as u8
        let score1: u8 = 78;

        // Step 2: Cast to u16 for safe arithmetic
        let score1_u16 = c1 as u16;

        // Step 3: Calculate total score
       
        // Helper: convert score to grade point
        fun grade_point(score: u8): u8 {
            if (score >= 70) {
                5
            } else if (score >= 60) {
                4
            } else if (score >= 50) {
                3
            } else if (score >= 40) {
                2
            } else {
                0
            }
        }

        // Step 4: Convert scores into grade points (GP)
        let gp1: u8 = grade_point(c1);

        // Each course credit units
        let credit_per_course: u16 = 5;

        // Step 5: Calculate Total grade points (cast GPs to u16 to multiply by credit_per_course)

        // Step 6: Total credit units
        let total_units: u16 = 5 * credit_per_course;

        // Step 7: Calculate CGPA (integer division — adjust for decimals if needed)
        let cgpa: u16 = total_gp / total_units;

        // Step 8: Print the result
        debug::print(&cgpa);
    }
}
```

---


##  Now Test your Move Package

Run your Move package using:

```
sui move test
```

or

```
sui move build
```
---

## Additional Resources

Refer to the [Move Book: Your First Move Program](https://move-book.com/move-basics/primitive-types.html) for more details on Move programming.