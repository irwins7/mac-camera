import { registerPlugin, Capacitor } from '@capacitor/core';
export const MacCamera = registerPlugin('MacCamera');
export function isMacCatalyst() {
    return Capacitor.getPlatform() === 'ios' && navigator.userAgent.includes('Macintosh');
}
export * from './definitions';
//# sourceMappingURL=index.js.map