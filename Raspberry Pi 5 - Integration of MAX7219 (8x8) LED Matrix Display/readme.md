# Raspberry Pi 5 with MAX7219 (8x8) LED Matrix Display

This project demonstrates how to control an (8x8) LED Matrix Module MAX7219 using a Raspberry Pi 5. We'll create a Python program to display a single LED at specific coordinates on the matrix.

## Project Overview

This tutorial is for beginners to the Raspberry Pi and Python. You'll learn how to:

- Connect a Raspberry Pi 5 to an 8x8 LED Matrix Display (MAX7219).
- Install necessary Python libraries to control the LED matrix.
- Write a Python script to light up specific LEDs on the matrix.

## Hardware Requirements

- **Raspberry Pi 5**
- **8x8 LED Matrix Screen Module (MAX7219)**
- **Jumper Wires**
- **Breadboard (optional)**

### Wiring Diagram

| MAX7219 Pin | Raspberry Pi Pin (5) |
|-------------|------------------------|
| VCC         | 5V                     |
| GND         | GND                    |
| DIN         | GPIO 10 (MOSI)         |
| CS          | GPIO 8 (CE0)           |
| CLK         | GPIO 11 (SCLK)         |

> Ensure that the SPI interface is enabled on your Raspberry Pi. You can enable it by running `sudo raspi-config` and navigating to **Interfacing Options** > **SPI**.

## Software Setup

### Step 1: Clone the Repository and Install Dependencies

Start by cloning the `max7219` Python library from GitHub and installing it:

```bash
git clone https://github.com/rm-hull/max7219.git
cd max7219
sudo python setup.py install
```

Now install the `luma.led_matrix` library to control the LED matrix:

```bash
sudo -H pip3 install --upgrade luma.led_matrix
```

### Step 2: Python Program to Light a Single LED

Here's a simple Python script that lights up the LED on row 2, column 3 of the matrix:

```python
import RPi.GPIO as GPIO
from time import sleep
from luma.core.interface.serial import spi, noop
from luma.led_matrix.device import max7219
from luma.core.render import canvas

# Initialize SPI communication
serial = spi(port=0, device=0, gpio=noop())
device = max7219(serial, width=8, height=8, block_orientation=0)

# Set display contrast
device.contrast(10)

# Light up a single LED (Row 2, Column 3)
with canvas(device) as draw:
    draw.point((2, 3), fill="white")  # Fill LED at (row 2, col 3) with white

# Clean up GPIO on exit
GPIO.cleanup()
```

### Step 3: Running the Program

1. Save the Python script as `single_led.py`.
2. Make sure to run the script with `sudo` to ensure proper access to GPIO.

```bash
sudo python3 single_led.py
```

You should see the LED at row 2, column 3 light up on the matrix.

## Detailed Explanation of the Code

- **RPi.GPIO**: This library is used for GPIO control, although we don't need extensive use of GPIO here because SPI handles communication with the MAX7219.
- **luma.core and luma.led_matrix**: These libraries provide easy access to the MAX7219 driver. `spi` is used for communication, and `max7219` creates a device instance representing the 8x8 matrix.
- **canvas**: The `canvas` function is used to control individual pixels. In this case, we used the `point()` function to light up a specific LED.

## Additional Functionality

To display messages or more complex patterns, you can use the `show_message` function from the `luma.led_matrix` library. Here's an example that scrolls a message across the LED matrix:

```python
from luma.core.legacy import text, show_message
from luma.core.legacy.font import proportional, LCD_FONT

# Scroll a message on the matrix
show_message(device, "HELLO", fill="white", font=proportional(LCD_FONT), scroll_delay=0.1)
```

## Conclusion

In this project, we demonstrated how to light up a single LED on the MAX7219 8x8 LED matrix using a Raspberry Pi. From here, you can extend the code to display more complex patterns, animations, or scrolling text.

Feel free to contribute by improving the code or adding new features.

---

## Possible Future Extensions

- **Scrolling messages**: Display text messages across multiple matrix modules.
- **Animations**: Create fun LED animations.
- **Sensor Integration**: Trigger LED matrix changes based on sensor inputs (e.g., temperature, motion).

---

- by Aditya Kumar