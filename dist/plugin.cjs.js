'use strict';

var core = require('@capacitor/core');

const MacCamera = core.registerPlugin('MacCamera');
function isMacCatalyst() {
    return core.Capacitor.getPlatform() === 'ios' && navigator.userAgent.includes('Macintosh');
}

exports.MacCamera = MacCamera;
exports.isMacCatalyst = isMacCatalyst;
//# sourceMappingURL=plugin.cjs.js.map
