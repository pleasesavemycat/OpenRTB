//
//  OpenRTB2+Content.swift
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
    /// Content quality
    /// - Note: Conforms to OpenRTB 2.5 specification 5.13
    public enum ProductionQuality: Int, Codable {
        case unknown = 0
        case professionallyProduced = 1
        case prosumer = 2
        case userGenerated = 3
    }
    
    /// The following enumeration lists the various options for indicating the type of content being used or consumed by
    /// the user in which the impression will appear. This OpenRTB enumeration has values derived from the Inventory Quality
    /// Guidelines (IQG). Practitioners should keep in sync with updates to the IQG values.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.18
    public enum ContentContext: Int, Codable {
        case video = 1
        case game = 2
        case music = 3
        case application = 4
        case text = 5
        case other = 6
        case unknown = 7
    }
    
    /// The following enumeration lists the media ratings used in describing content based on the IQG 2.1 categorization.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.19
    public enum IQGMediaRating: Int, Codable {
        case allAudiences = 1
        case everyoneOver12 = 2
        case matureAudiences = 3
    }
    
    /// Content source relationship
    public enum ContentSourceRelationship: Int, Codable {
        case indirect = 0
        case direct = 1
    }
    
    /// This object describes the content in which the impression will appear, which may be syndicated or non-syndicated content.
    /// This object may be useful when syndicated content contains impressions and does not necessarily match the publisher’s general content.
    /// The exchange might or might not have knowledge of the page where the content is running, as a result of the syndication method.
    /// For example might be a video impression embedded in an iframe on an unknown web property or device.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.16
    public struct Content: Codable {
        /// ID uniquely identifying the content.
        let id: String?
        
        /// Episode number.
        let episode: Int?
        
        /// Content title.
        let title: String?
        
        /// Content series.
        let series: String?
        
        /// Content season (e.g., “Season 3”).
        let season: String?
        
        /// Artist credited with the content.
        let artist: String?
        
        /// Genre that best describes the content (e.g., rock, pop, etc).
        let genre: String?
        
        /// Album to which the content belongs; typically for audio.
        let album: String?
        
        /// International Standard Recording Code conforming to ISO- 3901.
        let isrc: String?
        
        /// Details about the content Producer.
        let producer: OpenRTB2.Producer?
        
        /// URL of the content, for buy-side contextualization or review.
        let url: String?
        
        /// Array of IAB content categories that describe the content producer.
        let cat: [String]?
        
        /// Production quality.
        let prodq: OpenRTB2.ProductionQuality?
        
        /// Deprecated in favor of `prodq`.
        let videoquality: OpenRTB2.ProductionQuality?
        
        /// Type of content (game, video, text, etc.).
        let context: OpenRTB2.ContentContext?
        
        /// Content rating (e.g., MPAA).
        let contentrating: String?
        
        /// User rating of the content (e.g., number of stars, likes, etc.).
        let userrating: String?
        
        /// Media rating per IQG guidelines.
        let qagmediarating: OpenRTB2.IQGMediaRating?
        
        /// Comma separated list of keywords describing the content.
        let keywords: String?
        
        /// 0 = not live, 1 = content is live (e.g., stream, live blog).
        let livestream: Int?
        
        /// 0 = indirect, 1 = direct.
        let sourcerelationship: OpenRTB2.ContentSourceRelationship?
        
        /// Length of content in seconds; appropriate for video or audio.
        let len: TimeInterval?
        
        /// Content language using ISO-639-1-alpha-2.
        let language: String?
        
        /// Indicator of whether or not the content is embeddable (e.g., an embeddable video player), where 0 = no, 1 = yes.
        let embeddable: Int?
        
        /// Additional content data. Each `Data` object represents a different data source.
        let data: [OpenRTB2.Data]?
    }
}

// MARK: - Convenience properties that provide type translations
extension OpenRTB2.Content {
    /// Flag indicating if the content is live.
    /// - Note: This property is sourced by the `livestream` field.
    var isLivestream: Bool { (livestream ?? 0) == 1 }
    
    /// Flag indicating whether or not the content is embeddable (e.g., an embeddable video player).
    /// - Note: This property is sourced by the `embeddable` field.
    var isEmbeddable: Bool { (embeddable ?? 0) == 1 }
}
