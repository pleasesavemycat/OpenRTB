//
//  OpenRTB2+User.swift
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
    /// This object contains information known or derived about the human user of the device (i.e., the audience for advertising).
    /// The user id is an exchange artifact and may be subject to rotation or other privacy policies. However, this user ID must be
    /// stable long enough to serve reasonably as the basis for frequency capping and retargeting.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.20
    public struct User: Codable {
        /// Exchange-specific ID for the user. At least one of `id` or `buyeruid` is recommended.
        let id: String?
        
        /// Buyer-specific ID for the user as mapped by the exchange for the buyer. At least one of `buyeruid` or `id` is recommended.
        let buyeruid: String?
        
        /// Year of birth as a 4-digit integer.
        let yob: Int?
        
        /// Gender, where “M” = male, “F” = female, “O” = known to be other (i.e., omitted is unknown).
        let gender: String?
        
        /// Comma separated list of keywords, interests, or intent.
        let keywords: String?
        
        /// Optional feature to pass bidder data that was set in the exchange’s cookie.
        /// The string must be in base85 cookie safe characters and be in any format. Proper JSON encoding must be used to include “escaped” quotation marks.
        let customdata: String?
        
        /// Location of the user’s home base. This is not necessarily their current location.
        let geo: OpenRTB2.Geo?
        
        /// Additional user data. Each `Data` object represents a different data source.
        let data: [OpenRTB2.Data]?
    }
}
