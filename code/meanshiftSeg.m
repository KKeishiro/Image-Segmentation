function [map, peaks] = meanshiftSeg(img)

img = im2double(img);
X = reshape(img,[size(img,1)*size(img,2), 3]);

r = 0.03;
threshold = 0.05;
map = zeros(size(X,1),1);
peaks = [];

for i = 1:length(X)
    peak = find_peak(X, X(i,:), r);
    while 1
        new_peak = double(find_peak(X, peak, r));
        if norm(new_peak - peak) < threshold
            checker = 0;
            if ~isempty(peaks)
                for id = 1:size(peaks,1)
                    if norm(peaks(id,:) - new_peak) < r/2
                        map(i) = id;
                        checker = 1;
                        break
                    end
                end
            end
            if checker == 0
                peaks = [peaks; new_peak];
                map(i) = size(peaks,1);
            end
            break
        end
        peak = new_peak;
    end
end
% size(map)
% size(peaks)
map = reshape(map, [size(img,1), size(img,2)]);

end