%% Plotting an Efficient Frontier Using portopt

% code by matlab mathworks

%% Definindo retornos, sd e correla��es:
Returns      = [0.1 0.15 0.12];
STDs         = [0.2 0.25 0.18];
Correlations = [1 0.3 0.4
                0.3 1 0.3
                0.4 0.3 1];

%% Covariancia
Covariances = corr2cov(STDs, Correlations);

%% Plotando o objeto
portopt(Returns, Covariances, 20)

%% Generating random portfolios
rng('default')
Weights = rand(1000, 3);
       
%% Transformando o portfolio em peso 1
Total = sum(Weights, 2);
Total = Total(:,ones(3,1));
Weights = Weights./Total; 

%% Risk and return...
[PortRisk, PortReturn] = portstats(Returns, Covariances, ...
                         Weights);
                     
%% Gr�fico fronteira eficiente
portopt(Returns, Covariances, 20)
hold on
plot (PortRisk, PortReturn, '.r')
title('Mean-Variance Efficient Frontier and Random Portfolios')
hold off 