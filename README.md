# Swift Libraries Extensions

## Requirements

* iOS 7.0+ / OSX 10.9+
* XCode 7.0
* Swift 2.0

## Integration

### CocoaPods

You can use [Cocoapods](https://cocoapods.org) to install `SwiftExtLib` by adding it to your `Podfile`:
```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod 'SwiftExtLib', :git => 'https://github.com/Hejki/SwiftExtLib.git'
end
```
Note that it needs you to install CocoaPods 0.36 version, and requires your iOS deploy target >= 8.0

## Usage

### UIColor (iOS), NSColor (OSX)

Init color by passing hex value.

```swift
// Color from hex representation
UIColor(hex: 0x00FF00)
```

For centralizing color values you can use own custom type with color definitions (which extends `RawRepresentable where RawValue == Int`)

```swift
// Custom enum type
enum AppColors: Int {
    case Blue = 0x000022
}

// Create color with enum
UIColor(named: AppColors.Blue)

// Or use predefined enum Colors
UIColor(named: Colors.Pink)
```

### SegueHandler (iOS, OSX)

Type safe segue handling. Start with define `SegueIdentifier`s in your `UIViewController` or `NSViewController`.
```swift
class MyViewController: UIViewController, SegueHandler {
    enum SegueIdentifier {
        case ShowImportUnicorn = "ShowImportUnicorn"
        case ShowEditUnicorn = "ShowEditUnicorn"
    }
}
```

Use function `performSegueWithIdentifier` for performs the specific segue.
```swift
class MyViewController: UIViewController, SegueHandler {
    ...
    func handleAction(sender: AnyObject?) {
        performSegueWithIdentifier(.ShowImportUnicorn, sender: sender)
    }
}
```

Use function `segueIdentifierForSegue` for obtain `SegueIdentifier` for `prepareForSegue` method or otherview controller methods.
```swift
class MyViewController: UIViewController, SegueHandler {
    ...
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segueIdentifierForSegue(segue) {
            case .ShowImportUnicorn:    // Config...
            case .ShowEditUnicorn: // Config...
        }
    }
}
```