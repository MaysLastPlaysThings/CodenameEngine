package mobile.utils;

#if android
import android.os.Build.VERSION;
import android.os.Environment;
import android.content.Context;
import android.Permissions;
#end

import lime.system.System;
import lime.app.Application;
import sys.FileSystem;

class Util {
var currentDirectory:String = external;

  public static function getMobileStorage() {
   var path:String = '';
   getStorage(currentDirectory);
   path = getStorage(currentDirectory);
    
    try {
      if(!FileSystem.exists(path))
        FileSystem.createDirectory(path);
     } catch (e:Dynamic) {
    trace(e);
    Application.current.window.alert("Seems like you use No Storage Mode.\n If you want to use other modes, check options!", 'Uncaught Error');
    currentDirectory = no_storage;
     path = getStorage(currentDirectory);
      FileSystem.createDirectory(path);
    }
  }

  public static function getStorage() {
  var external:String = Environment.getExternalStorageDirectory() + '/' + Application.current.meta.get('file') + '/';
  var data = Context.getExternalFilesDir(null) + '/';
  var no_storage:String = System.applicationStorageDirectory;
  }

    public static function getPermissions()
    {
       if(VERSION.SDK_INT >= 33){
         sus.push("android.permission.READ_MEDIA_VIDEO");
		     sus.push("android.permission.READ_MEDIA_IMAGES");
         sus.push("android.permission.READ_MEDIA_AUDIO");
      } else {
             sus.push("android.permission.WRITE_EXTERNAL_STORAGE");
             sus.push("android.permission.READ_EXTERNAL_STORAGE");
       }

        for (idklmao in sus)
            Permissions.requestPermissions(idklmao);
    }
}