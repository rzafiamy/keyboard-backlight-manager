# Keyboard Backlight Manager ( Linux )

This repository contains the `kbd_backlight_control.sh` script, designed to manage the brightness of the keyboard backlight on Linux systems using the D-Bus interface. The script supports adjusting the backlight brightness up or down and querying the current and maximum brightness levels.

## Features

- **Increase Brightness**: Increment the keyboard backlight brightness by one unit.
- **Decrease Brightness**: Decrement the keyboard backlight brightness by one unit.
- **Check Status**: View the current and maximum brightness levels of the keyboard backlight.

## Prerequisites

The script uses `dbus-send` to communicate with the system's D-Bus interface, which should be available by default on most Linux distributions. Ensure you have the necessary permissions to execute D-Bus commands related to the keyboard backlight.

## Installation

Clone this repository to your local machine using:

```bash
git clone https://github.com/rzafiamy/keyboard-backlight-manager.git
```

Navigate to the directory containing the script:

```bash
cd keyboard-backlight-manager
```

Make the script executable:

```bash
chmod +x kbd_backlight_control.sh
```

## Usage

To use the script, run one of the following commands:

- **Increase Brightness**:
  ```bash
  ./kbd_backlight_control.sh up
  ```
- **Decrease Brightness**:
  ```bash
  ./kbd_backlight_control.sh down
  ```
- **Check Status**:
  ```bash
  ./kbd_backlight_control.sh status
  ```

## Contributing

Contributions are welcome! If you have improvements or bug fixes, please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.