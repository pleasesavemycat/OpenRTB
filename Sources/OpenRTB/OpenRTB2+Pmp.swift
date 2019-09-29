//
//  OpenRTB2+Pmp.swift
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
    /// This object is the private marketplace container for direct deals between buyers and sellers that may pertain to this impression.
    /// The actual deals are represented as a collection of `Deal` objects.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.11
    public struct Pmp: Codable {
        /// Indicator of auction eligibility to seats named in the Direct Deals object, where 0 = all bids are accepted,
        /// 1 = bids are restricted to the deals specified and the terms thereof.
        /// The default value is 0.
        let private_auction: Int?
        
        /// Array of `Deal` objects that convey the specific deals applicable to this impression.
        let deals: [OpenRTB2.Deal]?
    }
}
