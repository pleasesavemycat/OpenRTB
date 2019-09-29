//
//  OpenRTB2+BidRequest.swift
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
    /// The bid request consists of the top-level bid request object, at least one impression object,
    /// and may optionally include additional objects providing impression context.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.1
    public struct BidRequest: Codable {
        /// Unique ID of the bid request, provided by the exchange.
        let id: String
        
        /// Array of `Impression` objects representing the impressions offered. At least 1 `Impression` object is required.
        let imp: [OpenRTB2.Impression]
        
        /// This object should be included if the ad supported content is a website as opposed to a non-browser application.
        /// A bid request must not contain both a `Site` and an `App` object.
        /// At a minimum, it is useful to provide a site ID or page URL, but this is not strictly required.
        let site: OpenRTB2.Site?
        
        /// Details about the publisher’s app (i.e., non-browser applications). Only applicable and recommended for apps.
        let app: OpenRTB2.App?
        
        /// Details about the user’s device to which the impression will be delivered.
        let device: OpenRTB2.Device?
        
        /// Details about the human user of the device; the advertising audience.
        let user: OpenRTB2.User?
        
        /// Indicator of test mode in which auctions are not billable, where 0 = live mode, 1 = test mode.
        /// Default value is 0
        let test: Int?
        
        /// Auction type, where 1 = First Price, 2 = Second Price Plus. Exchange-specific auction types can be defined using values greater than 500.
        /// Default value is 2
        let at: Int?
        
        /// Maximum time in milliseconds the exchange allows for bids to be received including Internet latency to avoid timeout.
        /// This value supersedes any a priori guidance from the exchange.
        let tmax: Int?
        
        /// White list of buyer seats (e.g., advertisers, agencies) allowed to bid on this impression. IDs of seats and knowledge of the buyer’s
        /// customers to which they refer must be coordinated between bidders and the exchange a priori. At most, only one of `wseat` and `bseat`
        /// should be used in the same request. Omission of both implies no seat restrictions.
        let wseat: [String]?
        
        /// Block list of buyer seats (e.g., advertisers, agencies) restricted from bidding on this impression. IDs of seats and knowledge of
        /// the buyer’s customers to which they refer must be coordinated between bidders and the exchange a priori. At most, only one
        /// of `wseat` and `bseat` should be used in the same request. Omission of both implies no seat restrictions.
        let bseat: [String]?
        
        /// Flag to indicate if Exchange can verify that the impressions offered represent all of the impressions available in
        /// context (e.g., all on the web page, all video spots such as pre/mid/post roll) to support road-blocking.
        /// 0 = no or unknown, 1 = yes, the impressions offered represent all that are available.
        /// The default is 0
        let allimps: Int?
        
        /// Array of allowed currencies for bids on this bid request using ISO-4217 alpha codes.
        /// Recommended only if the exchange accepts multiple currencies.
        let cur: [String]?
        
        /// White list of languages for creatives using ISO-639-1-alpha-2. Omission implies no specific restrictions,
        /// but buyers would be advised to consider language attribute in the `Device` and/or `Content` objects if available.
        let wlang: [String]?
        
        /// Blocked advertiser categories using the IAB content categories.
        let bcat: [String]?
        
        /// Block list of advertisers by their domains (e.g., “ford.com”).
        let badv: [String]?
        
        /// Block list of applications by their platform-specific exchange-independent application identifiers.
        /// On Android, these should be bundle or package names (e.g., com.foo.mygame). On iOS, these are numeric IDs.
        let bapp: [String]?
        
        /// Provides data about the inventory source and which entity makes the final decision.
        let source: OpenRTB2.Source?
        
        /// An object that specifies any industry, legal, or governmental regulations in force for this request.
        let regs: OpenRTB2.Regulations?
    }
}
