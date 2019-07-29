# -*- coding: utf-8 -*-

import pyloco
import earthplot

class EarthPlotTests(pyloco.TestCase):

    def test_coastline(self):

            #"--projection", "PlateCarree,central_longitude=0.0",
            # AzimuthalEquidistant, AlbersEqualArea, EquidistantConic, LambertConformal
            # LambertCylindrical, Mercator, Miller, Mollweide, Orthographic, Robinson
            # Sinusoidal...
            #"/home/youngsung/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc:/ua",

        argv = [
            "/home/youngsung/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc",
            "--coastlines", "color='grey'",
            "--title", "'%s (%s)' % (ua.original_name, ua.original_units)",
            "--stock-image",
            "--colorbar", "_plots_['myplot']",
            "--projection", "PlateCarree,central_longitude=180.0",
            "-p", "lon[:], lat[:], ua[0,0,:,:]@contourf@ax@myplot",
            "-x", "[-180, -120, -60, 0, 60, 120, 180], crs=cartopy.crs.PlateCarree()@ticks",
            "-x", "'LON'@label",
            "-y", "[-78.5, -60, -25.5, 25.5, 60, 80], crs=cartopy.crs.PlateCarree()@ticks",
            "-y", "'LAT'@label",
            "--cyclic-point", "ua, coord=lon",
            "--debug",
            "--backend", "WebAgg",
        ]

           #"/Users/youngsun/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc:/ua",
#        argv = [
#            "/home/youngsung/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc:/ua",
#            "--coastlines", "color='grey'",
#            "--projection", "PlateCarree,central_longitude=180.0",
#            "-p", "lon[:], lat[:], ua[0,0,:,:]@contourf@ax@myplot",
#            "--debug",
#            "--backend", "WebAgg",
#        ]

            #"-x", "ua.dimensions[0], crs=cartopy.crs.PlateCarree()@label",

        retval, forward = self.perform_test(earthplot.EarthPlotTask, argv=argv)

