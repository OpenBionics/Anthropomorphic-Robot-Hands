## Introduction

A design optimization framework to derive optimal differential mechanism parameters, according to abduction motion of metacarpophalangeal (MCP) joint. For the index adduction/abduction, we employ the selectively lockable differential mechanism that has the ability to vary its displacement when fingers are locked. To simplify the kinematic analysis, we assume that tendons remain vertical and the input force of the differential mechanism is equally distributed to the remaining 3 digits.

## Working Example

In Figure 1, the design optimization parameters of the differential mechanism are presented.

<img src="https://github.com/OpenBionics/Anthropomorphic-Robot-Hands/blob/master/Media/whiffletreeOptimization.png" width="60%" height="60%" />

Figure 1. Design optimization parameters.

Given the actuator displacement d<sub>a</sub>, the main bar radius r<sub>m</sub>, the index bar radius r<sub>i</sub>, the length of tendon tendon from actuator to the main bar l<sub>m</sub> and the length of tendon tendon from the main bar to the index bar l<sub>i</sub> we get the Cartesian points (x<sub>c</sub>,y<sub>c</sub>) and (x<sub>mr</sub>,y<sub>mr</sub>). With these points we can derive the configuration of the differential mechanism. 

Next, we observe that for every mm of index bar length increasing and for a specific actuator displacement, we get proportional differential motion. So we construct the characteristic curve of the differential mechanism and we get the desired length of the inde bar r<sub>ir</sub> as 

![equation](https://github.com/OpenBionics/Anthropomorphic-Robot-Hands/blob/master/Media/equation1.png).
