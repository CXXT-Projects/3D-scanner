function [fitresult, gof] = createFit1(x2, y2, z2)
%CREATEFIT1(X2,Y2,Z2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x2
%      Y Input : y2
%      Z Output: z2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 12-Dec-2019 14:37:27 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData, zData] = prepareSurfaceData( x2, y2, z2 );

% Set up fittype and options.
ft = fittype( 'poly11' );

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, [xData, yData], zData );
legend( h, 'untitled fit 1', 'z2 vs. x2, y2', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x2', 'Interpreter', 'none' );
ylabel( 'y2', 'Interpreter', 'none' );
zlabel( 'z2', 'Interpreter', 'none' );
grid on
view( 182.1, 52.3 );


