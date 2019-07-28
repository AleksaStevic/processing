# Times Table / Circle Simulation
This simulation is inspired by [Mathologer](https://www.youtube.com/channel/UC1_uAIS3r8Vu6JjXWvastJg).

This simulation creates a circle of points. Every point has a value which is between 0 and `pointsNumber` (the number of points on a circle). Every point is multiplied by a value (quotient) and `the result of multiplification % pointsNumber` is a value of some other point on the circle. The two points are then connected by line.

For example, let's have 10 points, and let's multiply every point by 2. The first point has a value of 0 and the result of multiplication is 0. The second point has a value of 1, the result of multiplication `1 * 2` is 2, which is the next point in the circle, the point with value of 1 and the point with value of 2 are connected by a line. The point with value 2 is connected to point with value 4, the point with value 6 is connected to the point with value 2 (because: `6 * 2 = 12, 12 % 10 is 2`), etc.

As you increase the quotient and pointsNumber by pressing certain keys in the keyboard, very interesting figures start to emerge in the circle. For example for `quotient = 2` and pointsNumber continuously increasing, [Cardioid](https://en.wikipedia.org/wiki/Cardioid) will start to emerge.

More information can be found on [this](https://www.youtube.com/watch?v=qhbuKbxJsk8) Mathologer video.