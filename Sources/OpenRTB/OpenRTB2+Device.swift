//
//  OpenRTB2+Device.swift
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
    /// The following table lists the type of device from which the impression originated.
    /// OpenRTB version 2.2 of the specification added distinct values for Mobile and Tablet.
    /// It is recommended that any bidder adding support for 2.2 treat a value of 1 as an acceptable alias of 4 & 5.
    /// This OpenRTB enumeration has values derived from the Inventory Quality Guidelines (IQG). Practitioners should keep in sync with updates to the IQG values.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.21
    public enum DeviceType: Int, Codable {
        case mobileOrTablet = 1
        case personalComputer = 2
        case connectedTV = 3
        case phone = 4
        case tablet = 5
        case connectedDevice = 6
        case setTopBox = 7
    }
    
    /// The following enumeration lists the various options for the type of device connectivity.
    /// - Note: Conforms to OpenRTB 2.5 specification 5.22
    public enum ConnectionType: Int, Codable {
        case unknown = 0
        case ethernet = 1
        case wifi = 2
        case cellularNetwork = 3
        case cellularNetwork2G = 4
        case cellularNetwork3G = 5
        case cellularNetwork4G = 6
    }
    
    /// This object provides information pertaining to the device through which the user is interacting.
    /// Device information includes its hardware, platform, location, and carrier data. The device can refer to a mobile handset,
    /// a desktop computer, set top box, or other digital device.
    /// - Note: Conforms to OpenRTB 2.5 specification 3.2.18
    public struct Device: Codable {
        /// Browser user agent string.
        let ua: String?
        
        /// Location of the device assumed to be the user’s current location.
        let geo: OpenRTB2.Geo?
        
        /// Standard “Do Not Track” flag as set in the header by the browser, where 0 = tracking is unrestricted, 1 = do not track.
        let dnt: Int?
        
        /// “Limit Ad Tracking” signal commercially endorsed (e.g., iOS, Android), where 0 = tracking is unrestricted, 1 = tracking must
        /// be limited per commercial guidelines.
        let lmt: Int?
        
        /// IPv4 address closest to device.
        let ip: String?
        
        /// IP address closest to device as IPv6.
        let ipv6: String?
        
        /// The general type of device.
        let devicetype: OpenRTB2.DeviceType?
        
        /// Device make (e.g., “Apple”).
        let make: String?
        
        /// Device model (e.g., “iPhone”).
        let model: String?
        
        /// Device operating system (e.g., “iOS”).
        let os: String?
        
        /// Device operating system version (e.g., “3.1.2”).
        let osv: String?
        
        /// Hardware version of the device (e.g., “5S” for iPhone 5S).
        let hwv: String?
        
        /// Physical height of the screen in pixels.
        let h: Int?
        
        /// Physical width of the screen in pixels.
        let w: Int?
        
        /// Screen size as pixels per linear inch.
        let ppi: Int?
        
        /// The ratio of physical pixels to device independent pixels.
        let pxratio: Float?
        
        /// Support for JavaScript, where 0 = no, 1 = yes.
        let js: Int?
        
        /// Indicates if the geolocation API will be available to JavaScript code running in the banner, where 0 = no, 1 = yes.
        let geofetch: Int?
        
        /// Version of Flash supported by the browser.
        let flashver: String?
        
        /// Browser language using ISO-639-1-alpha-2.
        let language: String?
        
        /// Carrier or ISP (e.g., “VERIZON”) using exchange curated string names which should be published to bidders a priori.
        let carrier: String?
        
        /// Mobile carrier as the concatenated MCC-MNC code (e.g., “310-005” identifies Verizon Wireless CDMA in the USA).
        /// Refer to https://en.wikipedia.org/wiki/Mobile_country_code for further examples.
        /// Note that the dash between the MCC and MNC parts is required to remove parsing ambiguity.
        let mccmnc: String?
        
        /// Network connection type.
        let connectiontype: OpenRTB2.ConnectionType?
        
        /// ID sanctioned for advertiser use in the clear (i.e., not hashed).
        let ifa: String?
        
        /// Hardware device ID (e.g., IMEI); hashed via SHA1.
        let didsha1: String?
        
        /// Hardware device ID (e.g., IMEI); hashed via MD5.
        let didmd5: String?
        
        /// Platform device ID (e.g., Android ID); hashed via SHA1.
        let dpidsha1: String?
        
        /// Platform device ID (e.g., Android ID); hashed via MD5.
        let dpidmd5: String?
        
        /// MAC address of the device; hashed via SHA1.
        let macsha1: String?
        
        /// MAC address of the device; hashed via MD5.
        let macmd5: String?
    }
}

// MARK: - Convenience properties that provide type translations
extension OpenRTB2.Device {
    /// Flag indicating the standard “Do Not Track” flag is set in the header by the browser.
    /// - Note: This property is sourced by the `dnt` field.
    var isDoNotTrackEnabled: Bool { (dnt ?? 0) == 1 }
    
    /// Flag indicating the "LimitAd Tracking" signal is enabled.
    /// - Note: This property is sourced by the `lmt` field.
    var isLimitAdTrackingEnabled: Bool { (lmt ?? 0) == 1 }
    
    /// Flag indicating that JavaScript is supported.
    /// - Note: This property is sourced by the `js` field.
    var isJavascriptSupported: Bool { (js ?? 0) == 1 }
    
    /// Flag indicating that geolocation API will be available to JavaScript code running in the banner.
    /// - Note: This property is sourced by the `geofetch` field.
    var isJavascriptGeolocationAllowed: Bool { (geofetch ?? 0) == 1 }
}
