function [ERR] = err_of_seq(seq,expectedseq)
	Difference=(seq-expectedseq);
	ERRsqr=0;
	for x=Difference
	    ERRsqr=ERRsqr+x^2;
	end
	ERR=ERRsqr^0.5;
end
