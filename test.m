clear
load data_30atom.mat

scatter(save_data(1,:,300), save_data(2,:,300), 'filled');
grid on
title('30 atoms')
xlim([1, 10]);
ylim([1, 10]);