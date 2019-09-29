//
//  OpenRTB2+Producer.swift
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
    /// This object defines the producer of the content in which the ad will be shown.
    /// This is particularly useful when the content is syndicated and may be distributed through different publishers
    /// and thus when the producer and publisher are not necessarily the same entity.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.17
    public struct Producer: Codable {
        /// Content producer or originator ID. Useful if content is syndicated and may be posted on a site using embed tags.
        let id: String?
        
        /// Content producer or originator name.
        let name: String?
        
        /// Array of IAB content categories that describe the content producer. Refer to List 5.1.
        let cat: [String]?
        
        /// Highest level domain of the content producer (e.g., “producer.com”).
        let domain: String?
    }
}
