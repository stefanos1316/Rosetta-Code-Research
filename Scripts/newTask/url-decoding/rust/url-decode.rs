#[cfg(feature = "urlparse")]
extern crate urlparse;

use urlparse::urlparse;
use urlparse::GetQuery;

fn main() {

	for  i in 0..1 {
		let url = urlparse("http%3A%2F%2Ffoo%20bar%2F");
		println!("{:?}", parsed_url);
		let query = url.get_parsed_query().unwrap();
		assert_eq!(url.scheme, "http");
		assert_eq!(query.get_first_from_str("col").unwrap(), "println!(\"TEST!\")");
	}
}
