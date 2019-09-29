//
//  OpenRTB2+Metric.swift
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
    /// This object is associated with an impression as an array of metrics. These metrics can offer insight into the
    /// impression to assist with decisioning such as average recent viewability, click-through rate, etc.
    /// Each metric is identified by its type, reports the value of the metric, and optionally identifies the source or vendor measuring the value.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.5
    public struct Metric: Codable {
        /// Type of metric being presented using exchange curated string names which should be published to bidders a priori.
        let type: String
        
        /// Number representing the value of the metric. Probabilities must be in the range 0.0 – 1.0.
        let value: Float
        
        /// Source of the value using exchange curated string names which should be published to bidders a priori.
        /// If the exchange itself is the source versus a third party, “EXCHANGE” is recommended.
        let vendor: String?
    }
}
