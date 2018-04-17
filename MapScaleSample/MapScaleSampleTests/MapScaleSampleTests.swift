//
//  MapScaleSampleTests.swift
//  MapScaleSampleTests
//
//  Created by CBS MOBIL on 11.04.2018.
//  Copyright © 2018 fozoglu. All rights reserved.
//

import XCTest
import ArcGIS
@testable import MapScaleSample

class MapScaleSampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testMapScale(){
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? MapScaleViewController else{
                XCTFail("Could not instatiate VC from Main Storyboard")
                return
        }
        vc.loadViewIfNeeded()
        guard let mapView = vc.mapView else {
            XCTFail("ViewController should have outlet set for mapView")
            return
        }
        //let map = AGSMap(basemap: AGSBasemap.streets())
        //mapView.map = map
        mapView.setViewpointCenter(AGSPoint(x: -117.1618385, y: 32.7065281 , spatialReference: AGSSpatialReference.wgs84()), scale: 25000, completion: {(sucess) in
            print(mapView.mapScale)
            let mapViewScaleValue = mapView.mapScale
            XCTAssertEqual(mapViewScaleValue, 25000, "MapView should load from the storyboard with correct scale")
        })
    }
}
