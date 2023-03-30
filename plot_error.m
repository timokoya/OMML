function  plot_error(iter,error)

  % draw a line with given weight and bias parameters
title('The optimized error using anyltical approach')
hold on
xlabel('iteration');ylabel('error value');
plot(iter,error,'--ms','LineWidth',1,...
                       'MarkerEdgeColor','r',...
                       'MarkerFaceColor','y',...
                       'MarkerSize',5)
drawnow()
end