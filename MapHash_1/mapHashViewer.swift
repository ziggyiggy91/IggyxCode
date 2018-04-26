//
//  mapHashViewer.swift
//  MapHash_1
//
//  Created by Ismael Garcia on 12/23/16.
//  Copyright © 2016 Ismael Garcia. All rights reserved.
//

import Foundation
import GoogleMaps
import MapKit

//ios API key AIzaSyAf9iV8yE_cBilXixEypnjwqMgC1lAVGJA

class mapHashViewer : UIViewController, MKMapViewDelegate,CLLocationManagerDelegate{
    
    
    // @IBOutlet weak var mButtonView: UIView!
    
    var locationManage = CLLocationManager()
    var findCurrentLocation = false
    var toggle = false
    var phoneHeight: CGFloat = 0
    var phoneWidth : CGFloat = 0
    let image: UIImage? = UIImage(named: "main_button_complete_pink_two")
    let image3: UIImage? = UIImage(named: "perfect_ex_icon")
    let image2: UIImage? = UIImage(named:"icon_perfect_hashtag_grey")
    //@IBOutlet var Map: UIView!
    @IBOutlet weak var mText: UITextField!
    @IBOutlet weak var mNavigator: UIButton!
    
    @IBOutlet weak var mSearch: UISearchBar!
    @IBOutlet weak var mTopView: UIView!
    @IBOutlet weak var mHashTool: UIBarButtonItem!
    @IBOutlet weak var mTempTool: UIBarButtonItem!
    @IBOutlet weak var mNotificationTool: UIBarButtonItem!
    
    var mapView:GMSMapView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManage.delegate = self
        locationManage.requestWhenInUseAuthorization()
        locationManage.startUpdatingLocation()
        iphoneScreen()
        let camera = GMSCameraPosition.camera(withLatitude: 33.852214, longitude: -118.178071, zoom: 17.0)
        
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView?.isMyLocationEnabled = true
        self.view = mapView
        //33.852214, -118.178071
        /*let marker = GMSMarker()
         marker.position = CLLocationCoordinate2D(latitude: 33.852214, longitude: -118.178071)
         mapView?.animate(toZoom: 10)
         marker.map = mapView
         self.view = mapView
         mapView?.mapType = kGMSTypeNormal
         */
        initButtons()
        
        view.addSubview(mNavigator)
        view.addSubview(mText)
        view.addSubview(mTopView)
        
        view.bringSubview(toFront: mText)
        view.bringSubview(toFront: mNavigator)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse{
            print("auth in : ")
            //  locationManage.stopUpdatingLocation()
            
            mapView?.isMyLocationEnabled = true
            mapView?.settings.myLocationButton = true
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Fatal Error")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location: \(locations.last)")
        if let location = locations.last{
            //let camera = GMSCameraPosition.camera(withLatitude: 33.852214, longitude: -118.178071, zoom: 17.0)
            
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            //   let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
            // self.mapView  = region
            let camera = GMSCameraPosition(target: center, zoom: 0, bearing: 0 ,viewingAngle: 0)
            mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            self.view = mapView
            
            //locationManage.stopUpdatingLocation()
        }
    }
    
    func initButtons(){
        mNavigator.setTitle("", for: [])
        
        print("image data: \(image)")
        mNavigator.frame =
            CGRect(x: ((phoneWidth/2) - 30), y: phoneHeight - 100, width: 75, height: 75)
        mNavigator.setBackgroundImage(image, for: [])
        mHashTool.setBackgroundImage(image2, for: [] , barMetrics: UIBarMetrics.default)
        mTopView.isHidden = true
        mSearch.placeholder = "Search for hash"
    }
    
    
    
    func iphoneScreen(){
        let iphoneScreen:CGSize = UIScreen.main.bounds.size
        phoneHeight = iphoneScreen.height
        phoneWidth = iphoneScreen.width
        print("width: \(phoneWidth) height: \(phoneHeight)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("in here? will disappear")
        view.bringSubview(toFront: mNavigator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("in here? will appear")
        view.bringSubview(toFront: mNavigator)
    }
    
    
    @IBAction func mNavigator(_ sender: AnyObject) {
        let alerting = UIAlertController(title: "", message: "View Changing", preferredStyle: .actionSheet)
        
        alerting.addAction(UIAlertAction.init(title: "Exit", style: UIAlertActionStyle.default, handler: nil))
        
        if(toggle == false){
            mNavigator.setBackgroundImage(image3, for: [])
            mNavigator.bringSubview(toFront: mNavigator)
            mTopView.addSubview(mNavigator)
            mTopView.alpha = 0.7
            mSearch.alpha = 1
            view.bringSubview(toFront: mTopView)
            mTopView.isHidden = false
            toggle = true
        }
        else{
            mNavigator.setBackgroundImage(image, for: [])
            view.addSubview(mNavigator)
            view.bringSubview(toFront: mNavigator)
            mTopView.isHidden = true
            toggle = false
        }
        
        self.present(alerting,animated:true,completion:nil)
    }
    
    
}
