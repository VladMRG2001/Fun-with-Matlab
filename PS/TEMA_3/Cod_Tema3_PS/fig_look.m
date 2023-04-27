%
%	File FIG_LOOK.M
%
%	Function: FIG_LOOK
%
%	Call:	fig_look(H,lw) ;
%
%	Set some parameters that change the general aspect (look) 
%	of the figure with handle H. If H is missing or empty, the 
%	current figure is affected. The second parameter, lw, if specified 
%	and non-empty stands for the desired line width of graphics. 
%	By default, lw=0.5. Normally, lw should be non-negative. 
%
%	Uses:	 
%
%	Author:	 Dan STEFANOIU
%	Created: November 1, 2002
%	Updated: October 27, 2008
%

function fig_look(H,lw) 

%
% BEGIN
%
% Faults preventing
% ~~~~~~~~~~~~~~~~~
	if (nargin < 1)
	   H = gcf ; 	   
	end ;
	if (isempty(H))
	   H = gcf ; 
	end ; 
	if (nargin < 2)
	   lw = 0.5 ; 
	end ; 
	if (isempty(lw))
	   lw = 0.5 ; 
	end ; 
	lw = abs(lw) ; 
	if (~lw)
	   lw = 0.5 ; 
	end ; 
%
% Fixing the look
% ~~~~~~~~~~~~~~~
	% Axes : 
	set(H,'DefaultAxesFontName','Helvetica') ; 
	set(H,'DefaultAxesFontSize',14) ; 
	set(H,'DefaultAxesFontWeight','demi') ;  	% or 'light', 'normal', 'bold'
	set(H,'DefaultAxesFontAngle','normal') ;	% or 'italic', 'oblique'
	set(H,'DefaultAxesLineWidth',1) ; 

	% Text over figure:
	set(H,'DefaultTextFontName','Helvetica') ; 
	set(H,'DefaultTextFontSize',14) ; 
	set(H,'DefaultTextFontWeight','demi') ; 	% or 'light', 'normal', 'bold'
	set(H,'DefaultTextFontAngle','normal') ; 	% or 'italic', 'oblique'
	set(H,'DefaultTextRotation',0) ; 		% Horizontal writing. 
%	set(H,'DefaultTextRotation',90) ; 		% Vertical writing. 
%	set(H,'DefaultTextRotation',????) ; 		% Oblique writing. 
	set(H,'DefaultTextHorizontalAlignment','center') ; % or 'left', 'right' 

	% 2D graphic line: 
	set(H,'DefaultLineLineStyle','-') ;  		% or '-', ':', etc.
	set(H,'DefaultLineLineWidth',lw) ; 
	set(H,'DefaultLineMarkerSize',8) ; 

	% 3D graphic lines and surfaces: 
	set(H,'DefaultSurfaceLineStyle','none') ; 	% or '-', ':', etc.
	set(H,'DefaultSurfaceLineWidth',lw) ; 
	set(H,'DefaultSurfaceMarkerSize',8) ; 
	set(H,'DefaultSurfaceFaceColor','interp') ; 
	set(H,'DefaultSurfaceFaceLighting','phong') ; 

	% Background color outside axes
	set(H,'Color',[87 92 98]/100) ; 		% Light turquoise. 
							% See colormap for more colors
%
% END
%
