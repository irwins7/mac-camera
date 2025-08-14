# mac-camera

Mac Catalyst camera plugin for Capacitor (switch cameras, capture photos)

## Install

```bash
npm install mac-camera
npx cap sync
```

## API

<docgen-index>

* [`listDevices()`](#listdevices)
* [`startSession(...)`](#startsession)
* [`capturePhoto()`](#capturephoto)
* [`stopSession()`](#stopsession)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### listDevices()

```typescript
listDevices() => Promise<{ devices: MacCameraDevice[]; }>
```

**Returns:** <code>Promise&lt;{ devices: MacCameraDevice[]; }&gt;</code>

--------------------


### startSession(...)

```typescript
startSession(options: { deviceId: string; }) => Promise<{ started: boolean; }>
```

| Param         | Type                               |
| ------------- | ---------------------------------- |
| **`options`** | <code>{ deviceId: string; }</code> |

**Returns:** <code>Promise&lt;{ started: boolean; }&gt;</code>

--------------------


### capturePhoto()

```typescript
capturePhoto() => Promise<{ path: string; }>
```

**Returns:** <code>Promise&lt;{ path: string; }&gt;</code>

--------------------


### stopSession()

```typescript
stopSession() => Promise<{ stopped: boolean; }>
```

**Returns:** <code>Promise&lt;{ stopped: boolean; }&gt;</code>

--------------------


### Interfaces


#### MacCameraDevice

| Prop       | Type                |
| ---------- | ------------------- |
| **`id`**   | <code>string</code> |
| **`name`** | <code>string</code> |

</docgen-api>
