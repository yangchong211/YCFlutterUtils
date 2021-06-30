package com.yc.na_plugin.util;


import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.io.FileInputStream;
import java.io.IOException;

import io.flutter.embedding.engine.loader.FlutterLoader;

/**
 * <pre>
 *     author: 杨充
 *     blog  : https://juejin.cn/user/1978776659695784
 *     time  : 2017/03/13
 *     desc  : 缓存相关工具类
 * </pre>
 */
public final class ImageUtils {

    /**
     * 从资源路径获取文件，并加载成bitmap，注意仅限于加载flutter图片资源
     * @param context                                   上下文
     * @param fileName                                  文件路径
     * @return
     */
    public static Bitmap getImageFromAssetsFile(Context context, String fileName) {
        Bitmap bitmap = null;
        //问题，怎么获取这个对象，PluginRegistry.Registrar; 暂时不用这种
        AssetManager assetManager = context.getResources().getAssets();
        //通过flutter获取loader对象
        FlutterLoader loader = FlutterLoader.getInstance();
        //去flutter资源包下找文件，路径为：flutter_assets/fileName
        String key = loader.getLookupKeyForAsset(fileName);
        AssetFileDescriptor is = null;
        try {
            //打开文件
            is = assetManager.openFd(key);
            FileInputStream inputStream = is.createInputStream();
            bitmap = BitmapFactory.decodeStream(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (is!=null){
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return bitmap;
    }

}
