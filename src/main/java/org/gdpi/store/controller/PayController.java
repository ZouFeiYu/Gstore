package org.gdpi.store.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gdpi.store.bean.AskResult;
import org.gdpi.store.bean.OrderForm;
import org.gdpi.store.bean.User;
import org.gdpi.store.service.OrderService;
import org.gdpi.store.util.CheckCode;
import org.gdpi.store.util.ZXingCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


@Controller
@RequestMapping("/action")
public class PayController {
	@Resource
	OrderService orderService;
	private Map<String, Integer> orderStatus=new HashMap<>();
	@RequestMapping("/pay/qrcode/{bankId}")
	public void qrcode(HttpServletResponse response, HttpServletRequest request, @PathVariable("bankId") String bankId)
			throws IOException {
		User user = (User) request.getSession().getAttribute("onLineUser");
		String orderId = (String) request.getSession().getAttribute("orderId");
		Integer orderPrice = (Integer) request.getSession().getAttribute("orderPrice");
		List<OrderForm> ofs = (List<OrderForm>) request.getSession().getAttribute("orderInfo");
		Integer status = (Integer) request.getSession().getAttribute("status");
		orderStatus.put(orderId, status);
		String url="http://"+request.getHeader("host")+"/Gstore/web/action/pay/qrcode/abc/"+orderId;
		String content = url; 
		BarcodeFormat barcodeFormat = BarcodeFormat.QR_CODE;
		int width = 300;
		int height = 300;
		Map<EncodeHintType, ?> hints = new HashMap<>();

		
		BufferedImage image;
		image = new ZXingCode().getQR_CODEBufferedImage(content, barcodeFormat, width, height, hints);

		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
		encoder.encode(image);
	}
	@RequestMapping("/pay/qrcode/ok")
	@ResponseBody
	public AskResult<Void> ok(HttpServletRequest request){
		AskResult<Void> askResult=new AskResult<>();
		String orderId = (String) request.getSession().getAttribute("orderId");
		if(orderStatus.get(orderId)==1) {
			if(orderService.updateOrderStatus(orderId, 1)) {
				askResult.setCode(1);
			}else {
				askResult.setCode(0);
			}
		}else {
			askResult.setCode(0);
		}
		return askResult;
	}
	@RequestMapping("/pay/qrcode/abc/{orderId}")
	public String pay(@PathVariable String orderId,HttpServletResponse response){
		orderStatus.put(orderId, 1);
		return "pay_ok";
	}
}
