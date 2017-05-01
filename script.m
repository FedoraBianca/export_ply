nume_fisier = 'torus.ply';
nr_puncte = 100;
Points = zeros(nr_puncte,3);
Colors = ones(nr_puncte,3);
[nr_linii,nr_coloane] = size(Points);

header = 'ply\n';
header = [header, 'format ascii 1.0\n'];
header = [header, 'element vertex ', num2str(nr_puncte), '\n'];
header = [header, 'property float32 x\n'];
header = [header, 'property float32 y\n'];
header = [header, 'property float32 z\n'];
header = [header, 'property uchar red\n'];
header = [header, 'property uchar green\n'];
header = [header, 'property uchar blue\n'];
header = [header, 'end_header\n'];

data = [Points, double(Colors)];

fid = fopen(nume_fisier, 'w');
fprintf(fid, header);
dlmwrite(nume_fisier, data, '-append', 'delimiter', '\t', 'precision', 3);
fclose(fid);