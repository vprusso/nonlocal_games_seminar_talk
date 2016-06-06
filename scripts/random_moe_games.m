
num_inputs = 2;
num_outputs = 2;
num_tests = 10;

reps = 1;
lvl = 1;

eps = 0.000001; 

for i = 1:num_tests
	R = GenerateRandomMeasurements(num_inputs, num_outputs);
	ub = MonogamyGameValueUB(R,reps,lvl)
	lb = MonogamyGameValueLB(R,reps,lvl)
	
	is_close = abs(ub-lb);
	
	if is_close > eps
		output_msg = 'Example found where upper and lower bounds do not agree. Halting execution of program and saving workspace...';
		fprintf(output_msg);		
        break; 
	end	
end