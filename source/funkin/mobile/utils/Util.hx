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
  public static var currentDirectory:String = null;
  public static var path:String = '';

  public static function getMobileDirectory():String {
   currentDirectory = Environment.getExternalStorageDirectory() + '/.' + Application.current.meta.get('file');
  return currentDirectory;
  }

    public static function getMobilePermissions():Void
    {
    path = Path.addTrailingSlash(Environment.getExternalStorageDirectory() + '/.' + Application.current.meta.get('file'));
  
       if(VERSION.SDK_INT >= 33){
		Permissions.requestPermissions(['READ_MEDIA_IMAGES', 'READ_MEDIA_VIDEO', 'READ_MEDIA_AUDIO']);
	    if (!Environment.isExternalStorageManager()) {
	    Settings.requestSetting('REQUEST_MANAGE_MEDIA');
	    Settings.requestSetting('MANAGE_APP_ALL_FILES_ACCESS_PERMISSION');
	    }
      } else {
        Permissions.requestPermissions(['READ_EXTERNAL_STORAGE', 'WRITE_EXTERNAL_STORAGE']);
	  }

    try {
      if(!FileSystem.exists(Util.getMobileDirectory()))
        FileSystem.createDirectory(Util.getMobileDirectory());
     } catch (e:Dynamic) {
    trace(e);
    Application.current.window.alert("Seems like you use No Storage Mode.\n If you want to use other modes, check options!", 'Uncaught Error');
    /*currentDirectory = System.applicationStorageDirectory;
     path = Path.addTrailingSlash(currentDirectory);
      FileSystem.createDirectory(path);*/
    }
  }
}
