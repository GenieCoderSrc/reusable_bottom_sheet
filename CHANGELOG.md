# Changelog

All notable changes to this project will be documented in this file.



## 0.0.4

### Sep 10 2025

### Added

- Added `AdaptiveBottomSheet` class for mobile and web/desktop with lifecycle hooks (`onOpened`, `onClosed`,
  `onWillPop`).
- Refactored into modular structure (`bottom_sheet.dart`, `dialog_sheet.dart`, `sheet_content.dart`).
- Keyboard-safe wrapper and support for pill, title, and subtitle preserved.
- Removed `customBottomSheet`.

## 0.0.3

## Aug 22 2025

## Removed

- Removed `app_style` dependency.
- Removed `flutter_lints` dependency.
- Removed `flutter_lints` Dependency
- Updated Dart sdk to 3.9.0

## 0.0.2+1

## Fixed

- Fixed custom bottom-sheet backgroundColor.

## 0.0.2

## New

- Create Example File.

## 0.0.1

- Introduced `customBottomSheet` function to easily create customizable bottom sheets.
- Added `showOptionBottomSheet` for displaying a list of selectable options.
- Included `OptionEntity`, `OptionItem`, and `OptionList` to build option-based sheets.
- Added `PillGesture` widget to provide a visual drag handle for bottom sheets.
- Provided basic customization options:
    - Titles
    - Subtitle
    - Background color
    - Border radius
    - Custom height fraction
    - Pill visibility toggle
    - Callback on pop
