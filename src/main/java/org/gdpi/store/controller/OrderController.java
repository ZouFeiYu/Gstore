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
	 * ��������ݸ�ʽΪ{"id":"10000014","count":1},{"id":"10000014","count":1}...
	 * ������һ����Ʒʱ,��ܻ������{"id":"10000014","count":1}���м䶺���жϱ�����μ�¼���ݲ��ܰ�������������.
	 * �����.length�ж�,�򵱴���һ����Ʒ��¼,length=2,��������Ʒ����ʱ,length=2,����
	 * */
	public AskResult<Void> orderConfirm(String[] orders,HttpSession session) {
		AskResult<Void> askResult = new AskResult<>();
		if(orders==null||orders.length==0) {
			askResult.setCode(-1);
			askResult.setMsg("û����Ʒ");
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
		
		//����Ϣд��session,��ת��֧������,
		try {
			session.setAttribute("orderInfo", orderService.selectGoodToOrder(ofs));
			askResult.setCode(1);
			askResult.setMsg("����׼���ɹ�");
		} catch (Exception e) {
			e.printStackTrace();
			askResult.setCode(0);
			askResult.setMsg("����׼��ʧ��");
		}
		return askResult;
	}
	@RequestMapping("confirm")
	@ResponseBody
	public AskResult<Void> confirm(int addrId,HttpServletRequest request){
		AskResult<Void> askResult=new AskResult<>();
		//��������id
		String orderId=UUID.randomUUID().toString().replaceAll("-", "");
		//��ȡ��������
		List<OrderForm> ofs=(List<OrderForm>) request.getSession().getAttribute("orderInfo");
		//����״̬
		int status=-1;
		//��ȡ��ǰ�û�
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
			askResult.setMsg("�����������");
		}else {
			askResult.setCode(0);
			askResult.setMsg("��������ʧ��");
		}
		return askResult;
	}
	
}
