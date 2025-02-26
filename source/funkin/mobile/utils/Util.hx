package funkin.mobile.utils;

#if android
import android.os.Build.VERSION;
import android.os.Environment;
import android.content.Context;
import android.Permissions;
import android.Settings;
#end

import haxe.io.Path;
import lime.system.System;
import lime.app.Application;
import sys.FileSystem;

class Util {
   var currentDirectory:String = getStorage.external;
   var path:String = '';

  public static function getMobileStorage() {
   getStorage(currentDirectory);
   path = Path.addTrailingSlash(currentDirectory);
  }

  public static function getStorage() {
  var external:String = Environment.getExternalStorageDirectory() + '/' + Application.current.meta.get('file') + '/';
  var data = Context.getExternalFilesDir(null) + '/';
  var no_storage:String = System.applicationStorageDirectory;
  }

    public static function getPermissions()
    {
       if(VERSION.SDK_INT >= 33){
         perms.push("android.permission.READ_MEDIA_VIDEO");
		     perms.push("android.permission.READ_MEDIA_IMAGES");
         perms.push("android.permission.READ_MEDIA_AUDIO");
         Settings.requestSetting('MANAGE_APP_ALL_FILES_ACCESS_PERMISSION');
      } else {
          perms.push("android.permission.WRITE_EXTERNAL_STORAGE");
          perms.push("android.permission.READ_EXTERNAL_STORAGE");
       }

        for (idklmao in perms)
            Permissions.requestPermissions(idklmao);

    try {
      if(!FileSystem.exists(path))
        FileSystem.createDirectory(path);
     } catch (e:Dynamic) {
    trace(e);
    Application.current.window.alert("Seems like you use No Storage Mode.\n If you want to use other modes, check options!", 'Uncaught Error');
    currentDirectory = getStorage.no_storage;
     path = Path.addTrailingSlash(currentDirectory);
      FileSystem.createDirectory(path);
    }
  }
}