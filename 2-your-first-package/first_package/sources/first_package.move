
/// Module: first_package
module first_package::first_package;

use std::string::String;

public fun first() : String{
    b"This is my first package".to_string()
}

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


