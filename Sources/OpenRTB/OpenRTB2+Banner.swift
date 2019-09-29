//
//  OpenRTB2+Banner.swift
//  
//  Copyright (c) 2019 Kelly Dun
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

extension OpenRTB2 {
    /// The following enumeration indicates the types of ads that can be accepted by the exchange unless restricted by publisher site settings.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.2
    public enum BannerAdType: Int, Codable {
        case xhtmlTextAd = 1
        case xhtmlBannerAd = 2
        case javaScriptAd = 3
        case iframe = 4
    }
    
    /// The following enumeration specifies a standard list of creative attributes that can describe an ad being served or serve as restrictions of thereof.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.3
    public enum CreativeAttribute: Int, Codable {
        case audioAdAutoPlay = 1
        case audioAdUserInitiated = 2
        case expandableAutomatic = 3
        case expandableUserInitiatedClick = 4
        case expandableUserInitiatedRollover = 5
        case inBannerVideoAdAutoPlay = 6
        case inBannerVideoAdUserInitiated = 7
        case pop = 8
        case provocativeOrSuggestiveImagery = 9
        case shakyFlashingFlickeringExtremeAnimationOrSmileys = 10
        case surveys = 11
        case textOnly = 12
        case userInteractive = 13
        case windowsDialogOrAlertStyle = 14
        case hasAudioOnOffButton = 15
        case adProvidesSkipButton = 16
        case adobeFlash = 17
    }
    
    /// The following enumeration specifies the position of the ad as a relative measure of visibility or prominence.
    /// This OpenRTB enumeration has values derived from the Inventory Quality Guidelines (IQG). Practitioners should
    /// keep in sync with updates to the IQG values as published on IAB.com. Values “4” - “7” apply to apps per the mobile
    /// addendum to IQG version 2.1.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.4
    public enum AdPosition: Int, Codable {
        case unknown = 0
        case aboveTheFold = 1
        case belowTheFold = 3
        case header = 4
        case footer = 5
        case sidebar = 6
        case fullScreen = 7
        
        // MARK: Deprecated AdPosition values
        
        /// DEPRECATED
        case mayNotBeInitiallayVisible = 2
    }
    
    /// The following enumeration lists the directions in which an expandable ad may expand, given the positioning
    /// of the ad unit on the page and constraints imposed by the content.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.5
    public enum ExpandableDirection: Int, Codable {
        case left = 1
        case right = 2
        case up = 3
        case down = 4
        case fullScreen = 5
    }
    
    /// The following table is a list of API frameworks supported by the publisher.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.6
    public enum ApiFramework: Int, Codable {
        case vpaid1 = 1
        case vpaid2 = 2
        case mraid1 = 3
        case ormma = 4
        case mraid2 = 5
        case mraid3 = 6
    }
    
    /// Indicates the companion banner rendering mode relative to the associated video.
    public enum VideoCompanionMode: Int, Codable {
        case concurrent = 0
        case endCard = 1
    }
    
    /// This object represents the most general type of impression. Although the term “banner” may have very specific meaning in other contexts,
    /// here it can be many things including a simple static image, an expandable ad unit, or even in-banner video (refer to the `Video` object
    /// for the more generalized and full featured video ad units). An array of `Banner` objects can also appear within the `Video` to describe
    /// optional companion ads defined in the VAST specification.
    /// The presence of a `Banner` as a subordinate of the `Impression` object indicates that this impression is offered as a banner type
    /// impression. At the publisher’s discretion, that same impression may also be offered as video, audio, and/or native by also including as
    /// `Impression` subordinates objects of those types. However, any given bid for the impression must conform to one of the offered types.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.6
    public struct Banner: Codable {
        /// Array of `Format` objects representing the banner sizes permitted.
        /// If none are specified, then use of the `h` and `w` attributes is highly recommended.
        let format: [OpenRTB2.Format]?
        
        /// Exact width in device independent pixels (DIPS); recommended if no `format` objects are specified.
        let w: Int?
        
        /// Exact height in device independent pixels (DIPS); recommended if no `format` objects are specified.
        let h: Int?
        
        /// Blocked banner ad types.
        let btype: [OpenRTB2.BannerAdType]?
        
        /// Blocked creative attributes.
        let battr: [OpenRTB2.CreativeAttribute]?
        
        /// Ad position on screen.
        let pos: OpenRTB2.AdPosition?
        
        /// Content MIME types supported. Popular MIME types may include “application/x-shockwave-flash”, “image/jpg”, and “image/gif”.
        let mimes: [String]?
        
        /// Indicates if the banner is in the top frame as opposed to an iframe, where 0 = no, 1 = yes.
        let topframe: Int?
        
        /// Directions in which the banner may expand.
        let expdir: [OpenRTB2.ExpandableDirection]?
        
        /// List of supported API frameworks for this impression. If an API is not explicitly listed, it is assumed not to be supported.
        let api: [OpenRTB2.ApiFramework]?
        
        /// Unique identifier for this banner object. Recommended when `Banner` objects are used with a `Video` object
        /// to represent an array of companion ads. Values usually start at 1 and increase with each object; should be unique within an impression.
        let id: String?
        
        /// Relevant only for `Banner` objects used with a `Video` object in an array of companion ads.
        /// Indicates the companion banner rendering mode relative to the associated video.
        let vcm: OpenRTB2.VideoCompanionMode?
        
        // MARK: - Deprecated Banner fields
        
        /// NOTE: Deprecated in favor of the format array. Maximum width in device independent pixels (DIPS).
        let wmax: Int?
        
        /// NOTE: Deprecated in favor of the format array. Maximum height in device independent pixels (DIPS).
        let hmax: Int?
        
        /// NOTE: Deprecated in favor of the format array. Minimum width in device independent pixels (DIPS).
        let wmin: Int?
        
        /// NOTE: Deprecated in favor of the format array. Minimum height in device independent pixels (DIPS).
        let hmin: Int?
    }
}

// MARK: - Convenience properties that provide type translations
extension OpenRTB2.Banner {
    /// Flag indicating if the banner is in the top frame as opposed to an iframe.
    /// - Note: This property is sourced by the `topframe` field.
    var isTopFrame: Bool { (topframe ?? 0) == 1 }
}
