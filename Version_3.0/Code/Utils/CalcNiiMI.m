function MI=CalcNiiMI(FNA,FNB)
A=floor(loadniidata(FNA));
B=floor(loadniidata(FNB));
M=max(max(A(:)),max(B(:)));
Mn=min(min(A(:)),min(B(:)));
Msk=isfinite(A) & isfinite(B) & A~=0 & B~=0;
H=hist3([A(Msk) B(Msk)],'Edges',{Mn:M Mn:M});
HA=histc(A(Msk),Mn:M);
HB=histc(B(Msk),Mn:M);
HA=HA./sum(HA);
HB=HB./sum(HB);
H=H./sum(H(:));
lHA=log(HA);
lHA(~isfinite(lHA))=0;
lHB=log(HB);
lHB(~isfinite(lHB))=0;
lH=log(H);
lH(~isfinite(lH))=0;
EA=(-HA')*lHA;
EB=(-HB')*lHB;
E=(-H(:)')*lH(:);
MI=EA+EB-E;