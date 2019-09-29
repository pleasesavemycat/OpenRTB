//
//  OpenRTB2+Native.swift
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
    /// This object represents a native type impression. Native ad units are intended to blend seamlessly into the surrounding
    /// content (e.g., a sponsored Twitter or Facebook post). As such, the response must be well-structured to afford the publisher f
    /// ine-grained control over rendering.
    ///
    /// The Native Subcommittee has developed a companion specification to OpenRTB called the Dynamic Native Ads API.
    /// It defines the request parameters and response markup structure of native ad units. This object provides the means of
    /// transporting request parameters as an opaque string so that the specific parameters can evolve separately under the auspices
    /// of the Dynamic Native Ads API. Similarly, the ad markup served will be structured according to that specification.
    ///
    /// The presence of a `Native` as a subordinate of the `Impression` object indicates that this impression is offered as a
    /// native type impression. At the publisher’s discretion, that same impression may also be offered as banner, video, and/or audio
    /// by also including as `Impression` subordinates objects of those types. However, any given bid for the impression must conform
    /// to one of the offered types.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.9
    public struct Native: Codable {
        /// Request payload complying with the Native Ad Specification.
        let request: String
        
        /// Version of the Dynamic Native Ads API to which request complies; highly recommended for efficient parsing.
        let ver: String?
        
        /// List of supported API frameworks for this impression. If an API is not explicitly listed, it is assumed not to be supported.
        let api: [OpenRTB2.ApiFramework]?
        
        /// Blocked creative attributes.
        let battr: [OpenRTB2.CreativeAttribute]?
    }
}
