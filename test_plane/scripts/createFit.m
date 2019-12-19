function [fitresult, gof] = createFit(X, Y, Z)
%CREATEFIT(X,Y,Z)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : X
%      Y Input : Y
%      Z Output: Z
%      Weights : Z
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 03-Dec-2019 11:12:31 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData, zData, weights] = prepareSurfaceData( X, Y, Z, Z );

% Set up fittype and options.
ft = fittype( 'poly11' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Weights = weights;

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, [xData, yData], zData );
legend( h, 'untitled fit 1', 'Z vs. X, Y with Z', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'X', 'Interpreter', 'none' );
ylabel( 'Y', 'Interpreter', 'none' );
zlabel( 'Z', 'Interpreter', 'none' );
grid on
view( 57.7, -90.0 );


