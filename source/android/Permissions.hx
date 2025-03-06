package android;

import lime.system.JNI;
class Permissions {
    public static function requestPermissions(permissions:Array<String>, requestCode:Int = 1):Void {
        JNI.createStaticMethod('extension/Thing', 'requestPermissions', '([Ljava/lang/String;I)V')(permissions, requestCode);
    }
    public static function requestPermission(permission:String, requestCode:Int = 1):Void {
        JNI.createStaticMethod('extension/Thing', 'requestPermissions', '([Ljava/lang/String;I)V')([permission], requestCode);
    }
    public static function hasPermission(permission:String):Bool {
        return JNI.createStaticMethod('extension/Thing', 'hasPermission', '(Ljava/lang/String;)Z')(permission);
    }
    public static function openAppSettings(perm:String):Void {
        JNI.createStaticMethod('extension/Thing', 'openAppSettings', '(Ljava/lang/String;)V')(perm);
    }
    public static function hasManageExternalStoragePermission():Bool {
        return JNI.createStaticMethod('extension/Thing', 'hasManageExternalStoragePermission', '()Z')();
    }
    public static function requestManageExternalStorage() {
        JNI.createStaticMethod('extension/Thing', 'requestManageExternalStorage', '()V')();
    }
}