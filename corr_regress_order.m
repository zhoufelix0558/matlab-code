function CORR_REASULT = corr_regress_order( Params )
%% ����˵��
%�������벻ͬ������Ͳ�ͬ�����Ա���֮�����ضȡ�
%����ı������������������������Զ�������
% Params.DATA_X             �Ա���
% Params.DATA_Y             �����
% Params.CorrArray          ϵ������         
% Params.Plot               �Ƿ񻭳�ͼ��(true:��       false:��)

%% ʹ������
% coff.DATA_X = Magnitude1;
% coff.DATA_Y = Distance;
% coff.CorrArray = -0.2:0.001:0.2;
% coff.Plot = true;
% bu = corr_regress_order(coff);

%% ��������

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