**Robotic System for Drawing "B" and "E" Using a Cockroach Leg**

This project utilizes a combination of hardware and software to control a system comprising a cockroach leg, NI myDAQ, Analog Discovery 2, a motor, and a voltage regulator. The MATLAB script facilitates precise control of motor movements and leg contractions/extensions to trace the shapes "B" and "E."

_Features_
- Cockroach Leg Integration: The cockroach leg reacts to voltage signals for contraction and extension.
- Motor Control: The motor is operated using PWM signals for precise positioning.
- Hardware Integration: NI myDAQ and Analog Discovery 2 are used for data acquisition and signal generation.
- Smooth Motion: Gradual duty cycle transitions ensure realistic and smooth movements.

_Hardware Requirements_
- Cockroach Leg: Reacts to analog voltage signals for biological motion control.
- NI myDAQ: Generates PWM signals and analog output for motor and leg control.
- Analog Discovery 2: Provides additional signal generation and monitoring capabilities.
- Motor: Controlled by PWM to adjust angles precisely.
- Voltage Regulator: Ensures stable power supply for all components.

_Software Requirements_
- MATLAB: With Data Acquisition Toolbox for hardware communication.

_Setup Instructions_
- Hardware Connections:
  - Connect the NI myDAQ and Analog Discovery 2 to the computer.
  - Attach the cockroach leg to the signal output for leg movements.
  - Wire the motor and voltage regulator for stable operation.
- Software Configuration:
  - Ensure MATLAB is installed with the Data Acquisition Toolbox.
  - Open the CMI.m script in MATLAB.
- Run the Script.
- Observe Movements: The motor and leg will execute motions to trace the shapes "B" and "E."

_Functional Details_

Shape "B"
- Backbone:
  - Motor moves to trace the straight vertical line.
  - Leg extends using a low-frequency sine wave.
- Top Curve:
  - Motor rotates incrementally to draw the curve.
  - Leg contracts at high frequency to complete the curve.
- Bottom Curve:
  - Motor and leg repeat similar motions to complete the lower section.

Shape "E"
- Backbone:
  - Motor adjusts to trace the vertical backbone.
  - Leg extends slightly for precision.
- Top, Middle, and Bottom Lines:
  - Motor moves horizontally for each line.
  - Leg alternates between extension and contraction as needed.

_Parameters_
- PWM Frequency: Set to 50 Hz for smooth motor control.
- Sine Wave: Frequency and amplitude are customizable for leg motion.

_Customization_
- Adjust duty cycles to change motor positions.
- Modify sine wave parameters for different leg behaviors.

_Acknowledgements_

Contributors: Anika Koul, Arushi Mittal.
