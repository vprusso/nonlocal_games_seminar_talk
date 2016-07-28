
num_inputs = 2;
num_outputs = 2;
num_tests = 10;

eps = 0.000001; 

for i = 1:num_tests
	R = GenerateRandomMeasurements(num_inputs, num_outputs);
	ent = MonogamyGameValueUB(R)
    unent = MonogamyGameUnentangledValue(R)
	
	
	is_close = abs(ent-unent);
	
	if is_close > eps
		output_msg = 'Example found where upper and lower bounds do not agree. Halting execution of program and saving workspace...';
		fprintf(output_msg);		
        break; 
	end	
end