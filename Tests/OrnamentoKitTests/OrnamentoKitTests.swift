import XCTest
import SwiftUI
@testable import OrnamentoKit

final class OrnamentoKitTests: XCTestCase {
  @MainActor
  func testReadmeExampleCompiles() {
    _ = ReadmeExampleContentView()
  }

  @MainActor
  func testOlderDismissalDoesNotClearReplacementNotification() async throws {
    let model = OrnamentoNotificationModel(seconds: 1)

    let firstNotification = OrnamentoNotification(
      title: "First",
      type: .info
    )
    let replacementNotification = OrnamentoNotification(
      title: "Replacement",
      type: .success
    )

    model.notification = firstNotification
    model.showNotification()

    try await Task.sleep(nanoseconds: 200_000_000)

    model.notification = replacementNotification
    model.showNotification()

    try await Task.sleep(nanoseconds: 900_000_000)

    XCTAssertEqual(model.notification, replacementNotification)
    XCTAssertEqual(model.visibility, .visible)
  }

  @MainActor
  func testDismissalHidesVisibilityWhenNotificationWasCleared() async throws {
    let model = OrnamentoNotificationModel(seconds: 1)

    model.notification = OrnamentoNotification(
      title: "Done",
      type: .success
    )
    model.showNotification()
    model.notification = nil

    try await Task.sleep(nanoseconds: 1_100_000_000)

    XCTAssertNil(model.notification)
    XCTAssertEqual(model.visibility, .hidden)
  }
}

private struct ReadmeExampleContentView: View {
  @State private var notificationModel = OrnamentoNotificationModel()

  var body: some View {
    Text("Hello, World!")
      .ornamentNotification(for: notificationModel)
  }
}
