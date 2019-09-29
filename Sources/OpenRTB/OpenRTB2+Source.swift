//
//  OpenRTB2+Source.swift
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
    /// Final impression sale decision corresponds to the `fd` property of `Source`, where 0 = exchange, 1 = upstream source.
    public enum FinalImpressionSaleDecision: Int, Codable {
        case exchange = 0
        case upstreamSource = 1
    }
    
    /// This object describes the nature and behavior of the entity that is the source of the bid request upstream from the exchange.
    /// The primary purpose of this object is to define post-auction or upstream decisioning when the exchange itself does not control
    /// the final decision. A common example of this is header bidding, but it can also apply to upstream server entities such as another
    /// RTB exchange, a mediation platform, or an ad server combines direct campaigns with 3rd party demand in decisioning.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.2
    public struct Source: Codable {
        /// Entity responsible for the final impression sale decision.
        let fd: OpenRTB2.FinalImpressionSaleDecision?
        
        /// Transaction ID that must be common across all participants in this bid request (e.g., potentially multiple exchanges).
        let tid: String?
        
        /// Payment ID chain string containing embedded syntax described in the TAG Payment ID Protocol v1.0.
        let pchain: String?
    }
}
