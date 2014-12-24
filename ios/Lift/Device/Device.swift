import Foundation

struct DeviceInfo {
    var type: String
    var name: String
    var serialNumber: String
        
    struct Detail {
        var address: String
        var hardwareVersion: String
        var osVersion: String
    }
}

class DeviceDataDelegates {
    var accelerometerDelegate: AccelerometerDelegate
    
    required init(accelerometerDelegate: AccelerometerDelegate) {
        self.accelerometerDelegate = accelerometerDelegate
    }
}

struct DeviceSessionStats {
    var bytes: Int
    var packets: Int
}

protocol DeviceSession {

    func sessionId() -> NSUUID
    
    func sessionStats() -> [String : DeviceSessionStats]
    
}

protocol DeviceDelegate {
    
    func deviceGotDeviceInfo(deviceId: NSUUID, deviceInfo: DeviceInfo)
    
    func deviceGotDeviceInfoDetail(deviceId: NSUUID, detail: DeviceInfo.Detail)
    
    func deviceDidNotConnect(error: NSError)
    
    func deviceAppLaunchFailed(deviceId: NSUUID, error: NSError)
    
    func deviceAppLaunched(deviceId: NSUUID)
    
    func deviceDisconnected(deviceId: NSUUID)
    
}