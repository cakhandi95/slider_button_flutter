A customizable slider button widget for triggering events in your Flutter app, perfect for authentication, form submission, and more.

## Features

- Customizable child widget
- Adjustable corner radius, height, and width
- Various color options for background, base, highlighted, and button colors
- Optional label and icon
- Shimmer effect and vibration feedback support
- Disable functionality with tooltip message

## Properties

| Property           | Type           | Description                                                            | Default                |
|--------------------|----------------|------------------------------------------------------------------------|------------------------|
| `child`            | `Widget?`      | Customizable child widget inside the button.                           | `null`                 |
| `radius`           | `double`       | Radius of the button corners.                                          | `100.0`                |
| `height`           | `double`       | Height of the button.                                                  | `70.0`                 |
| `width`            | `double`       | Width of the button.                                                   | `270.0`                |
| `buttonSize`       | `double?`      | Size of the sliding button.                                            | `null`                 |
| `buttonWidth`      | `double?`      | Width of the sliding button.                                           | `null`                 |
| `backgroundColor`  | `Color`        | Background color of the button.                                        | `Color(0xffe0e0e0)`    |
| `baseColor`        | `Color`        | Base color for the shimmer effect.                                     | `Colors.black87`       |
| `highlightedColor` | `Color`        | Highlighted color for the shimmer effect.                              | `Colors.white`         |
| `buttonColor`      | `Color`        | Color of the sliding button.                                           | `kBlueDark`            |
| `label`            | `Widget?`      | A widget to display as a label inside the button.                      | `null`                 |
| `alignLabel`       | `Alignment`    | Alignment of the label inside the button.                              | `Alignment.center`     |
| `boxShadow`        | `BoxShadow?`   | BoxShadow for the sliding button.                                      | `null`                 |
| `icon`             | `Widget?`      | Icon to display inside the sliding button.                             | `null`                 |
| `shimmer`          | `bool`         | Enable or disable the shimmer effect.                                  | `true`                 |
| `vibrationFlag`    | `bool`         | Enable or disable vibration feedback.                                  | `false`                |
| `disable`          | `bool`         | Enable or disable the button.                                          | `false`                |
| `onSlideCompleted` | `VoidCallback` | Callback function when the slide is completed.                         | `required`             |
| `messageTooltip`   | `String`       | Tooltip message when the button is disabled.                           | `''`                   |

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  button_slide_component: ^1.0.4    

