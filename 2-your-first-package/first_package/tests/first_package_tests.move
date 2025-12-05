
#[test_only]
module first_package::first_package_tests;
// uncomment this line to import the module
    use first_package::first_package;

    use std::string;
    use std::debug;

    #[test]
    public fun test_first() {
        let msg = first_package::first();
        // This prints to the test output
        debug::print(&msg);
    }