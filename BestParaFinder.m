function [re1, re2, Timer] = BestParaFinder(paraspace, TimeLimit, returncondition, Expseq, param, parastep, sig, looptype)

	paramIndex = param(1,:);
	paramRange = param(2:3,:);

	paramN = length(paramIndex);

	tic

	NewParaSpace = paraspace(1,:);
	paraspace = [paraspace;paraspace];
	E = zeros(1,paramN);
	I = zeros(1,paramN);
	for n = 1:paramN
		Pn0 = paraspace(1,paramIndex(n));
		Errs = zeros(1,parastep+1);
		LL = param(2,n);
		UL = param(3,n);
		for m = LL:(UL-LL)/parastep:UL
			paraspace(1,paramIndex(n)) = m;
			Errindex = round(m*parastep+1);
			Errs(Errindex) = err_of_param(paraspace(1,:), Expseq, sig, looptype);
		end
		paraspace(1,paramIndex(n)) = Pn0;
		[E(n), I(n)] = min(Errs);
	end

	[Emin,Imin] = min(E);
	NewParaSpace(1,paramIndex(Imin)) = (I(Imin)-1)/parastep;

	disp(['This loop cost ', num2str(toc), ' s']);

	E = err_of_param(NewParaSpace(1,:), Expseq, sig, looptype);
	if E <= err_of_param(paraspace(2,:), Expseq, sig, looptype)
		paraspace(2,:) = NewParaSpace(1,:);
	end

	re1 = [NewParaSpace(1,:);paraspace(2,:)];
	re2 = E;
	Timer = TimeLimit - 1;

	if NewParaSpace == paraspace
		disp('End when the error is convergent')
		disp(['Error is ', num2str(E)])
		return
	end

	if E <= returncondition
		disp('End when return condition is reached');
		return
	end

	if TimeLimit <= 1
		disp('End when time limitation is reached')
		re1 = paraspace(2,:);
		re2 = err_of_param(paraspace(2,:), Expseq, sig, looptype);
		return
	end

	disp(['Error is ', num2str(E)]);
	disp([num2str(Timer),' steps to the limit of time']);

	[re1,re2,Timer] = BestParaFinder(re1, Timer, returncondition, Expseq, param, parastep, sig, looptype);

end