package org.gdpi.store.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.apache.log4j.Logger;

import sun.misc.BASE64Decoder;

public class ImageUpload {
	public static boolean base64ToImage(String base64Str, String path) {
		try {
			base64Str = URLDecoder.decode(base64Str, "utf-8");
			String data = base64Str.substring(base64Str.indexOf(",") + 1);

			File file = new File(path.substring(0, path.lastIndexOf("\\")));

			if (!file.exists() && !file.isDirectory()) {
				file.mkdirs();
			}
			file = new File(path);
			FileOutputStream fo = new FileOutputStream(file);
			BASE64Decoder bd = new BASE64Decoder();
			fo.write(bd.decodeBuffer(data));
			fo.flush();
			fo.close();
			return true;
		} catch (UnsupportedEncodingException e) {
			Logger.getLogger("org.gdpi.store.util.ImageUpload").warn(e.getMessage());
			e.printStackTrace();
			return false;
		} catch (FileNotFoundException e) {
			Logger.getLogger("org.gdpi.store.util.ImageUpload").warn(e.getMessage());
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			Logger.getLogger("org.gdpi.store.util.ImageUpload").warn(e.getMessage());
			e.printStackTrace();
			return false;
		}
	}
}
