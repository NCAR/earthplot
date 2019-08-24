import os

cfgs = {
    "ubuntu": {
        "testdatadir": "/Users/youngsun/repos/github/nctools/tests/data",
        "datadir": "/Users/youngsun/temp"
    },
    "opensuse": {
        "testdatadir": "/home/youngsung/repos/github/nctools/tests/data",
        "datadir": "/home/youngsung"
    },
}

opensuse = os.path.isdir(cfgs["opensuse"]["testdatadir"] and cfgs["opensuse"]["datadir"])
ubuntu = os.path.isdir(cfgs["ubuntu"]["testdatadir"] and cfgs["ubuntu"]["datadir"])

imgfile = "test-opensuse.png"

[setup*]
if os.path.exists(imgfile):
    os.remove(imgfile)


[teardown*]
if os.path.exists(imgfile):
    os.remove(imgfile)

[plot@opensuse]

out@manager = earthplot.py \
    __{cfgs["opensuse"]["testdatadir"]}__/sresa1b_ncar_ccsm3-example.nc \
    --import os \
    -p 'lon[:], lat[:], ua[0,0,:,:]@contourf' \
    --cyclic-point 'ua, coord=lon' \
    --projection 'PlateCarree,central_longitude=180.0' \
    --assert-output "os.path.exists('__{imgfile}__')" \
    --noshow --save "'__{imgfile}__'" \
    --backend WebAgg

[plot@ubuntu]

out@manager = earthplot.py \
    __{cfgs["opensuse"]["testdatadir"]}__/sresa1b_ncar_ccsm3-example.nc \
    --import os \
    -p 'lon[:], lat[:], ua[0,0,:,:]@contourf' \
    --cyclic-point 'ua, coord=lon' \
    --projection 'PlateCarree,central_longitude=180.0' \
    --assert-output "os.path.exists('__{imgfile}__')" \
    --noshow --save "'__{imgfile}__'" \
    --backend WebAgg

