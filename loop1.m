function [re]=loop1(sig, param)
	UpL=length(sig);
	dt = 0.1;
	A=[];A(1)=0;
	B=[];B(1)=0;

	t=[];t(1)=0;

	I=sig;

	% --------------------------------------------------------------
	% You can find the parameter index from here
	% --------------------------------------------------------------
	CI = param(1); nI = param(2); KI = param(3)+1; 
	CB = param(4); nB = param(5); KB = param(6)+1; dA = param(7);
	CA = param(8); nA = param(9); KA = param(10)+1; dB = param(11);
	% --------------------------------------------------------------
	% --------------------------------------------------------------

	i=1;
	while i<UpL
	    i=i+1;
	    t(i)=t(i-1)+10^-3;
	    A(i)=A(i-1)+(CI*I(i-1)^(nI)/((I(i-1)^nI+KI)*(CB*B(i-1)^nB+KB))-dA*A(i-1))*dt;
	    if A(i)<0
	        A(i)=0;
	    end
	    B(i)=B(i-1)+(CA*A(i-1)^nA/(KA+A(i-1)^nA)-dB*B(i-1))*dt;
	    if B(i)<0
	        B(i)=0;
	    end
	end
	re=B/max(B);
end
