import { registerPlugin } from '@capacitor/core';
import type { MacCameraPlugin } from './definitions';

const MacCamera = registerPlugin<MacCameraPlugin>('MacCamera');

export * from './definitions';
export { MacCamera };
