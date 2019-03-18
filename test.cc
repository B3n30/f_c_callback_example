#include <iostream>

extern"C" {
 void set_random_number_generator_(void(double*));
 void run_();
 void rnd_(double*);
}

int main() {
	set_random_number_generator_([](double* value)-> void { 
			rnd_(value);
		});
	for(std::size_t i(0); i<100; ++i) {
		run_();
	}
	return 0;
}
