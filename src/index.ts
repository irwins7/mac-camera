import { registerPlugin, Capacitor } from '@capacitor/core';
import type { MacCameraPlugin } from './definitions';

export const MacCamera = registerPlugin<MacCameraPlugin>('MacCamera');

export function isMacCatalyst(): boolean {
  return Capacitor.getPlatform() === 'ios' && navigator.userAgent.includes('Macintosh');
}

export * from './definitions';
