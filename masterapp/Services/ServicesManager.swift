//
//  ServicesManager.swift
//  masterapp
//
//  Created by Mykola Denysyuk on 12/1/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//


import Foundation
import Alamofire

// Configuration constants:

let kUserName = "admin"
let kPassword = "Scimed123"
let kBaseURL = "http://blueprint.scimeddev.com/"

let kGetSeminarMethod = "Api/Seminar/GetSeminar"

// Shared instances:

private var _sharedInstance:ServicesManager?  = ServicesManager();

// Class implementation:

typealias CompletionBlock = (success: Bool, object: AnyObject?, responseData: NSData?, error: NSError?) -> Void;

class ServicesManager: NSObject {
    
    var objectManager : RKObjectManager?
    
    // Configuration:
    
    override init() {
        super.init();
        initializeRestKit();
    }
    
    private func initializeRestKit(){
        let baseUrl = NSURL(string: kBaseURL);
        self.objectManager = RKObjectManager(baseURL: baseUrl);
        self.objectManager?.HTTPClient.setAuthorizationHeaderWithUsername(kUserName, password: kPassword);
        self.objectManager?.HTTPClient.parameterEncoding = AFJSONParameterEncoding;
        self.objectManager?.requestSerializationMIMEType = RKMIMETypeJSON;
        
        // Descriptors:
        
        var descriptor: RKResponseDescriptor? = nil;
        descriptor = ServiceResponse.responseDescriptorForClass(Seminar.self, pathPatter: kGetSeminarMethod, fromKeyPath: "Seminar");
        objectManager?.addResponseDescriptor(descriptor);
        
    }
    
    // Public:
    
    class func sharedManager() ->ServicesManager? {
        return _sharedInstance;
    }
    
    func loadSeminar(completionBlock: CompletionBlock){
        getObjectAt(kGetSeminarMethod, parameters: ["DeviceType":"iPhoneApp"], completionBlock: completionBlock);
    }
    
    func loadSeminar_alamofire(completionBlock: CompletionBlock){
        let requestPath = kBaseURL + kGetSeminarMethod;
        Alamofire.request(.GET, requestPath, parameters: ["DeviceType":"iPhoneApp"])
        .responseString { (_, _, json, error) -> Void in
            completionBlock(success: true, object: self.parseSeminar(json), responseData: nil, error: error)
        }.authenticate(user: kUserName, password: kPassword)
        
    }
    
    private func parseSeminar (json: NSString?) -> Seminar?{
        
        let MIMEType = RKMIMETypeJSON
        var error: NSError?
        let data: NSData? = json?.dataUsingEncoding(NSUTF8StringEncoding)
        let parsedData: NSDictionary? = RKMIMETypeSerialization.objectFromData(data, MIMEType: MIMEType, error: &error) as? NSDictionary

        if (parsedData == nil ?? error == nil) {
            // Parser error...
        }
        error = nil
        
        let mappingsDictionary: NSDictionary = ["ReturnValue.Seminar": Seminar.objectMapping()]
        let mapper:RKMapperOperation = RKMapperOperation(representation: parsedData, mappingsDictionary: mappingsDictionary)
        
        if (mapper.execute(&error) && error == nil) {
            return mapper.mappingResult.firstObject as? Seminar;
        }
        return nil
    }
    
    // Private:
    
    private func getObjectAt(path: String, parameters: NSDictionary?, completionBlock: CompletionBlock){
        objectManager?.getObjectsAtPath(path, parameters: parameters,
            success: { (operation:RKObjectRequestOperation!, mappingResult:RKMappingResult!) -> Void in
                let response: ServiceResponse = mappingResult.firstObject as ServiceResponse;
                completionBlock(success: true, object: response.returnedValue, responseData: operation.HTTPRequestOperation.responseData, error: nil)
            },
            failure: { (operation:RKObjectRequestOperation!, error:NSError!) -> Void in
                completionBlock(success: false, object: nil, responseData: nil, error: error)
        })
    }
}