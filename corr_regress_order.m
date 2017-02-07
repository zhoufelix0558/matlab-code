function CORR_REASULT = corr_regress_order( Params )
%% 参数说明
%输入输入不同因变量和不同阶数自变量之间的相关度。
%输入的必须是向量，横竖向量函数自动调整。
% Params.DATA_X             自变量
% Params.DATA_Y             因变量
% Params.CorrArray          系数数列         
% Params.Plot               是否画出图形(true:是       false:否)

%% 使用样例
% coff.DATA_X = Magnitude1;
% coff.DATA_Y = Distance;
% coff.CorrArray = -0.2:0.001:0.2;
% coff.Plot = true;
% bu = corr_regress_order(coff);

%% 函数主体

SIZE_X = size(Params.DATA_X);
SIZE_Y = size(Params.DATA_Y);

    if (min(SIZE_X)~=1)||(min(SIZE_Y)~=1)
        error('Input MATRIX must be a vector like 1xN order Nx1')
    end
    
    if(SIZE_X(1)~=1)
        Params.DATA_X = Params.DATA_X';
    end
    
    if(SIZE_Y(1)~=1)
        Params.DATA_Y = Params.DATA_Y';
    end

CORR_REASULT = zeros(1,max(size(Params.CorrArray)));

    for cnt = 1:max(size(Params.CorrArray))
        CORR_REASULT(cnt) = min(min(corrcoef(Params.DATA_X.^Params.CorrArray(cnt),Params.DATA_Y)));
    end
    
    if(Params.Plot == true)
        plot(Params.CorrArray',CORR_REASULT)
        grid on
        xlabel('Index of X')
        ylabel('Coefficient')
        legend('Coefficient between X and Y')
    end
    
end