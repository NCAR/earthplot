# -*- coding: utf-8 -*-

import pyloco
import earthplot

class EarthPlotTests(pyloco.TestCase):

    def test_coastline(self):

        #argv = ["/Users/youngsun/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc:/pr", "--coastline", "-p", "lon[:], lat[:], pr[0,:,:]@contourf", "--debug"]
        #argv = ["/Users/youngsun/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc:/pr", "-p", "lon[:], lat[:], pr[0,:,:]@contourf", "--debug"]
        #argv = ["/Users/youngsun/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc:/ua", "--coastlines", "--projection", "Mollweide", "-p", "lon[:], lat[:], ua[0,0,:,:]@contourf", "--debug"]
        argv = ["/Users/youngsun/repos/github/nctools/tests/data/sresa1b_ncar_ccsm3-example.nc:/ua", "--coastlines", "--projection", "PlateCarree,central_longitude=0.0", "-p", "lon[:], lat[:], ua[0,0,:,:]@contourf", "--debug", "--cyclic-point", "ua[:,:,:,:], coord=lon[:]"]
        retval, forward = self.perform_test(earthplot.EarthPlotTask, argv=argv)

