//
//  OpenRTB2+Video.swift
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
    /// The following enumeration indicates the options for video linearity. “In-stream” or “linear” video refers to pre- roll, post-roll, or
    /// mid-roll video ads where the user is forced to watch ad in order to see the video content. “Overlay” or “non-linear” refer to ads that
    /// are shown on top of the video content.
    /// This OpenRTB table has values derived from the Inventory Quality Guidelines (IQG). Practitioners should keep in sync with updates to the IQG values.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.7
    public enum VideoLinearity: Int, Codable {
        case linearInStream = 1
        case nonLinearOverlay = 2
    }
    
    /// The following enumeration lists the options for the various bid response protocols that could be supported by an exchange.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.8
    public enum AdServingProtocol: Int, Codable {
        case vast1 = 1
        case vast2 = 2
        case vast3 = 3
        case vast1Wrapper = 4
        case vast2Wrapper = 5
        case vast3Wrapper = 6
        case vast4 = 7
        case vast4Wrapper = 8
        case daast1 = 9
        case daast1Wrapper = 10
    }
    
    /// The following enumeration lists the various types of video placements derived largely from the IAB Digital Video Guidelines.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.9
    public enum VideoPlacementType: Int, Codable {
        /// Played before, during or after the streaming video content that the consumer has requested (e.g., Pre-roll, Mid-roll, Post-roll).
        case inStream = 1
        
        /// Exists within a web banner that leverages the banner space to deliver a video experience as opposed to another static or rich media format.
        /// The format relies on the existence of display ad inventory on the page for its delivery.
        case inBanner = 2
        
        /// Loads and plays dynamically between paragraphs of editorial content; existing as a standalone branded message.
        case inArticle = 3
        
        /// Found in content, social, or product feeds.
        case inFeed = 4
        
        /// Covers the entire or a portion of screen area, but is always on screen while displayed (i.e. cannot be scrolled out of view).
        /// Note that a full-screen interstitial (e.g., in mobile) can be distinguished from a floating/slider unit by the `imp.instl` field.
        case interstitialSliderOrFloating = 5
    }
    
    /// The following enumeration lists the various playback methods.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.10
    public enum VideoPlaybackMethod: Int, Codable {
        /// Initiates on Page Load with Sound On
        case pageLoadWithSoundOn = 1
        
        /// Initiates on Page Load with Sound Off by Default
        case pageLoadWithSoundOff = 2
        
        /// Initiates on Click with Sound On
        case clickWithSoundOn = 3
        
        /// Initiates on Mouse-Over with Sound On
        case mouseOverWithSoundOn = 4
        
        /// Initiates on Entering Viewport with Sound On
        case enterViewportWithSoundOn = 5
        
        /// Initiates on Entering Viewport with Sound Off by Default
        case enterViewportWithSoundOff = 6
    }
    
    /// The following enumeration lists the various modes for when playback terminates.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.11
    public enum VideoPlaybackEndMode: Int, Codable {
        /// On Video Completion or when Terminated by User
        case videoComplete = 1
        
        /// On Leaving Viewport or when Terminated by User
        case leavingViewport = 2
        
        /// On Leaving Viewport Continues as a Floating/Slider Unit until Video Completion or when Terminated by User
        case leavingViewportUntilVideoCompletion = 3
    }
    
    /// The following enumeration lists the options to indicate markup types allowed for companion ads that apply to video and audio ads.
    /// This table is derived from VAST 2.0+ and DAAST 1.0 specifications. Refer to www.iab.com/guidelines/digital-video-suite for more information.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.14
    public enum CompanionType: Int, Codable {
        /// Static Resource
        case staticResource = 1
        
        /// HTML Resource
        case htmlResource = 2
        
        /// iframe Resource
        case iframeResource = 3
    }
    
    /// The following enumeration lists the various options for the delivery of video or audio content.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.15
    public enum ContentDeliveryMethod: Int, Codable {
        case streaming = 1
        case progressive = 2
        case download = 3
    }
    
    /// This object represents an in-stream video impression. Many of the fields are non-essential for minimally viable transactions,
    /// but are included to offer fine control when needed. Video in OpenRTB generally assumes compliance with the VAST standard.
    /// As such, the notion of companion ads is supported by optionally including an array of `Banner` objects (refer to the `Banner`
    /// object) that define these companion ads.
    /// The presence of a `Video` as a subordinate of the `Impression` object indicates that this impression is offered as a video
    /// type impression. At the publisher’s discretion, that same impression may also be offered as banner, audio, and/or native by also
    /// including as `Impression` subordinates objects of those types. However, any given bid for the impression must conform to
    /// one of the offered types.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.7
    public struct Video: Codable {
        /// Content MIME types supported (e.g., “video/x-ms-wmv”, “video/mp4”).
        let mimes: [String]
        
        /// Minimum video ad duration in seconds.
        let minduration: Int?
        
        /// Maximum video ad duration in seconds.
        let maxduration: Int?
        
        /// Array of supported video protocols. At least one supported protocol must be specified in either the `protocol` or `protocols` attribute.
        let protocols: [OpenRTB2.AdServingProtocol]?
        
        /// Width of the video player in device independent pixels (DIPS).
        let w: Int?
        
        /// Height of the video player in device independent pixels (DIPS).
        let h: Int?
        
        /// Indicates the start delay in seconds for pre-roll, mid-roll, or post-roll ad placements. Refer to List 5.12 for additional generic values.
        let startdelay: Int?
        
        /// Placement type for the impression.
        let placement: OpenRTB2.VideoPlacementType?
        
        /// Indicates if the impression must be linear, nonlinear, etc. If none specified, assume all are allowed.
        let linearity: OpenRTB2.VideoLinearity?
        
        /// Indicates if the player will allow the video to be skipped, where 0 = no, 1 = yes.
        /// If a bidder sends markup/creative that is itself skippable, the Bid object should include the `attr` array with an
        /// element of 16 indicating skippable video. Refer to List 5.3.
        let skip: Int?
        
        /// Videos of total duration greater than this number of seconds can be skippable; only applicable if the ad is skippable.
        /// Default value is 0.
        let skipmin: Int?
        
        /// Number of seconds a video must play before skipping is enabled; only applicable if the ad is skippable.
        /// Default value is 0.
        let skipafter: Int?
        
        /// If multiple ad impressions are offered in the same bid request,
        /// the sequence number will allow for the coordinated delivery of multiple creatives.
        let sequence: Int?
        
        /// Blocked creative attributes.
        let battr: [OpenRTB2.CreativeAttribute]?
        
        /// Maximum extended ad duration if extension is allowed. If blank or 0, extension is not allowed. If -1, extension is
        /// allowed, and there is no time limit imposed. If greater than 0, then the value represents the number of seconds of
        /// extended play supported beyond the `maxduration` value.
        let maxextended: Int?
        
        /// Minimum bit rate in Kbps.
        let minbitrate: Int?
        
        /// Maximum bit rate in Kbps.
        let maxbitrate: Int?
        
        /// Indicates if letter-boxing of 4:3 content into a 16:9 window is allowed, where 0 = no, 1 = yes.
        /// Default value is 1.
        let boxingallowed: Int?
        
        /// Playback methods that may be in use. If none are specified, any method may be used. Refer to List 5.10.
        /// - Note: Only one method is typically used in practice. As a result, this array may be converted to an integer in a future version of the specification.
        /// It is strongly advised to use only the first element of this array in preparation for this change.
        let playbackmethod: [OpenRTB2.VideoPlaybackMethod]?
        
        /// The event that causes playback to end.
        let playbackend: OpenRTB2.VideoPlaybackEndMode?
        
        /// Supported delivery methods (e.g., streaming, progressive). If none specified, assume all are supported.
        let delivery: [OpenRTB2.ContentDeliveryMethod]?
        
        /// Ad position on screen.
        let pos: OpenRTB2.AdPosition?
        
        /// Array of `Banner` objects if companion ads are available.
        let companionad: [OpenRTB2.Banner]?
        
        /// List of supported API frameworks for this impression. Refer to List 5.6. If an API is not explicitly listed, it is assumed not to be supported.
        let api: [OpenRTB2.ApiFramework]?
        
        /// Supported VAST companion ad types. Refer to List 5.14. Recommended if companion `Banner` objects are included via
        /// the `companionad` array. If one of these banners will be rendered as an end-card, this can be specified using the `vcm` attribute
        /// with the particular banner.
        let companiontype: [OpenRTB2.CompanionType]?
        
        // MARK: - Deprecated Banner fields
        
        /// NOTE: Deprecated in favor of protocols.
        /// Supported video protocol. At least one supported protocol must be specified in either the protocol or protocols attribute.
        /// - Note: This field is commented out because `protocol` is a Swift keyword and cannot be used as a property name.
        //let protocol: OpenRTB2.AdServingProtocol?
    }
}

// MARK: - Convenience properties that provide type translations
extension OpenRTB2.Video {
    /// Flag indicating if the player will allow the video to be skipped.
    /// - Note: This property is sourced by the `skip` field.
    var isSkippable: Bool { (skip ?? 0) == 1 }
    
    /// Flag indicating if letter-boxing of 4:3 content into a 16:9 window is allowed
    /// - Note: This property is sourced by the `boxingallowed` field.
    var isBoxingAllowed: Bool { (boxingallowed ?? 0) == 1 }
}
