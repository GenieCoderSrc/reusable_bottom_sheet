# reusable_bottom_sheet

A Flutter package to create **highly customizable**, **reusable** bottom sheets with features like titles, subtitles, drag gestures (pill indicator), and option lists. Designed to help you create elegant and flexible modal bottom sheets faster.

---

## Features

- Fully customizable modal bottom sheets
- Optional title and subtitle support
- Optional pill gesture at the top for user interaction hint
- Scrollable content support
- Flexible height control
- Easily show option lists
- Reusable components: `OptionEntity`, `OptionItem`, `OptionList`, `PillGesture`

---

## Getting Started

Add this to your `pubspec.yaml`:

```yaml
reusable_bottom_sheet: ^0.0.2
```

Import the package:

```dart
import 'package:reusable_bottom_sheet/reusable_bottom_sheet.dart';
```

---

## Usage

### Simple Custom Bottom Sheet

```dart
customBottomSheet(
  context: context,
  title: 'Custom Sheet',
  supTitle: 'This is a subtitle',
  child: Text('Your content here'),
);
```

### Showing an Option List Bottom Sheet

```dart
showOptionBottomSheet(
  context: context,
  title: 'Options',
  options: [
    OptionEntity(title: 'Option 1', icon: Icons.ac_unit, onTap: () {}),
    OptionEntity(title: 'Option 2', icon: Icons.access_alarm, onTap: () {}),
  ],
);
```

---

## Components

### `OptionEntity`
Represents an option with an icon, title, and tap handler.

### `OptionItem`
Widget for a single option item.

### `OptionList`
Widget to display a list of `OptionItem`s.

### `PillGesture`
A draggable indicator usually shown at the top of the sheet.

---

## Customization Options

- `title`, `supTitle`, and their text styles
- Background color (`bgColor`)
- Border radius (`borderRadius`)
- Custom child widget
- Optional pill gesture (`hasPillGesture`)
- Control the height with `sheetHeightFraction`

---

## Example

![Example Screenshot](https://via.placeholder.com/600x300.png?text=Reusable+Bottom+Sheet+Example)

---

## License

This project is licensed under the MIT License.

---

## Contributions

Contributions, issues, and feature requests are welcome! Feel free to submit a pull request or open an issue.

---

## Maintainer

Made with ❤️ by [Shohidul Islam](https://github.com/GenieCoderSrc/reusable_bottom_sheet)

