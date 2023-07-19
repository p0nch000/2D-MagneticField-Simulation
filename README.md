# 2D-MagneticField-Simulation
This MATLAB code calculates and visualizes the magnetic field of an ideal coil, represented as multiple loops. It uses the Biot-Savart law to compute the magnetic field at points in the y-z plane and displays it in two color plots.

This MATLAB code simulates and displays the magnetic field produced by an ideal coil consisting of multiple loops. The coil is defined by parameters such as the radius (R), current (I), number of segments (N), number of loops (M), and spacing between loops (dZ).

The code generates a grid of points in the y-z plane and initializes matrices to store the magnetic field components (Bx, By, Bz). It then iterates over each loop and segment within the coil to calculate the magnetic field at each point in the grid.

For each segment, the code determines its position on the coil based on the current loop and segment indices. It calculates the coordinates (X, Y) of the segment, as well as the changes in coordinates (dxi, dyi) with respect to the angle (theta).

Using the Biot-Savart law, the code computes the distances between each grid point and the segment (rx, ry, rz, r). These distances are used to update the magnetic field components (Bx, By, Bz) according to their respective formulas.

The code also computes the magnitude of the magnetic field (B) by calculating the Euclidean norm of Bz and By.

Finally, the code visualizes the magnetic field by creating two figures. The first figure displays a color plot of the magnetic field magnitude (B) in the y-z plane. It also overlays magnetic field lines to visualize the direction of the field. The second figure shows a similar color plot of the magnetic field magnitude (B), but without the field lines.

The figures are labeled with appropriate titles and axis labels to provide a clear representation of the magnetic field produced by the ideal coil.
