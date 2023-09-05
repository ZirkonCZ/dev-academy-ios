////
////  UserLocationService.swift
////  FDA
////
////  Created by Zdeněk Vychodil on 05.09.2023.
////
//
//import Foundation
//import Combine
//import CoreLocation
//
//protocol UserLocationService {
//    func startUpdatingLocation()
//    func stopUpdatingLocation()
//    func requestAuthorization()
//
//    func listenDidUpdateLocation(handler: @escaping ([CLLocation]) -> Void)
//    func listenDidUpdateStatus(handler: @escaping (CLAuthorizationStatus) -> Void)
//}
//
//final class ProductionUserLocationService: NSObject, UserLocationService {
//
//    private let manager: CLLocationManager
//    private var stateChangeHandler: ((CLAuthorizationStatus) -> Void)?
//    private var locationChangeHandler: (([CLLocation]) -> Void)?
//   
//    override init() {
//        // TODO
//    }
//
//    func requestAuthorization() {
//        // TODO
//    }
//
//    func listenDidUpdateLocation(handler: @escaping ([CLLocation]) -> Void) {
//        // TODO
//    }
//
//
//    func stopUpdatingLocation() {
//        // TODO
//    }
//
//    func startUpdatingLocation() {
//        // TODO
//    }
//
//    func listenDidUpdateStatus(handler: @escaping (CLAuthorizationStatus) -> Void) {
//        // TODO
//    }
//}
//
//extension ProductionUserLocationService: CLLocationManagerDelegate {
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        // TODO
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // TODO
//    }
//}
//
//final class MockLocationService: UserLocationService {
//    func startUpdatingLocation() { /* nop */ }
//    func stopUpdatingLocation() { /* nop */ }
//    func listenDidUpdateLocation(handler: @escaping ([CLLocation]) -> Void) { /* nop */ }
//    func requestAuthorization() { /* nop */ }
//    func listenDidUpdateStatus(handler: @escaping (CLAuthorizationStatus) -> Void) { /* nop */ }
//}
