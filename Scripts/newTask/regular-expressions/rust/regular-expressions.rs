
fn main() {
    let s = "this is a matching string";

for i in 0..10000000{
    assert_eq!(s.find("string"), Some(19));
    assert_eq!(s, s.replacen("string", "string", 6));
}
}

