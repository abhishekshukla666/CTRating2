//
//  RatingImage.swift
//  CTRating2-Master
//
//  Created by Abhishek Shukla on 23/04/25.
//

import SwiftUI

public enum RatingImage: String {
    // These represent SFSymbols.  The string after the SF_ suffix is the name of the SFSymbol.  There must also be a corresponding .fill suffix.
    case star = "SF_star"
    case heart = "SF_heart"
    case thumbsUp = "SF_hand.thumbsup"
    case bookmark = "SF_bookmark"
    case flag = "SF_flag"
    case bell = "SF_bell"
    // These are images stored in the bundel.  There must be one with the corresponding name along with one with the .fill suffix.  All images should be stored as a Template images, rendered as Single Scale.
    case baseball
    case basketball
    case football
    case custom

    // computed properties to generate the correct filled or open images
    var fillImage: Image {
        rawValue.prefix(3) == "SF_" ?
            Image(systemName: String(rawValue.dropFirst(3)) + ".fill")
            :
            rawValue == "custom" ?
            Image("\(rawValue).fill")
            :
            Image("\(rawValue).fill", bundle: .module)
    }
    var openImage: Image {
        rawValue.prefix(3) == "SF_" ?
            Image(systemName: String(rawValue.dropFirst(3)))
            :
            rawValue == "custom" ?
            Image(rawValue)
            :
            Image(rawValue, bundle: .module)
    }
}
