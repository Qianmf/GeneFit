function [ERR] = err_of_param(param, expected_seq, sig, looptype)
	seq = NFBL(param, sig, looptype);
	ERR = err_of_seq(seq, expected_seq);
end

