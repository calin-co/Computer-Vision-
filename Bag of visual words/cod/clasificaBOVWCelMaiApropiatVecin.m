function eticheta = clasificaBOVWCelMaiApropiatVecin(histogramaBOVW_test,histogrameBOVW_exemplePozitive,histogrameBOVW_exempleNegative)
% eticheta = eticheta celui mai apropiat vecin (in sensul distantei Euclidiene)
% eticheta = 1, daca cel mai apropiat vecin este un exemplu pozitiv,
% eticheta = 0, daca cel mai apropiat vecin este un exemplu negativ. 
% Input: 
%       histogramaBOVW_test - matrice 1 x K, histograma BOVW a unei imagini test
%       histogrameBOVW_exemplePozitive - matrice #ImaginiExemplePozitive x K, fiecare linie reprezinta histograma BOVW a unei imagini pozitive
%       histogrameBOVW_exempleNegative - matrice #ImaginiExempleNegative x K, fiecare linie reprezinta histograma BOVW a unei imagini negative
% Output: 
%     eticheta - eticheta dedusa a imaginii test

histogramaBOVW_test_poz = repmat(histogramaBOVW_test,size(histogrameBOVW_exemplePozitive,1), 1);
distEuclid =sum ( ((histogramaBOVW_test_poz - histogrameBOVW_exemplePozitive) .^ 2)');
minPosExampleDist =  min(distEuclid);

histogramaBOVW_test_neg = repmat(histogramaBOVW_test,size(histogrameBOVW_exempleNegative,1), 1);
distEuclid =sum( ((histogramaBOVW_test_neg - histogrameBOVW_exempleNegative) .^ 2)');
minNegExampleDist =  min(distEuclid);

if minPosExampleDist < minNegExampleDist
    eticheta = 1;
else
    eticheta = 0;
end

end
