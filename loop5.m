function [re]=loop5(sig, param)
	UpL=length(sig);
	dt = 0.1;
	A=[];A(1)=0;
	B=[];B(1)=0;
	C=[];C(1)=0;
	Y=[];Y(1)=0;
	t=[];t(1)=0;

	I=sig;

	% A = [100,3,50,100,3,50,0.1,300,3,50,1,20,3,50,0.1];

	CI = param(1); nI = param(2); KI = param(3)+1; 
	CA = param(4); nA = param(5); KA = param(6)+1; dC = param(7);
	CB = param(8); nB = param(9); KB = param(10)+1; dA = param(11);
	CC = param(12); nC = param(13); KC = param(14)+1; dB = param(15);
	dY = param(16);

	i=1;
	while i<UpL
	    i=i+1;
	    t(i)=t(i-1)+10^-3;
	    % Input
	    A(i)=A(i-1)+((CC*C(i-1)^nC/(C(i-1)^nC+KC))*CI*I(i-1)^(nI)/(I(i-1)^nI+KI)-dA*A(i-1))*dt;
	    if A(i)<0
	        A(i)=0;
	    end
	    % Regulator
	    B(i)=B(i-1)+(CA/(A(i-1)^nA+KA)-dB*B(i-1))*dt;
	    if B(i)<0
	        B(i)=0;
	    end
	    % Output
	    C(i)=C(i-1)+(CB*B(i-1)^nB/(B(i-1)^nB+KB)-dC*C(i-1))*dt;
	    if C(i)<0
	        C(i)=0;
	    end
	    Y(i)=Y(i-1)+(CA/(A(i-1)^nA+KA)-dY*Y(i-1))*dt;
	    if Y(i)<0
	        Y(i)=0;
	    end
	end
	re=Y/max(Y);
end
