# -*- coding: utf-8 -*-

import pyloco
import cartopy
import cartopy.util

default_projection = "PlateCarree"

class EarthPlotTask(pyloco.taskclass("ncplot")):
    """Create a plot for earth science

Examples
---------
"""
    _name_ = "earthplot"
    _version_ = "0.1.0"
    _install_requires = ["ncplot", "cartopy"]

    def __init__(self, parent):

        super(EarthPlotTask, self).__init__(parent)

        self.add_option_argument("--projection", default=default_projection, param_parse=True,
            help="set map projection (default=%s)" % default_projection)
        self.add_option_argument("--coastlines", action="store_true", help="add coastlines in a map")
        self.add_option_argument("--cyclic-point", param_parse=True, help="add cyclic point in an array")
        self.add_option_argument("--transform", param_parse=True, help="data transformation")


    def pre_perform(self, targs):

        super(EarthPlotTask, self).pre_perform(targs)

        self._env["cartopy"] = cartopy

        if targs.projection:
            projection = targs.projection.vargs[0]
            proj_args = ["%s=%s" % p for p in targs.projection.kwargs.items()]
            proj = "cartopy.crs.%s(%s)" % (projection, ", ".join(proj_args))

        else:
            proj = "cartopy.crs.%s()" % default_projection


        if hasattr(targs, "subplot") and targs.subplot:
            for subplot in targs.subplot:
                subplot.kwargs["projection"] = proj

        else:
            opt = pyloco.Option(projection=proj)
            targs.subplot = [opt]

        if targs.coastlines:
            opt = pyloco.Option()
            opt.context.append("coastlines")

            if hasattr(targs, "axes") and targs.axes:
                targs.axes.append(opt)

            else:
                targs.axes = [opt]

        if targs.cyclic_point:
            
            data = targs.cyclic_point.vargs[0]
            coord = targs.cyclic_point.kwargs.get("coord", None)

            import pdb; pdb.set_trace()
            if coord:
                exec("%s, %s = cartopy.util.add_cyclic_point(%s)" % (data, coord, str(targs.cyclic_point)), self._env)

            else:
                exec("%s = cartopy.util.add_cyclic_point(%s)" % (data, str(targs.cyclic_point)), self._env)


        import pdb; pdb.set_trace()
#ax = plt.axes(projection=ccrs.PlateCarree())
#ax.coastlines()
