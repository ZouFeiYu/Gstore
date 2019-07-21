package org.gdpi.store.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.gdpi.store.bean.AskResult;
import org.gdpi.store.bean.OrderForm;
import org.gdpi.store.bean.User;
import org.gdpi.store.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/action/order")
public class OrderController {
	@Resource
	OrderService orderService;
	@RequestMapping("/creat")
	@ResponseBody
	/*TODO BUG
	 * 传入的数据格式为{"id":"10000014","count":1},{"id":"10000014","count":1}...
	 * 当传入一件商品时,框架会把数据{"id":"10000014","count":1}从中间逗号切断变成两段记录数据不能按需求完整传入.
	 * 如果用.length判断,则当传入一件商品记录,length=2,当两件商品传入时,length=2,不可
	 * */
	public AskResult<Void> orderConfirm(String[] orders,HttpSession session) {
		AskResult<Void> askResult = new AskResult<>();
		if(orders==null||orders.length==0) {
			askResult.setCode(-1);
			askResult.setMsg("没有商品");
			return askResult;
		}
		List<OrderForm> ofs=new ArrayList<>();
		for(int i=0;i<orders.length;i++) {
			OrderForm of=new OrderForm();
			System.out.println(orders[i]);
			JSONObject jsonObject=JSONObject.fromObject(orders[i]);
			of.setId((String) jsonObject.get("id"));
			of.setCount((int) jsonObject.get("count"));
			ofs.add(of);
		}
		
		//把信息写入session,跳转到支付界面,
		try {
			session.setAttribute("orderInfo", orderService.selectGoodToOrder(ofs));
			askResult.setCode(1);
			askResult.setMsg("订单准备成功");
		} catch (Exception e) {
			e.printStackTrace();
			askResult.setCode(0);
			askResult.setMsg("订单准备失败");
		}
		return askResult;
	}
	@RequestMapping("confirm")
	@ResponseBody
	public AskResult<Void> confirm(int addrId,HttpServletRequest request){
		AskResult<Void> askResult=new AskResult<>();
		//创建订单id
		String orderId=UUID.randomUUID().toString().replaceAll("-", "");
		//获取订单数据
		List<OrderForm> ofs=(List<OrderForm>) request.getSession().getAttribute("orderInfo");
		//订单状态
		int status=-1;
		//获取当前用户
		User user=(User) request.getSession().getAttribute("onLineUser");
		int price=0;
		if(orderService.addOrder(orderId, user.getId(), addrId, status, ofs)) {
			for(OrderForm of:ofs) {
				price=price+(of.getPrice()*of.getCount());
			}
			request.getSession().setAttribute("orderId", orderId);
			request.getSession().setAttribute("orderPrice", price);
			request.getSession().setAttribute("status", status);
			askResult.setCode(1);
			askResult.setMsg("创建订单完成");
		}else {
			askResult.setCode(0);
			askResult.setMsg("创建订单失败");
		}
		return askResult;
	}
	
}
