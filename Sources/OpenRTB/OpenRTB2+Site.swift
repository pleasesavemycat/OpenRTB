//
//  OpenRTB2+Site.swift
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
    /// This object describes an ad placement or impression being auctioned.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.13
    public struct Site: Codable {
        /// Exchange-specific site ID.
        let id: String?
        
        /// Site name (may be aliased at the publisher’s request).
        let name: String?
        
        /// Domain of the site (e.g., “mysite.foo.com”).
        let domain: String?
        
        /// Array of IAB content categories of the site.
        let cat: [String]?
        
        /// Array of IAB content categories that describe the current section of the site.
        let sectioncat: [String]?
        
        /// Array of IAB content categories that describe the current page or view of the site.
        let pagecat: [String]?
        
        /// URL of the page where the impression will be shown.
        let page: String?
        
        /// Referrer URL that caused navigation to the current page.
        let ref: String?
        
        /// Search string that caused navigation to the current page.
        let search: String?
        
        /// Indicates if the site has been programmed to optimize layout when viewed on mobile devices, where 0 = no, 1 = yes.
        let mobile: Int?
        
        /// Indicates if the site has a privacy policy, where 0 = no, 1 = yes.
        let privacypolicy: Int?
        
        /// Details about the Publisher of the site.
        let publisher: OpenRTB2.Publisher?
        
        /// Details about the Content within the site.
        let content: OpenRTB2.Content?
        
        /// Comma separated list of keywords about the site.
        let keywords: String?
    }
}

// MARK: - Convenience properties that provide type translations
extension OpenRTB2.Site {
    /// Flag indicating if the site has been programmed to optimize layout when viewed on mobile devices.
    /// - Note: This property is sourced by the `mobile` field.
    var isMobile: Bool { (mobile ?? 0) == 1 }
    
    /// Flag indicating if the site has a privacy policy,
    /// - Note: This property is sourced by the `privacypolicy` field.
    var hasPrivacyPolicy: Bool { (privacypolicy ?? 0) == 1 }
}