#
#coastlines:
#	nctools earthplot.py \
#	${TESTDATADIR}/sresa1b_ncar_ccsm3-example.nc \
#	--coastlines 'color="grey"' \
#	--stock-image \
#	-p 'lon[:], lat[:], ua[0,0,:,:]@contourf' \
#	--cyclic-point 'ua, coord=lon' \
#	--projection 'PlateCarree,central_longitude=180.0'
#
#	#--backend WebAgg
#
#projection:
#	nctools earthplot.py \
#	${TESTDATADIR}/sresa1b_ncar_ccsm3-example.nc \
#	--coastlines 'color="grey"' \
#	--stock-image \
#	-p 'lon[:], lat[:], ua[0,0,:,:]@contourf' \
#	--cyclic-point 'ua, coord=lon' \
#	--projection 'AlbersEqualArea,central_longitude=180.0'
#
##	--backend WebAgg
#
#info:
#	nctools earthplot.py \
#	${TESTDATADIR}/sresa1b_ncar_ccsm3-example.nc \
#	--coastlines 'color="grey"' \
#	--stock-image \
#	-p 'lon[:], lat[:], ua[0,0,:,:]@contourf@ax@myplot' \
#	--cyclic-point 'ua, coord=lon' \
#	--projection 'PlateCarree,central_longitude=180.0' \
#	--title '"%s (%s)" % (ua.original_name, ua.original_units)' \
#	--colorbar '_plots_["myplot"]' \
#	-x '[-180, -120, -60, 0, 60, 120, 180], crs=cartopy.crs.PlateCarree()@ticks' \
#	-x 'lon.long_name@label' \
#	-y '[-78.5, -60, -25.5, 25.5, 60, 80], crs=cartopy.crs.PlateCarree()@ticks' \
#	-y 'lat.long_name@label'
#
##	--backend WebAgg
#
#	#--cyclic-point 'ua, coord=lon' \
#
#	#-p 'lon[:], lat[:], U[0,:,:], V[0,:,:],transform=cartopy.crs.PlateCarree()@quiver' \
#	#nctools --multiproc 2 --clone 'var=("ua[0,0,:,:]", "ua[0,1,:,:]"),level=("0", "1")' \
#	#--title '"%s (%s) - level %d" % (ua.original_name, ua.original_units, _{level:clone}_)' \
#
#multiproc:
#	nctools --multiproc 2  --clone 'var=("ua[0,0,:,:]", "ua[0,1,:,:]", "ua[0,2,:,:]"),level=("0", "1", "2")' \
#	--log proc.log \
#	-- earthplot.py \
#	${TESTDATADIR}/sresa1b_ncar_ccsm3-example.nc \
#	--coastlines 'color="grey"' \
#	--stock-image \
#	-p 'lon[:], lat[:], _{var:clone}_@contourf@ax@myplot' \
#	--cyclic-point 'ua, coord=lon' \
#	--projection 'PlateCarree,central_longitude=180.0' \
#	--title '"%s (%s)" % (ua.original_name, ua.original_units)' \
#	--colorbar '_plots_["myplot"]' \
#	-x '[-180, -120, -60, 0, 60, 120, 180], crs=cartopy.crs.PlateCarree()@ticks' \
#	-x 'lon.long_name@label' \
#	-y '[-78.5, -60, -25.5, 25.5, 60, 80], crs=cartopy.crs.PlateCarree()@ticks' \
#	-y 'lat.long_name@label'
#
#	#--debug \
#	#--backend WebAgg
#
#mprocdev:
#	nctools --multiproc 2 --clone 'var=("ua[0,0,:,:]", "ua[0,1,:,:]", "ua[0,2,:,:]"),level=("0", "1", "2")' \
#	--log proc.log \
#	-- earthplot.py \
#	${TESTDATADIR}/sresa1b_ncar_ccsm3-example.nc \
#	--coastlines 'color="grey"' \
#	--stock-image \
#	-p 'lon[:], lat[:], _{var:clone}_@contourf@ax@myplot' \
#	--cyclic-point 'ua, coord=lon' \
#	--projection 'PlateCarree,central_longitude=180.0' \
#	--title '"%s (%s) level - %d" % (ua.original_name, ua.original_units, _{level:clone}_)' \
#	--colorbar '_plots_["myplot"]' \
#	-x '[-180, -120, -60, 0, 60, 120, 180], crs=cartopy.crs.PlateCarree()@ticks' \
#	-x 'lon.long_name@label' \
#	-y '[-78.5, -60, -25.5, 25.5, 60, 80], crs=cartopy.crs.PlateCarree()@ticks' \
#	-y 'lat.long_name@label'
#
#	#--debug \
#	#--backend WebAgg
#
#quiver:
#	nctools earthplot.py \
#	${DATADIR}/cesm.nc \
#	--subplot '111, projection=ccrs.PlateCarree()' \
#	--coastlines 'color="grey"' \
#	--stock-image \
#	--axes '[230, 280, 20, 60], cartopy.crs.PlateCarree()@set_extent' \
#	-p 'lon[:], lat[:], U[0,:,:], V[0,:,:],transform=cartopy.crs.PlateCarree(), minshaft=2@quiver' \
#	--projection 'PlateCarree,central_longitude=180.0'
#
##	--debug \
##	--backend WebAgg
#
## Still working
#barbs:
#	nctools earthplot.py \
#	${DATADIR}/cesm.nc \
#	--subplot '111, projection=ccrs.PlateCarree()' \
#	--coastlines 'color="grey"' \
#	--stock-image \
#	--axes '[230, 280, 20, 60], cartopy.crs.PlateCarree()@set_extent' \
#	-p 'lon[:], lat[:], U[0,:,:], V[0,:,:],transform=cartopy.crs.PlateCarree()@barbs' \
#	--projection 'PlateCarree,central_longitude=180.0'
#
##	--debug \
##	--backend WebAgg
#
##.barbs(x, y, u, v, length=5,
##             sizes=dict(emptybarb=0.25, spacing=0.2, height=0.5),
##             linewidth=0.95, transform=vector_crs)
##             case.cam.rs.0001-01-06-00000.nc
#	     
