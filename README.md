# EV-Wind-Coordinatioin
Emission-concerned wind-electric vehicle (EV) coordination on the transmission grid side

## Running in MATLAB

You do not need to enter any subfolder. Set the repository root as MATLAB's
Current Folder and run one of the entry scripts:

```matlab
Top_system1
```

`Top_system1.m` runs the three EV operating modes and generates the mode
figures. `Top_system.m` runs the comparison workflow using the shared model
scripts. Both entry scripts locate the repository automatically, add it to the
MATLAB path, and do not change the Current Folder. Figure files are saved in
the repository root.

If MATLAB is opened in another folder, run the script by its full path or
configure the path once:

```matlab
setup_ev_wind
```

The model requires MATLAB, [YALMIP](https://yalmip.github.io/), and the CPLEX
MATLAB interface. If MATLAB reports that `sdpvar` or `sdpsettings` is missing,
add YALMIP to the MATLAB path. If it reports that the CPLEX solver is missing,
install and configure CPLEX's MATLAB interface.

# modeling of EV (mainly from number/Electricity/arriving and leaving time, to the limitation of charging power) l1
# modeling of thermal and wind power (margin) l2
# min cost s.t. l1 & l2
# => charging demand/strategy of EV

# 系统的约束写好了，火电的处理和爬坡写好了
