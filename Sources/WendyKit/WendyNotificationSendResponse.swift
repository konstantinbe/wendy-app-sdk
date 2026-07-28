import Foundation

/// The outcome of the first successful creation of a Notification.
///
/// Wendy does not replay this response when its `notificationID` is reused.
/// Later canonical reuse throws `WendyError.notificationAlreadyExists`.
public struct WendyNotificationSendResponse: Sendable, Hashable {
  /// The caller-generated resource UUID v4 accepted by Wendy.
  public let notificationID: UUID

  /// The distinct recipient projections persisted, not successful push deliveries.
  public let recipientCount: Int

  public init(notificationID: UUID, recipientCount: Int) throws {
    guard isNotificationUUIDv4(notificationID) else {
      throw WendyError.invalidRequest("notification_id must be a UUID v4")
    }

    self.notificationID = notificationID
    self.recipientCount = recipientCount
  }
}
