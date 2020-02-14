## Introduction

A design optimization framework to derive optimal differential mechanism parameters, according to abduction motion of metacarpophalangeal (MCP) joint. For the index adduction/abduction, we employ the selectively lockable differential mechanism that has the ability to vary its displacement when fingers are locked. To simplify the kinematic analysis, we assume that tendons remain vertical and the input force of the differential mechanism is equally distributed to the remaining 3 digits.

## Working Example

In Figure 1, the design optimization parameters of the differential mechanism are presented.

<img src="https://github.com/OpenBionics/Anthropomorphic-Robot-Hands/blob/master/Media/whiffletreeOptimization.png" width="60%" height="60%" />

Figure 1. Design optimization parameters.

Given the actuator displacement d<sub>a</sub>, the main bar radius r<sub>m</sub>, the index bar radius r<sub>rl</sub>, the length of tendon tendon from actuator to the main bar l<sub>m</sub>, and the length of tendon tendon from the main bar to the index bar l<sub>r</sub>, we obtain the configuration of the index bar (x<sub>r</sub>,y<sub>r</sub>) and of the main bar (x<sub>mr</sub>,y<sub>mr</sub>) by solving a nonlinear equality constraint optimization scheme. Next, we can derive the full configuration of the differential mechanism. 


## Notes

Please open a [GitHub issue](https://github.com/OpenBionics/Anthropomorphic-Robot-Hands/issues) if you encounter any problem.
