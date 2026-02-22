// MARK: Contoh 1

//import UIKit
//import SystemConfiguration
//
//let reachability = SCNetworkReachabilityCreateWithName(nil, "www.dicoding.com")
//
//var flags = SCNetworkReachabilityFlags()
//SCNetworkReachabilityGetFlags(reachability!, &flags)
//
//let isReachable = flags.contains(.reachable)
//
//print("IS REACHABLE: \(isReachable)")

// MARK: Contoh kedua

//import UIKit
//import SystemConfiguration
//
//func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
//    let isReachable = flags.contains(.reachable)
//    let needsConnention = flags.contains(.connectionRequired)
//    let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
//    let canConnecntWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
//    return isReachable && (!needsConnention || canConnecntWithoutUserInteraction)
//}
//
//let reachability = SCNetworkReachabilityCreateWithName(nil, "www.dicoding.com")
//
//var flags = SCNetworkReachabilityFlags()
//SCNetworkReachabilityFlags(reachability!, flags)
//
//if !isNetworkReachable(with: flags) {
//    print("Device does'nt have internet connection")
//} else {
//    print("Host www.dicoding.com is reachable")
//}
//
//if flags.contains(.isWWAN) {
//    print("Device is using mobile data")
//}
