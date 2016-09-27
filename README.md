# DynaSim

[![Join the chat at https://gitter.im/DynaSim/DynaSim](https://badges.gitter.im/DynaSim/DynaSim.svg)](https://gitter.im/DynaSim/DynaSim?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

DynaSim toolbox for modeling and simulating dynamical systems in Matlab or Octave

Download the DynaSim toolbox:
`git clone https://github.com/dynasim/dynasim.git`

Documentation:
- Get started with the demos: [demos/demos.m](https://github.com/DynaSim/DynaSim/blob/master/demos/demos.m)
- For more details and examples walk through the tutorial: [demos/tutorial.m](https://github.com/DynaSim/DynaSim/blob/master/demos/tutorial.m)
- Example modeling projects: [PFC networks](https://github.com/jsherfey/PFC_models), [Thalamus](https://github.com/asoplata/ching2010_tcre_dynasim_mechanisms)

Mailing lists:
- Join the [user mailing list](https://groups.google.com/forum/#!forum/dynasim-users) to ask questions, request features, report bugs, and discuss DynaSim related issues
- Join the [developer mailing list](https://groups.google.com/forum/#!forum/dynasim-developers) or email [Jason Sherfey](http://jasonsherfey.com/) if you are interested in becoming a collaborator on DynaSim


This fork contains David Stanley's customizations to DynaSim. Changes incliude:

+ 'parallel_flag' option in SimulateModel.m now works (it will produce some warnings due to lock files on server, but these can be ignored)
+ New plotting command PlotFR2.m, an expansion of Jason's PlotFR command with better functionality for handling parameter sweeps (only works with plotting single variables for now).
+ Utility CalcAverages.m, which operates on a DynaSim data structure and averages over all cells. This structure can then be passed to PlotData as a means to force PlotData to produce average plots.

