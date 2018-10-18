function [re1, re2]=main(Expseq, param, parastep, TimeLimit, returncondition, sig, looptype)

	paraspace = [0.2, 2/3, 0.2, ...
	0.5, 1/3, 0.2, 0.05, ...
	0.05, 1/3, 0.2, 0.05, ...
	0.01, 1/3, 0.2, 0.178, 0.0003];

	t1 = clock;
	[re1,re2] = BestParaFinder(paraspace, TimeLimit, returncondition, Expseq, param, parastep, sig, looptype);

	re1 = re1(2,:);
	re2 = re2/length(Expseq);
	
	disp(['Time cost: ', num2str(etime(clock,t1)/60), ' min'])

end
