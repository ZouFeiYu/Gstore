package org.gdpi.store.util;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
/**
 * 鍒涘缓涓�寮犻獙璇佺爜鍥剧墖,榛樿闀垮害涓�180px,楂樺害涓�60px,鏂囧瓧闀垮害涓�5*/
public class CheckCode {
	private static int CODE_LENGTH=5;
	private static int IMG_WIDTH=180;
	private static int IMG_HEIGHT=60;
	private static String[] CHAR_SET= {
			"0","1","2","3","4","5","6","7","8","9",
			"Q","W","E","R","T","Y","U","I","O","P",
			"A","S","D","F","G","H","J","K","L"
			,"Z","X","C","V","B","N","M",
			"q","w","e","r","t","y","u","i","o","p",
			"a","s","d","f","g","h","j","k","l",
			"z","x","c","v","b","n","m"
	};
	/**
	 * 璁剧疆楠岃瘉鐮佺殑鍙傛暟
	 * @param codeLength  楠岃瘉鐮佸瓧绗﹂暱搴�;
	 * @param imgWidth 	 楠岃瘉鐮佸浘鐗囧搴�;
	 * @param ImgHeight 	 楠岃瘉鐮佸浘鐗囬珮搴�;*/
	public static void setParam(int codeLength,int imgWidth,int ImgHeight) {
		CODE_LENGTH=codeLength;
		IMG_WIDTH=imgWidth;
		IMG_HEIGHT=ImgHeight;
	}
	/**
	 * 璁剧疆楠岃瘉鐮佷腑鍙兘鍑虹幇鐨勫��*/
	public static void setCharSet(String[] charSet) {
		CHAR_SET=charSet;
	}
	/**
	 * 娣诲姞楠岃瘉鐮佷腑鍙兘鍑虹幇鐨勫��*/
	public static void addCharSet(String str) {
		String[] charSet=CHAR_SET;
		CHAR_SET=new String[charSet.length+1];
		for(Integer i=0;i<charSet.length;i++) {
			CHAR_SET[i]=charSet[i];
		}
		CHAR_SET[charSet.length]=str;
	}
	public static void removeCharSet(String str) {
		String[] charSet=CHAR_SET;
		Integer count=1;
		CHAR_SET=new String[charSet.length-1];
		for(Integer i=0,j=0;i<charSet.length;i++) {
			if(charSet[i].equals(str)&&count>0) {
				count--;
				continue;
			}
			CHAR_SET[j]=charSet[i];
			j++;
		}
	}
	/**
	 * 杩斿洖鏂版瀯寤虹殑楠岃瘉鐮�
	 * @param codeName 璁剧疆杩斿洖鍊间腑楠岃瘉鐮佺殑key;
	 * @param imgName 璁剧疆杩斿洖鍊间腑鍥剧墖鐨刱ey;*/
	public static Map<String,Object> newCode(String codeName,String imgName) {
		//鏋勫缓楠岃瘉鐮�
		String code="";
		//鏋勫缓闅忔満鏁�,鐢ㄤ簬鑾峰彇楠岃瘉鐮�
		Random random=new Random();
		//鍒涘缓鐢绘澘
		BufferedImage image=new BufferedImage(IMG_WIDTH,IMG_HEIGHT,BufferedImage.TYPE_INT_RGB);
		//鑾峰緱鐢荤瑪
		Graphics2D graphics=image.createGraphics();
		//鑾峰彇鑳屾櫙棰滆壊
		graphics.setColor(new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)));
		//鐢诲嚭鑳屾櫙
		graphics.fillRect(0, 0, IMG_WIDTH,IMG_HEIGHT);
		//璁剧疆鐢荤瑪瀛椾綋
		graphics.setFont(new Font(null,Font.PLAIN,IMG_WIDTH/CODE_LENGTH));
		//鑾峰彇骞剁敾鍑洪獙璇佺爜
		for(int i=0;i<CODE_LENGTH;i++) {
			//浠嶤HAR_SET涓殢鏈烘娊鍙栦竴涓瓧绗�
			String str=CHAR_SET[random.nextInt(CHAR_SET.length)];
			//璁剧疆鐢荤瑪棰滆壊
			graphics.setColor(new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)));
			//鐢诲嚭璇ュ瓧绗�
			graphics.drawString(str, (IMG_WIDTH/CODE_LENGTH)*i+(IMG_WIDTH/(4*CODE_LENGTH)),(IMG_WIDTH/CODE_LENGTH)+random.nextInt(IMG_HEIGHT)/2);
			//娣诲姞瀛楃鍒伴獙璇佺爜涓�
			code+=str;
		}
		//璁℃暟鍣�,璁惧畾鏈�灏忓共鎵扮嚎鏁�
		int count=CODE_LENGTH;
		//鐢诲共鎵扮嚎
		while(random.nextInt(10)>1||count>0) {
			//璁剧疆鐢荤瑪棰滆壊
			graphics.setColor(new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)));
			//璁剧疆绾挎潯澶у皬
			graphics.setStroke(new BasicStroke(random.nextInt(IMG_WIDTH/CODE_LENGTH/8)));
			//鐢荤嚎
			graphics.drawLine(random.nextInt(IMG_WIDTH),random.nextInt(IMG_HEIGHT),random.nextInt(IMG_WIDTH),random.nextInt(IMG_HEIGHT));
			//璁℃暟鍣ㄥ彔鍔�
			count--;
		}
		//鍒涘缓闆嗗悎鎶婇獙璇佺爜鍜屽浘鐗囨墦鍖呰繑鍥�
		Map<String,Object> map=new HashMap<String,Object>();
		//鏀惧叆楠岃瘉鐮�
		map.put(codeName, code);
		//鏀惧叆鍥剧墖
		map.put(imgName, image);
		return map;
	}
}
