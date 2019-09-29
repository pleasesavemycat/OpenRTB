//
//  OpenRTB2+Bid.swift
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
    /// A `SeatBid` object contains one or more `Bid` objects, each of which relates to a specific impression in the bid request
    /// via the `impid` attribute and constitutes an offer to buy that impression for a given price.
    /// - Note: Conforms to OpenRTB 2.5 specification 4.2.3
    public struct Bid: Codable {
        /// Bidder generated bid ID to assist with logging/tracking.
        let id: String
        
        /// ID of the `Impression` object in the related bid request.
        let impid: String
        
        /// Bid price expressed as CPM although the actual transaction is for a unit impression only.
        /// Note that while the type indicates float, integer math is highly recommended when handling currencies (e.g., BigDecimal in Java).
        let price: Float
        
        /// Win notice URL called by the exchange if the bid wins (not necessarily indicative of a delivered, viewed, or billable ad);
        /// optional means of serving ad markup. Substitution macros (Section 4.4) may be included in both the URL and optionally returned markup.
        let nurl: String?
        
        /// Billing notice URL called by the exchange when a winning bid becomes billable based on exchange-specific business
        /// policy (e.g., typically delivered, viewed, etc.). Substitution macros (Section 4.4) may be included.
        let burl: String?
        
        /// Loss notice URL called by the exchange when a bid is known to have been lost. Substitution macros (Section 4.4) may be
        /// included. Exchange-specific policy may preclude support for loss notices or the disclosure of winning clearing prices
        /// resulting in ${AUCTION_PRICE} macros being removed (i.e., replaced with a zero-length string).
        let lurl: String?
        
        /// Optional means of conveying ad markup in case the bid wins; supersedes the win notice if markup is included in both.
        /// Substitution macros (Section 4.4) may be included.
        let adm: String?
        
        /// ID of a preloaded ad to be served if the bid wins.
        let adid: String?
        
        /// Advertiser domain for block list checking (e.g., “ford.com”). This can be an array of for the case of rotating creatives.
        /// Exchanges can mandate that only one domain is allowed.
        let adomain: [String]?
        
        /// A platform-specific application identifier intended to be unique to the app and independent of the exchange. On
        /// Android, this should be a bundle or package name (e.g., com.foo.mygame). On iOS, it is a numeric ID.
        let bundle: String?
        
        /// URL without cache-busting to an image that is representative of the content of the campaign for ad quality/safety checking.
        let iurl: String?
        
        /// Campaign ID to assist with ad quality checking; the collection of creatives for which `iurl` should be representative.
        let cid: String?
        
        /// Creative ID to assist with ad quality checking.
        let crid: String?
        
        /// Tactic ID to enable buyers to label bids for reporting to the exchange the tactic through which their bid was submitted.
        /// The specific usage and meaning of the tactic ID should be communicated between buyer and exchanges a priori.
        let tactic: String?
        
        /// IAB content categories of the creative. Refer to List 5.1.
        let cat: [String]?
        
        /// Set of attributes describing the creative.
        let attr: [OpenRTB2.CreativeAttribute]?
        
        /// API required by the markup if applicable.
        let api: [OpenRTB2.ApiFramework]?
        
        /// Video response protocol of the markup if applicable.
        let adprotocol: OpenRTB2.AdServingProtocol?
        
        /// Creative media rating per IQG guidelines.
        let qagmediarating: OpenRTB2.IQGMediaRating?
        
        /// Language of the creative using ISO-639-1-alpha-2. The non- standard code “xx” may also be used if the creative has no
        /// linguistic content (e.g., a banner with just a company logo).
        let language: String?
        
        /// Reference to the `deal.id` from the bid request if this bid pertains to a private marketplace direct deal.
        let dealid: String?
        
        /// Width of the creative in device independent pixels (DIPS).
        let w: Int?
        
        /// Height of the creative in device independent pixels (DIPS).
        let h: Int?
        
        /// Relative width of the creative when expressing size as a ratio. Required for Flex Ads.
        let wratio: Int?
        
        /// Relative height of the creative when expressing size as a ratio. Required for Flex Ads.
        let hratio: Int?
        
        /// Advisory as to the number of seconds the bidder is willing to wait between the auction and the actual impression.
        let exp: Int?
        
        // MARK: - CodingKeys
        private enum CodingKeys : String, CodingKey {
            case id, impid, price, nurl, burl, lurl, adm, adid, adomain, bundle, iurl, cid, crid, tactic, cat, attr, api, adprotocol = "protocol", qagmediarating, language, dealid, w, h, wratio, hratio, exp
        }
    }
}
