
/// Module: calculator
module calculator::calculator;
//use std::debug;

fun add(a: u8, b: u8) : u32{
    (a + b) as u32
}

fun sub( a: u8, b: u8 ) : u32 {
    (a -  b) as u32
}

fun mul( a: u8, b: u8 ) : u32 {
    (a *  b) as u32
}

fun div( a: u8, b: u8 ) : u32 {
    (a /  b) as u32
}

public fun answer(a:u16, b:u16) : (u64, u64, u64, u64) {
    let a = a as u8;
    let b = b as u8;

    let add = add(a, b) as u64;
    //debug::print(&add);

    let sub = sub(a, b) as u64;
    //debug::print(&sub);

    let mul = mul(a, b) as u64;
    //debug::print(&mul);

    let div = div(a, b) as u64;
    //debug::print(&div);

    return (add, sub, mul, div)
}

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


