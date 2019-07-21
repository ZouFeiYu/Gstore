package org.gdpi.store.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.gdpi.store.bean.AskResult;
import org.gdpi.store.util.ImageUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/upload")
public class FileController {
	/**
	 * 用户头像上传
	 * @param data
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/portrait/{id}")
	@ResponseBody
	public AskResult<Map<String, String>> portrait(@RequestBody String data, @PathVariable String id,
			HttpServletRequest request) {
		AskResult<Map<String, String>> askResult = new AskResult<Map<String, String>>();
		Map<String, String> map = new HashMap<String, String>();

		String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		String type = "png";
		String path = "Gstore.upload/images/" + id + "/" + name + "." + type;
		String url = request.getServletContext().getRealPath("../" + path);
		String hostAddr = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		String imgPath = hostAddr + "/" + path;
		if (ImageUpload.base64ToImage(data, url)) {
			askResult.setCode(1);
			askResult.setMsg("头像上传成功");
			map.put("url", imgPath);
		}else {
			askResult.setCode(0);
			askResult.setMsg("头像上传失败");
			map.put("url", null);
		}
		
		askResult.setData(map);
		return askResult;
	}
}
