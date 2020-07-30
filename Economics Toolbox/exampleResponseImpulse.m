%% Example irf with bounds

load Data_JDanish

Mdl = varm(4,2);
Mdl.SeriesNames = DataTable.Properties.VariableNames;
Mdl = estimate(Mdl,DataTable.Series);

%%
rng(1); % For reproducibility
[Response,Lower,Upper] = irf(Mdl);

irfshock2resp3 = Response(:,2,3);
IRFCIShock2Resp3 = [Lower(:,2,3) Upper(:,2,3)];

%%


Length = 0:1:19;

figure;
%plot(0:19,irfshock2resp3);
hold on
plot(0:19,IRFCIShock2Resp3(:,2));
hold on
plot(0:19,IRFCIShock2Resp3(:,1));
fill([Length fliplr(Length)], [IRFCIShock2Resp3(:,2)', fliplr(IRFCIShock2Resp3(:,1)')], 'r');
%legend([h1 h2(1)],["IRF" "95% Confidence Interval"])
xlabel("Time Index");
ylabel("Response");
title("IRF of IB When Y Is Shocked");
grid on
hold off
%%
ResponseImpulse(Mdl)

%%
x=0:0.1:10;
y1=exp(-x/2);
y2=exp(-x/3);
figure
hold all
plot(x,y1)
plot(x,y2)
patch([x fliplr(x)], [y1 fliplr(y2)], 'g')
hold off