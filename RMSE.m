function r=RMSE(qactual,qdesired)
    r=sqrt(sum((qactual(:)-qdesired(:)).^2)/numel(qactual));
end