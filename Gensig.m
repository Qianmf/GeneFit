function [re]=Gensig(period,Last,UpL,St)
	UpL=UpL*10^3;St=St*10^3;period=period*10^3;Lasttime=Last*10^3;
	P=[];
	for i=1:floor(St/period)
		P(i,1)=1+(i-1)*period;
		P(i,2)=Lasttime;
	end
	
	Hp = size(P,1);
	I=zeros(1,UpL+1);
	for i=[1:Hp]
	    a=P(i,1);
	    for j=[1:P(i,2)]
	        I(a)=I(a)+5;
	        a=a+1;
	    end
	    for j=[P(i,1)+P(i,2):UpL]
	    	I(a)=I(a)+5*exp(-(a-P(i,1)-P(i,2))/5000);
	    	a=a+1;
	    end
	end
	re=I;
end
