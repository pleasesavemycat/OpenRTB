//
//  OpenRTB2+Format.swift
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
    /// This object represents an allowed size (i.e., height and width combination) or Flex Ad parameters for a banner impression.
    /// These are typically used in an array where multiple sizes are permitted. It is recommended that either the `w`/`h` pair or the
    /// `wratio`/`hratio`/`wmin` set (i.e., for Flex Ads) be specified.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.10
    public struct Format: Codable {
        /// Width in device independent pixels (DIPS).
        let w: Int?
        
        /// Height in device independent pixels (DIPS).
        let h: Int?
        
        /// Relative width when expressing size as a ratio.
        let wratio: Int?
        
        /// Relative height when expressing size as a ratio.
        let hratio: Int?
        
        /// The minimum width in device independent pixels (DIPS) at which the ad will be displayed the size is expressed as a ratio.
        let wmin: Int?
    }
}
