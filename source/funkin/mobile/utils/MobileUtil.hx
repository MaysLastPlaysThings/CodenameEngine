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
#if sys
import sys.FileSystem;
import sys.io.File;
#end

/** 
* @author MaysLastPlay, MarioMaster (MasterX-39)
* @version: 0.1.4
**/

class MobileUtil {
  public static var currentDirectory:String = null;
  public static var path:String = '';

  public static function getDirectory():String {
   #if android
   currentDirectory = Environment.getExternalStorageDirectory() + '/.' + Application.current.meta.get('file');
   #elseif ios
   currentDirectory = System.applicationStorageDirectory;
   #end
  return currentDirectory;
  }

    #if android
    public static function getPermissions():Void
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
      if(!FileSystem.exists(MobileUtil.getDirectory()))
        FileSystem.createDirectory(MobileUtil.getDirectory());
     } catch (e:Dynamic) {
    trace(e);
    Application.current.window.alert("Seems like you didnt accepted the Permissions. Please accept them to be able to run the game.", 'Uncaught Error');
     System.exit(0);
    }
  }
   public static function save(fileName:String = 'ye')
   {
    if (!FileSystem.exists(MobileUtil.getDirectory() + 'saves'))
    FileSystem.createDirectory(MobileUtil.getDirectory() + 'saves');
    
    File.saveContent(MobileUtil.getDirectory() + 'saves/' + fileName);
   }
  #end
}
