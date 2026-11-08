function rootDir = setup_ev_wind()
%SETUP_EV_WIND Configure this repository for use from any MATLAB folder.
%
%   rootDir = setup_ev_wind() adds the repository root to the MATLAB path,
%   returns its absolute path, and does not change the current folder.

rootDir = fileparts(mfilename('fullpath'));
addpath(rootDir);
end
