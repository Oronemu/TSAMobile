// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum AppUIAsset {
  public enum Assets {
  public static let forest = AppUIImages(name: "Forest")
    public static let account = AppUIImages(name: "Account")
    public static let appearance = AppUIImages(name: "Appearance")
    public static let offline = AppUIImages(name: "Offline")
    public static let perfomance = AppUIImages(name: "Perfomance")
    public static let redesign = AppUIImages(name: "Redesign")
  }
  public enum PreviewAssets {
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct AppUIImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = AppUIResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension AppUIImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the AppUIImages.image property")
  convenience init?(asset: AppUIImages) {
    #if os(iOS) || os(tvOS)
    let bundle = AppUIResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: AppUIImages) {
    let bundle = AppUIResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: AppUIImages, label: Text) {
    let bundle = AppUIResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: AppUIImages) {
    let bundle = AppUIResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
