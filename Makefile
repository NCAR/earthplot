#"--projection", "PlateCarree,central_longitude=0.0",
# AzimuthalEquidistant, AlbersEqualArea, EquidistantConic, LambertConformal
# LambertCylindrical, Mercator, Miller, Mollweide, Orthographic, Robinson
# Sinusoidal...

plot:
	nctools earthplot.py \
	/home/youngsung/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc \
	-p 'lon[:], lat[:], ua[0,0,:,:]@contourf' \
	--cyclic-point 'ua, coord=lon' \
	--projection 'PlateCarree,central_longitude=180.0' \
	--backend WebAgg

coastlines:
	nctools earthplot.py \
	/home/youngsung/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc \
	--coastlines 'color="grey"' \
	--stock-image \
	-p 'lon[:], lat[:], ua[0,0,:,:]@contourf' \
	--cyclic-point 'ua, coord=lon' \
	--projection 'PlateCarree,central_longitude=180.0' \
	--backend WebAgg

projection:
	nctools earthplot.py \
	/home/youngsung/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc \
	--coastlines 'color="grey"' \
	--stock-image \
	-p 'lon[:], lat[:], ua[0,0,:,:]@contourf' \
	--cyclic-point 'ua, coord=lon' \
	--projection 'AlbersEqualArea,central_longitude=180.0' \
	--backend WebAgg

info:
	nctools earthplot.py \
	/home/youngsung/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc \
	--coastlines 'color="grey"' \
	--stock-image \
	-p 'lon[:], lat[:], ua[0,0,:,:]@contourf@ax@myplot' \
	--cyclic-point 'ua, coord=lon' \
	--projection 'PlateCarree,central_longitude=180.0' \
	--title '"%s (%s)" % (ua.original_name, ua.original_units)' \
	--colorbar '_plots_["myplot"]' \
	-x '[-180, -120, -60, 0, 60, 120, 180], crs=cartopy.crs.PlateCarree()@ticks' \
	-x 'lon.long_name@label' \
	-y '[-78.5, -60, -25.5, 25.5, 60, 80], crs=cartopy.crs.PlateCarree()@ticks' \
	-y 'lat.long_name@label' \
	--backend WebAgg

	#--cyclic-point 'ua, coord=lon' \

	#-p 'lon[:], lat[:], U[0,:,:], V[0,:,:],transform=cartopy.crs.PlateCarree()@quiver' \

uv:
	nctools earthplot.py \
	/home/youngsung/cesm.nc \
	--subplot '111, projection=ccrs.PlateCarree()@ax' \
	--coastlines 'color="grey"' \
	--stock-image \
	--axes '[-45, 55, 20, 80], cartopy.crs.PlateCarree()@set_extent' \
	-p 'lon[:], lat[:], V[0,:,:], U[0,:,:],transform=cartopy.crs.PlateCarree()@quiver' \
	--projection 'PlateCarree,central_longitude=180.0' \
	--debug \
	--backend WebAgg

	#-p 'lon[:], lat[:], V[0,:,:],transform=cartopy.crs.PlateCarree()@contourf' \
#
#.barbs(x, y, u, v, length=5,
#             sizes=dict(emptybarb=0.25, spacing=0.2, height=0.5),
#             linewidth=0.95, transform=vector_crs)
#             case.cam.rs.0001-01-06-00000.nc
	     
