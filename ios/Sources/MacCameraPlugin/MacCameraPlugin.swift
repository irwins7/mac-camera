import Capacitor
import AVFoundation

@objc(MacCamera)
public class MacCameraPlugin: CAPPlugin {
    private var captureSession: AVCaptureSession?
    private var photoOutput: AVCapturePhotoOutput?
    private var selectedDevice: AVCaptureDevice?

    @objc func listDevices(_ call: CAPPluginCall) {
        let devices = AVCaptureDevice.devices(for: .video).map {
            ["id": $0.uniqueID, "name": $0.localizedName]
        }
        call.resolve(["devices": devices])
    }

    @objc func startSession(_ call: CAPPluginCall) {
        let deviceId = call.getString("deviceId") ?? ""
        guard let device = AVCaptureDevice.devices(for: .video).first(where: { $0.uniqueID == deviceId }) else {
            call.reject("Device not found")
            return
        }
        selectedDevice = device

        captureSession = AVCaptureSession()
        captureSession?.beginConfiguration()
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if captureSession!.canAddInput(input) {
                captureSession!.addInput(input)
            }

            photoOutput = AVCapturePhotoOutput()
            if captureSession!.canAddOutput(photoOutput!) {
                captureSession!.addOutput(photoOutput!)
            }

            captureSession?.commitConfiguration()
            captureSession?.startRunning()
            call.resolve(["started": true])
        } catch {
            call.reject("Failed to start session: \(error.localizedDescription)")
        }
    }

    @objc func capturePhoto(_ call: CAPPluginCall) {
        guard let photoOutput = self.photoOutput else {
            call.reject("Photo output not ready")
            return
        }

        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
        // Store the CAPPluginCall for later resolve in delegate method
        self.savedCall = call
    }

    @objc func stopSession(_ call: CAPPluginCall) {
        captureSession?.stopRunning()
        captureSession = nil
        call.resolve(["stopped": true])
    }

    private var savedCall: CAPPluginCall?
}

extension MacCameraPlugin: AVCapturePhotoCaptureDelegate {
    public func photoOutput(_ output: AVCapturePhotoOutput,
                            didFinishProcessingPhoto photo: AVCapturePhoto,
                            error: Error?) {
        if let error = error {
            savedCall?.reject("Capture error: \(error.localizedDescription)")
            return
        }

        guard let data = photo.fileDataRepresentation() else {
            savedCall?.reject("No image data")
            return
        }

        let tempDir = FileManager.default.temporaryDirectory
        let fileURL = tempDir.appendingPathComponent(UUID().uuidString + ".jpg")
        do {
            try data.write(to: fileURL)
            savedCall?.resolve(["path": fileURL.path])
        } catch {
            savedCall?.reject("Save error: \(error.localizedDescription)")
        }
    }
}
