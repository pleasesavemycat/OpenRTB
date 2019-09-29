//
//  OpenRTB2+Segment.swift
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
    /// Segment objects are essentially key-value pairs that convey specific units of data.
    /// The parent `Data` object is a collection of such values from a given data provider.
    /// The specific segment names and value options must be published by the exchange a priori to its bidders.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.22
    public struct Segment: Codable {
        /// ID of the data segment specific to the data provider.
        let id: String?
        
        /// Name of the data segment specific to the data provider.
        let name: String?
        
        /// String representation of the data segment value.
        let value: String?
    }
}
