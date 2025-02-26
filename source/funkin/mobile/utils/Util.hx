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
   public static var currentDirectory:String = external;
   public static var path:String = '';
   public static var external:String = Environment.getExternalStorageDirectory() + '/' + Application.current.meta.get('file') + '/';
   public static var data = Context.getExternalFilesDir(null) + '/';
   public static var no_storage:String = System.applicationStorageDirectory;

  public static function getMobileStorage() {
   path = Path.addTrailingSlash(currentDirectory);
  }

    public static function getPermissions()
    {
       if(VERSION.SDK_INT >= 33){
		AndroidPermissions.requestPermissions(['READ_MEDIA_IMAGES', 'READ_MEDIA_VIDEO', 'READ_MEDIA_AUDIO']);
		AndroidSettings.requestSetting('REQUEST_MANAGE_MEDIA');
	    AndroidSettings.requestSetting('MANAGE_APP_ALL_FILES_ACCESS_PERMISSION');
      } else {
        AndroidPermissions.requestPermissions(['READ_EXTERNAL_STORAGE', 'WRITE_EXTERNAL_STORAGE']);
	  }

    try {
      if(!FileSystem.exists(path))
        FileSystem.createDirectory(path);
     } catch (e:Dynamic) {
    trace(e);
    Application.current.window.alert("Seems like you use No Storage Mode.\n If you want to use other modes, check options!", 'Uncaught Error');
    currentDirectory = no_storage;
     path = Path.addTrailingSlash(currentDirectory);
      FileSystem.createDirectory(path);
    }
  }
}