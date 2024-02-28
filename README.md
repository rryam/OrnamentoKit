
# OrnamentoKit

While listening to Memento Mori by The Weeknd, and working with Ornaments in visionOS, I decided to create **OrnamentoKit** that will have everything related to ornaments!

The first method is toast like notification ornament that displays on the top of the window.

## `ornamentNotification`
Here's an example of how to use the `ornamentNotification` modifier with the provided `OrnamentoNotificationModel`:

Create an instance of `OrnamentoNotificationModel` and add the `ornamentNotification` modifier to your SwiftUI view:

```swift
struct ContentView: View {
  @StateObject private var notificationModel = OrnamentoNotificationModel()

  var body: some View {
    Text("Hello, World!")
      .ornamentNotification(for: notificationModel)
  }
}
```

Show the notification by setting the notification property on the `notificationModel` instance:

```swift
notificationModel.notification = OrnamentoNotification(title: "Success!", message: "The operation was successful.", type: .success)
```

The `ornamentNotification` modifier will display the notification at the top of the screen, with the specified title, message, and icon.

The notification will automatically dismiss after 2 seconds. You can customize the seconds by setting the `seconds` property on the `notificationModel` instance.
