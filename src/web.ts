import { WebPlugin } from '@capacitor/core';
import type { MacCameraPlugin } from './definitions';

export class MacCameraWeb extends WebPlugin implements MacCameraPlugin {
  async listDevices() { return { devices: [] }; }
  async startSession(_: { deviceId: string }) { return { started: false }; }
  async capturePhoto() { return { path: '' }; }
  async stopSession() { return { stopped: false }; }
}
