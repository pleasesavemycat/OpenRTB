//
//  OpenRTB2+Deal.swift
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
    /// This object constitutes a specific deal that was struck a priori between a buyer and a seller. Its presence with
    /// the `Pmp` collection indicates that this impression is available under the terms of that deal. Refer to Section 7.3 for more details.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.12
    public struct Deal: Codable {
        /// A unique identifier for the direct deal.
        let id: String
        
        /// Minimum bid for this impression expressed in CPM.
        /// Default value is 0
        let bidfloor: Float?
        
        /// Currency specified using ISO-4217 alpha codes. This may be different from bid currency returned by bidder if this is allowed by the exchange.
        /// Default value is "USD"
        let bidfloorcur: String?
        
        /// Optional override of the overall auction type of the bid request, where 1 = First Price, 2 = Second Price Plus,
        /// 3 = the value passed in bidfloor is the agreed upon deal price. Additional auction types can be defined by the exchange.
        let at: Int?
        
        /// Whitelist of buyer seats (e.g., advertisers, agencies) allowed to bid on this deal. IDs of seats and the buyer’s customers
        /// to which they refer must be coordinated between bidders and the exchange a priori. Omission implies no seat restrictions.
        let wseat: [String]?
        
        /// Array of advertiser domains (e.g., advertiser.com) allowed to bid on this deal. Omission implies no advertiser restrictions.
        let wadomain: [String]?
    }
}
