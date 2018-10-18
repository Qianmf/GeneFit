function [re]=NFBL(Param, sig0, looptype)
	if looptype == 1
		re = loop1(sig0,Param);
	elseif looptype == 2
		re = loop2(sig0,Param);
	elseif looptype == 3
		re = loop3(sig0,Param);
	elseif looptype == 4
		re = loop4(sig0,Param);
	elseif looptype == 5
		re = loop5(sig0,Param);
	end			
end




