export interface MacCameraDevice {
  id: string;
  name: string;
}

export interface MacCameraPlugin {
  listDevices(): Promise<{ devices: MacCameraDevice[] }>;
  startSession(options: { deviceId: string }): Promise<{ started: boolean }>;
  capturePhoto(): Promise<{ path: string }>;
  stopSession(): Promise<{ stopped: boolean }>;
}
