//
//  PartialSheetStyle.swift
//  PartialSheetExample
//
//  Created by Andrea Miotto on 21/4/20.
//  Copyright © 2020 Swift. All rights reserved.
//

import SwiftUI

public struct PartialSheetStyle {

    /// The color of the background
    var backgroundColor: Color

    /// The color of the Handlander Bar and the X button on ipad and mac
    var handlerBarColor: Color

    /// Tells if should be there a cover between the Partial Sheet and the Content
    var enableCover: Bool

    /// The color of the cover
    var coverColor: Color

    /// The blur effect style to applied between the partialSheet and the Presenter Conter
    var blurEffectStyle: UIBlurEffect.Style?

    /// The blur effect style applied to the Partial Sheet
    var sheetBlurEffectStyle: UIBlurEffect.Style?

    /**
     The **Style** for the PartialSheet
     - parameter backgroundColor: The background color of the partial sheet
     - parameter handlerBarColor: The color of the handler bar to close the partial sheet
     - parameter enableCover: True if you want a cover enabled between the sheet and the presenter view.
     - parameter coverColor: The color of the cover,  use the .opacity modifier if you want a transparent effect
     - parameter blurEffectStyle: If you want a blur effect on the cover, set the effect style, otherwise put it to nil.
     - parameter sheetBlurEffectStyle: For a blur effect on the sheet, set the effect style, otherwise put it to nil.

     Use `PartialSheetStyle.defaultStyle` if you want a quicker init for the style with default values.
     */
    public init(
        backgroundColor: Color,
        handlerBarColor: Color,
        enableCover: Bool,
        coverColor: Color,
        blurEffectStyle: UIBlurEffect.Style?,
        sheetBlurEffectStyle: UIBlurEffect.Style?
    ) {
        self.backgroundColor = backgroundColor
        self.handlerBarColor = handlerBarColor
        self.enableCover = enableCover
        self.coverColor = coverColor
        self.blurEffectStyle = blurEffectStyle
        self.sheetBlurEffectStyle = sheetBlurEffectStyle
    }
}

extension PartialSheetStyle {

    /** A default Style for the PartialSheet with system colors.

     - backgroundColor: Color(UIColor.tertiarySystemBackground)
     - handlerBarColor: Color(UIColor.systemGray2)
     - enableCover: true
     - coverColor: Color.black.opacity(0.4)
     - blurEffectStyle: nil
     - sheetBlurEffectStyle: nil
     */
    public static func defaultStyle() -> PartialSheetStyle {
        return PartialSheetStyle(backgroundColor: Color(UIColor.tertiarySystemBackground),
                                 handlerBarColor: Color(UIColor.systemGray2),
                                 enableCover: true,
                                 coverColor: Color.black.opacity(0.4),
                                 blurEffectStyle: nil,
                                 sheetBlurEffectStyle: nil
        )
    }
}
