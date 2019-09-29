//
//  OpenRTB2+SeatBid.swift
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
    /// A bid response can contain multiple `SeatBid` objects, each on behalf of a different bidder seat and each containing one or more individual bids.
    /// If multiple impressions are presented in the request, the group attribute can be used to specify if a seat is willing to accept any impressions that it
    /// can win (default) or if it is only interested in winning any if it can win them all as a group.
    /// - Note: Conforms to OpenRTB 2.5 specification 4.2.2
    public struct SeatBid: Codable {
        /// Array of 1+ `Bid` objects each related to an impression. Multiple bids can relate to the same impression.
        let bid: [OpenRTB2.Bid]
        
        /// ID of the buyer seat (e.g., advertiser, agency) on whose behalf this bid is made.
        let seat: String?
        
        /// 0 = impressions can be won individually; 1 = impressions must be won or lost as a group.
        let group: Int?
    }
}
