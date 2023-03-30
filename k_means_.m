function final = k_means_(k, distance)
load kmeansdata;
    if k >5
        warning('k must be between 1-5 for fast results'); % error message for incorrect k
    end
    if ~exist('distance', 'var')
        distance = 'euclidean'; % requested
    end
    
    [r,c] = size(X); % get rows and columns in data set
    centroids = zeros(k,2); % initialise empty vector for centroids
    for i = 1:size(centroids,1)
       centroids = rand(k,c); % random initialisation
    end
    
    temp = zeros(r,1); % temporary vector for cluster
   
    % algorithm
    
    while true % !converged
        dist = pdist2(X,centroids,distance); % distance between all data points and centroids
        [data, cluster] = min(dist,[],2); % find minimum distance of all points to the nearest centroid
        if cluster == temp 
            break; % when centroids don't change between iterations
        else
            temp = cluster; % assign cluster index's to vector
        end
        for i = 1:k
            clusterID = find(cluster == i);
            centroids(i,:) = mean(X(clusterID,:),1); % re-compute centroids
        end   
    end
    
    final = [X,cluster]; % matrix of orginal data points and their cluster group
    % scatter plot of data according to # of clusters
   
    figure();
    hold on;
    title('Kmeans Clustering');
     for i = 1:size(final,1)
         if final(i,end) == 1
             scatter(final(i,1),final(i,2),'fill','MarkerFaceColor','red');
         elseif final(i,end) == 2
             scatter(final(i,1),final(i,2),'fill','MarkerFaceColor','blue');
         elseif final(i,end) == 3
             scatter(final(i,1),final(i,2),'fill','MarkerFaceColor','green');
         elseif final(i,end) == 4
             scatter(final(i,1),final(i,2),'fill','MarkerFaceColor','yellow');
         else
             scatter(final(i,1),final(i,2),'fill','MarkerFaceColor','black');
         end
     end
     hold off;
end
           