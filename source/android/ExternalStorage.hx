package android;

import lime.system.JNI;
class ExternalStorage {
    public static function getExternalStorageDir():String {
        return JNI.createStaticMethod('extension/Thing', 'getExternalStorageDir', '()Ljava/lang/String;')();
    }
}