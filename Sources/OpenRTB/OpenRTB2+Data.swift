//
//  OpenRTB2+Data.swift
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
//

import Foundation

extension OpenRTB2 {
    /// The data and segment objects together allow additional data about the related object (e.g., user, content) to be specified.
    /// This data may be from multiple sources whether from the exchange itself or third parties as specified by the id field.
    /// A bid request can mix data objects from multiple providers. The specific data providers in use should be published by the exchange a priori to its bidders.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.21
    public struct Data: Codable {
        /// Exchange-specific ID for the data provider.
        let id: String?
        
        /// Exchange-specific name for the data provider.
        let name: String?
        
        /// Array of `Segment` objects that contain the actual data values.
        let segment: [OpenRTB2.Segment]?
    }
}
