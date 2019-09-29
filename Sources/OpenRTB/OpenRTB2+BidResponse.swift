//
//  OpenRTB2+BidResponse.swift
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
    /// The following table lists the options for a bidder to signal the exchange as to why it did not offer a bid for the impression.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.24
    public enum NoBidReasonCode: Int, Codable {
        /// Unknown Error
        case unknownError = 0
        
        /// Technical Error
        case technicalError = 1
        
        /// Invalid Request
        case invalidRequest = 2
        
        /// Known Web Spider
        case knownWebSpider = 3
        
        /// Suspected Non-Human Traffic
        case suspectedNonHumanTraffic = 4
        
        /// Cloud, Data center, or Proxy IP
        case cloudDataCenterOrProxyIP = 5
        
        /// Unsupported Device
        case unsupportedDevice = 6
        
        /// Blocked Publisher or Site
        case blockPublisherOrSite = 7
        
        /// Unmatched User
        case unmatchedUser = 8
        
        /// Daily Reader Cap Met
        case dailyReaderCapMet = 9
        
        /// Daily Domain Cap Met
        case dailyDomainCapMet = 10
    }
    
    /// This object is the top-level bid response object (i.e., the unnamed outer JSON object). The `id` attribute is a reflection of
    /// the bid request ID for logging purposes. Similarly, `bidid` is an optional response tracking ID for bidders. If specified, it
    /// can be included in the subsequent win notice call if the bidder wins. At least one `seatbid` object is required, which contains
    /// at least one bid for an impression. Other attributes are optional.
    ///
    /// To express a “no-bid”, the options are to return an empty response with HTTP 204. Alternately if the bidder wishes to convey
    /// to the exchange a reason for not bidding, just a `BidResponse` object is returned with a reason code in the `nbr` attribute.
    /// - Note: Conforms to OpenRTB 2.5 specification 4.2.1
    public struct BidReponse: Codable {
        /// ID of the bid request to which this is a response.
        let id: String
        
        /// Array of `SeatBid` objects; 1+ required if a bid is to be made.
        let seatbid: [OpenRTB2.SeatBid]?
        
        /// Bidder generated response ID to assist with logging/tracking.
        let bidid: String?
        
        /// Bid currency using ISO-4217 alpha codes.
        /// Default value is “USD”
        let cur: String?
        
        /// Optional feature to allow a bidder to set data in the exchange’s cookie.
        /// The string must be in base85 cookie safe characters and be in any format.
        /// Proper JSON encoding must be used to include “escaped” quotation marks.
        let customdata: String?
        
        /// Reason for not bidding.
        let nbr: OpenRTB2.NoBidReasonCode?
    }
}
