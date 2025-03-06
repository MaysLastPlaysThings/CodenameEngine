package funkin.mobile.utils;

#if android
import android.ExternalStorage;
import android.Permissions;
#end

import openfl.Lib;
import haxe.io.Path;
import lime.system.System;
import lime.app.Application;
import sys.FileSystem;
import lime.system.JNI;

/** 
* @author MaysLastPlay
**/

class Util {
  public static var currentDirectory:String = null;
  public static var path:String = '';

  public static function getMobileDirectory():String {
  if (ExternalStorage.getExternalStorageDir() != null)
   currentDirectory = '${ExternalStorage.getExternalStorageDir()}/.' + Application.current.meta.get('file') + '/';
  return currentDirectory;
  }

    public static function getMobilePermissions():Void
    {
    path = Path.addTrailingSlash('${ExternalStorage.getExternalStorageDir()}/.' + Application.current.meta.get('file') + '/');
  
     var SDK = JNI.createStaticMethod('extension/Thing', 'getSDKVersion', '()I')();
        if (SDK >= 30)
        {
            if (!Permissions.hasManageExternalStoragePermission()) {
                Lib.application.window.alert("Please grant storage permission in settings.", "Permission Request");
                Permissions.requestManageExternalStorage();
            } else {
                if (!FileSystem.exists(Util.getMobileDirectory() + 'assets/'))
                    FileSystem.createDirectory(Util.getMobileDirectory() + 'assets/');
            }
        } else if (SDK == 29) {
            if (!Permissions.hasPermission('android.permission.READ_EXTERNAL_STORAGE'))
            {
                Lib.application.window.alert('You need to accept the permission(s) if want to proceed to the game!\n\nIf denied expect a crash.', 'Permission Request');
                Permissions.requestPermissions(['android.permission.READ_EXTERNAL_STORAGE']);
            } else {
                if (!FileSystem.exists(Util.getMobileDirectory() + 'assets/'))
                    FileSystem.createDirectory(Util.getMobileDirectory() + 'assets/');
            }
        } else {
            if (!Permissions.hasPermission('android.permission.READ_EXTERNAL_STORAGE') || !Permissions.hasPermission('android.permission.WRITE_EXTERNAL_STORAGE'))
            {
                Lib.application.window.alert('You need to accept the permission(s) if want to proceed to the game!\n\nIf denied expect a crash.', 'Permission Request');
                Permissions.requestPermissions(['android.permission.READ_EXTERNAL_STORAGE', 'android.permission.WRITE_EXTERNAL_STORAGE']);
              
            } else {
                if (!FileSystem.exists(Util.getMobileDirectory() + 'assets/'))
                    FileSystem.createDirectory(Util.getMobileDirectory() + 'assets/');
    }
   }
  }
}
