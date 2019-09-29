//
//  OpenRTB2+Impression.swift
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
    /// The type of browser opened upon clicking the creative in an app.
    /// - Note: Safari View Controller in iOS 9.x devices is considered a native browser for purposes of this attribute.
    public enum ClickBrowserType: Int, Codable {
        case embedded = 0
        case native = 1
    }
    /// This object describes an ad placement or impression being auctioned. A single bid request can include
    /// multiple `Impression` objects, a use case for which might be an exchange that supports selling all
    /// ad positions on a given page. Each `Impression` object has a required ID so that bids can reference
    /// them individually.
    /// The presence of `Banner`, `Video`, and/or `Native` objects subordinate to the `Impression`
    /// object indicates the type of impression being offered. The publisher can choose one such type which is
    /// the typical case or mix them at their discretion. However, any given bid for the impression must conform
    /// to one of the offered types.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.4
    public struct Impression: Codable {
        /// A unique identifier for this impression within the context of the bid request (typically, starts with 1 and increments.
        let id: String
        
        /// An array of `Metric` objects.
        let metric: [OpenRTB2.Metric]?
        
        /// A `Banner` object; required if this impression is offered as a banner ad opportunity.
        let banner: OpenRTB2.Banner?
        
        /// A `Video` object; required if this impression is offered as a video ad opportunity.
        let video: OpenRTB2.Video?
        
        /// An `Audio` object; required if this impression is offered as an audio ad opportunity.
        let audio: OpenRTB2.Audio?
        
        /// A `Native` object; required if this impression is offered as a native ad opportunity.
        let native: OpenRTB2.Native?
        
        /// A `Pmp` object containing any private marketplace deals in effect for this impression.
        let pmp: OpenRTB2.Pmp?
        
        /// Name of ad mediation partner, SDK technology, or player responsible for rendering ad (typically video or mobile).
        /// Used by some ad servers to customize ad code by partner. Recommended for video and/or apps.
        let displaymanager: String?
        
        /// Version of ad mediation partner, SDK technology, or player responsible for rendering ad (typically video or mobile).
        /// Used by some ad servers to customize ad code by partner. Recommended for video and/or apps.
        let displaymanagerver: String?
        
        /// 1 = the ad is interstitial or full screen, 0 = not interstitial.
        /// Default value is 0
        let instl: Int?
        
        /// Identifier for specific ad placement or ad tag that was used to initiate the auction.
        /// This can be useful for debugging of any issues, or for optimization by the buyer.
        let tagid: String?
        
        /// Minimum bid for this impression expressed in CPM.
        /// Default value is 0
        let bidfloor: Float?
        
        /// Currency specified using ISO-4217 alpha codes. This may be different from bid currency returned by bidder if this is allowed by the exchange.
        /// Default value is "USD"
        let bidfloorcur: String?
        
        /// Indicates the type of browser opened upon clicking the creative in an app, where 0 = embedded, 1 = native.
        /// Note that the Safari View Controller in iOS 9.x devices is considered a native browser for purposes of this attribute.
        let clickbrowser: OpenRTB2.ClickBrowserType?
        
        /// Flag to indicate if the impression requires secure HTTPS URL creative assets and markup,
        /// where 0 = non-secure, 1 = secure. If omitted, the secure state is unknown, but non-secure HTTP support can be assumed.
        let secure: Int?
        
        /// Array of exchange-specific names of supported iframe busters.
        let iframebuster: [String]?
        
        /// Advisory as to the number of seconds that may elapse between the auction and the actual impression.
        let exp: Int?
    }
}

// MARK: - Convenience properties that provide type translations
extension OpenRTB2.Impression {
    /// Flag indicating if the ad is interstitial or fullscreen.
    /// - Note: This property is sourced by the `instl` field.
    var isInterstitial: Bool { (instl ?? 0) == 1 }
    
    /// Flag to indicate if the impression requires secure HTTPS URL creative assets and markup,
    /// - Note: This property is sourced by the `secure` field.
    var requiresSecureCreativeAsset: Bool { (secure ?? 0) == 1 }
}
