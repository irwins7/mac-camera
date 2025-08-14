var capacitorMacCamera = (function (exports, core) {
    'use strict';

    const MacCamera = core.registerPlugin('MacCamera');
    function isMacCatalyst() {
        return core.Capacitor.getPlatform() === 'ios' && navigator.userAgent.includes('Macintosh');
    }

    exports.MacCamera = MacCamera;
    exports.isMacCatalyst = isMacCatalyst;

    return exports;

})({}, capacitorExports);
//# sourceMappingURL=plugin.js.map
