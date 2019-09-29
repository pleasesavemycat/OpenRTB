//
//  OpenRTB2+Audio.swift
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
    /// The following enumeration lists the types of feeds, typically for audio.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.16
    public enum AudioFeedType: Int, Codable {
        /// Music Service
        case musicService = 1
        
        /// FM/AM Broadcast
        case amfmBroadcast = 2
        
        /// Podcast
        case podcast = 3
    }
    
    /// The following enumeration lists the types of volume normalization modes, typically for audio.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.17
    public enum AudioVolumeNormalizationType: Int, Codable {
        /// None
        case none = 0
        
        /// Ad Volume Average Normalized to Content
        case volumeAverage = 1
        
        /// Ad Volume Peak Normalized to Content
        case volumePeak = 2
        
        /// Ad Loudness Normalized to Content
        case loudness = 3
        
        /// Custom Volume Normalization
        case custom = 4
    }
    
    /// This object represents an audio type impression. Many of the fields are non-essential for minimally viable transactions,
    /// but are included to offer fine control when needed. Audio in OpenRTB generally assumes compliance with the DAAST standard.
    /// As such, the notion of companion ads is supported by optionally including an array of `Banner` objects that define these companion ads.
    /// The presence of a `Audio` as a subordinate of the `Impression` object indicates that this impression is offered as an audio type
    /// impression. At the publisher’s discretion, that same impression may also be offered as banner, video, and/or native by also including
    /// as `Impression` subordinates objects of those types. However, any given bid for the impression must conform to one of the offered types.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.8
    public struct Audio: Codable {
        /// Content MIME types supported (e.g., “audio/mp4”).
        let mimes: [String]
        
        /// Minimum audio ad duration in seconds.
        let minduration: Int?
        
        /// Maximum audio ad duration in seconds.
        let maxduration: Int?
        
        /// Array of supported audio protocols.
        let protocols: [OpenRTB2.AdServingProtocol]?
        
        /// Indicates the start delay in seconds for pre-roll, mid-roll, or post-roll ad placements. Refer to List 5.12.
        let startdelay: Int?
        
        /// If multiple ad impressions are offered in the same bid request, the sequence number will allow for the coordinated delivery of multiple creatives.
        let sequence: Int?
        
        /// Blocked creative attributes.
        let battr: [OpenRTB2.CreativeAttribute]?
        
        /// Maximum extended ad duration if extension is allowed. If blank or 0, extension is not allowed. If -1, extension is allowed,
        /// and there is no time limit imposed. If greater than 0, then the value represents the number of seconds of extended play
        /// supported beyond the `maxduration` value.
        let maxextended: Int?
        
        /// Minimum bit rate in Kbps.
        let minbitrate: Int?
        
        /// Maximum bit rate in Kbps.
        let maxbitrate: Int?
        
        /// Supported delivery methods (e.g., streaming, progressive). If none specified, assume all are supported.
        let delivery: [OpenRTB2.ContentDeliveryMethod]?
        
        /// Array of `Banner` objects if companion ads are available.
        let companionad: [OpenRTB2.Banner]?
        
        /// List of supported API frameworks for this impression. If an API is not explicitly listed, it is assumed not to be supported.
        let api: [OpenRTB2.ApiFramework]?
        
        /// Supported DAAST companion ad types. Recommended if companion `Banner` objects are included via the companionad array.
        let companiontype: [OpenRTB2.CompanionType]?
        
        /// The maximum number of ads that can be played in an ad pod.
        let maxseq: Int?
        
        /// Type of audio feed.
        let feed: OpenRTB2.AudioFeedType?
        
        /// Indicates if the ad is stitched with audio content or delivered independently, where 0 = no, 1 = yes.
        let stitched: Int?
        
        /// Volume normalization mode.
        let nvol: OpenRTB2.AudioVolumeNormalizationType?
    }
}

// MARK: - Convenience properties that provide type translations
extension OpenRTB2.Audio {
    /// Flag indicating if the ad is stitched with audio content or delivered independently.
    /// - Note: This property is sourced by the `stitched` field.
    var isStitched: Bool { (stitched ?? 0) == 1 }
}

