%%


%ncdisp('vosaline_control_monthly_highres_3D_200801_CONS_v0.1.nc')

folder_name = 'dataset_oras5';
files = dir(fullfile(folder_name, '*.nc'));

%files = dir('*.nc');
names={files.name};
lon_p=zeros(1,170);
lat_p=zeros(1,170);
sal_p=zeros(1,170);

cd('dataset_oras5');

for j=1:1
z = j; %meters

% 955,777 latitud and longitud labrador sea
% 1030,499 Equator
i_lat = 1030;
i_lon = 499;


for i=1:numel(names)
    lon = ncread(names{i},'nav_lon');
    lon_1to75(j,i)=lon(i_lat,i_lon);
    sal = ncread(names{i},'vosaline');
    sal_1to75(j,i)=sal(i_lat,i_lon,z);
    lat = ncread(names{i},'nav_lat');
    lat_1to75(j,i)=lat(i_lat,i_lon);
    %i
    %j
    %lon=[];
    %sal=[];
    %lat=[];
end

sal = ncread('vosaline_control_monthly_highres_3D_200801_CONS_v0.1.nc','vosaline');
lon = ncread('vosaline_control_monthly_highres_3D_200801_CONS_v0.1.nc','nav_lon');
lat = ncread('vosaline_control_monthly_highres_3D_200801_CONS_v0.1.nc','nav_lat');
%depth = ncread('vosaline_control_monthly_highres_3D_200801_CONS_v0.1.nc','deptht');



%% 3dplot



for i=1:length(sal(:,1,1,1))
    for j=1:length(sal(1,:,1,1))
sal_d(i,j) = sal(i,j,10,1);
    end
end

plot3(lon,lat,sal_d,'k.')

end