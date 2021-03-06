//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `BoardViewController`.
    static let boardViewController = _R.storyboard.boardViewController()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "BoardViewController", bundle: ...)`
    static func boardViewController(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.boardViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.id` struct is generated, and contains static references to accessibility identifiers.
  struct id {
    struct imageInsertionPostTableViewCell {
      /// Accessibility identifier `ImageInsertionPostTableViewCell`.
      static let imageInsertionPostTableViewCell: String = "ImageInsertionPostTableViewCell"

      fileprivate init() {}
    }

    struct loadMoreTableViewCell {
      /// Accessibility identifier `LoadMoreTableViewCell`.
      static let loadMoreTableViewCell: String = "LoadMoreTableViewCell"

      fileprivate init() {}
    }

    struct popularImagePostTableViewCell {
      /// Accessibility identifier `PopularImagePostTableViewCell`.
      static let popularImagePostTableViewCell: String = "PopularImagePostTableViewCell"

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `post-image-insertion`.
    static let postImageInsertion = Rswift.ImageResource(bundle: R.hostingBundle, name: "post-image-insertion")
    /// Image `post-like-icon`.
    static let postLikeIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "post-like-icon")
    /// Image `wongnai-logo`.
    static let wongnaiLogo = Rswift.ImageResource(bundle: R.hostingBundle, name: "wongnai-logo")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "post-image-insertion", bundle: ..., traitCollection: ...)`
    static func postImageInsertion(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.postImageInsertion, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "post-like-icon", bundle: ..., traitCollection: ...)`
    static func postLikeIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.postLikeIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "wongnai-logo", bundle: ..., traitCollection: ...)`
    static func wongnaiLogo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.wongnaiLogo, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "BoardViewController"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 3 nibs.
  struct nib {
    /// Nib `ImageInsertionPostTableViewCell`.
    static let imageInsertionPostTableViewCell = _R.nib._ImageInsertionPostTableViewCell()
    /// Nib `LoadMoreTableViewCell`.
    static let loadMoreTableViewCell = _R.nib._LoadMoreTableViewCell()
    /// Nib `PopularImagePostTableViewCell`.
    static let popularImagePostTableViewCell = _R.nib._PopularImagePostTableViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ImageInsertionPostTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.imageInsertionPostTableViewCell) instead")
    static func imageInsertionPostTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.imageInsertionPostTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "LoadMoreTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.loadMoreTableViewCell) instead")
    static func loadMoreTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.loadMoreTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "PopularImagePostTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.popularImagePostTableViewCell) instead")
    static func popularImagePostTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.popularImagePostTableViewCell)
    }
    #endif

    static func imageInsertionPostTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ImageInsertionPostTableViewCell? {
      return R.nib.imageInsertionPostTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ImageInsertionPostTableViewCell
    }

    static func loadMoreTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> LoadMoreTableViewCell? {
      return R.nib.loadMoreTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? LoadMoreTableViewCell
    }

    static func popularImagePostTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PopularImagePostTableViewCell? {
      return R.nib.popularImagePostTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PopularImagePostTableViewCell
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 3 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `ImageInsertionPostTableViewCell`.
    static let imageInsertionPostTableViewCell: Rswift.ReuseIdentifier<ImageInsertionPostTableViewCell> = Rswift.ReuseIdentifier(identifier: "ImageInsertionPostTableViewCell")
    /// Reuse identifier `LoadMoreTableViewCell`.
    static let loadMoreTableViewCell: Rswift.ReuseIdentifier<LoadMoreTableViewCell> = Rswift.ReuseIdentifier(identifier: "LoadMoreTableViewCell")
    /// Reuse identifier `PopularImagePostTableViewCell`.
    static let popularImagePostTableViewCell: Rswift.ReuseIdentifier<PopularImagePostTableViewCell> = Rswift.ReuseIdentifier(identifier: "PopularImagePostTableViewCell")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _ImageInsertionPostTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = ImageInsertionPostTableViewCell

      let bundle = R.hostingBundle
      let identifier = "ImageInsertionPostTableViewCell"
      let name = "ImageInsertionPostTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ImageInsertionPostTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ImageInsertionPostTableViewCell
      }

      fileprivate init() {}
    }

    struct _LoadMoreTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = LoadMoreTableViewCell

      let bundle = R.hostingBundle
      let identifier = "LoadMoreTableViewCell"
      let name = "LoadMoreTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> LoadMoreTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? LoadMoreTableViewCell
      }

      fileprivate init() {}
    }

    struct _PopularImagePostTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = PopularImagePostTableViewCell

      let bundle = R.hostingBundle
      let identifier = "PopularImagePostTableViewCell"
      let name = "PopularImagePostTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PopularImagePostTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PopularImagePostTableViewCell
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try boardViewController.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct boardViewController: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let name = "BoardViewController"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if UIKit.UIImage(named: "wongnai-logo", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'wongnai-logo' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
