function Hog1_STL1_WT_2(app)

        model_name = {'Hog-1 4-Gene State Model STL1(WT 0.2M NaCl)'};
        TMP(1,1:5) = {'1','-','x1(1)','k12_*(x1==1)+k23_*(x1==2)+k34_*(x1==3)','n'};
        TMP(2,:) = {'2','x1(1)','-','k21_*(x1==2)*I1_+k32_*(x1==3)+k43_*(x1==4)','n'};
        TMP(3,:) = {'3','-','x2(1)','kr1_*(x1==1)+kr2_*(x1==2)+kr3_*(x1==3)+kr4_*(x1==4)','n'};
        TMP(4,:) = {'4','x2(1)','-','kg_*(x2)','n'};
        app.p_values = {1.3,1,0.0067, 0.027, 0.13, 0.038, 0.0049, 7.8e-4, 0.012, 0.99, 0.054};
        app.i_values = {'max(0,3200*(1-(2.4*(9.3e9*(((1-exp(-(6.9e-5)*t))*exp(-(7.1e-3)*t))/(1+(((1-exp(-(6.9e-5)*t))*exp(-(7.1e-3)*t))/(6.4e-4))))^3.1))))'};
        app.citation = {'Neuert, G., Munsky, B., Tan, R. Z., Teytelman, L., Khammash, M., & van Oudenaarden, A. (2013). Systematic Identification of Signal-Activated Stochastic Gene Regulation. Science, 339(6119), 584–587.'};
        app.UITable2.Data = TMP;
        
end